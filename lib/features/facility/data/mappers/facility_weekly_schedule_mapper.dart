import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../models/models.dart';
import 'facility_schedule_mapper.dart';

/// Turns the recurring weekly slots from `schedule/{facilityId}` into the dated
/// sessions the timeline renders.
///
/// The endpoint describes a *pattern* — "every Sunday, 09:00–10:00" — with no
/// dates, no capacity and no date/type filtering. So this mapper does three
/// things the API does not: it drops inactive slots and slots of the wrong
/// listing type, it projects each remaining slot onto every day in the
/// requested window that falls on its weekday, and it derives the session
/// accent from the service's level colour (the endpoint sends no per-session
/// hex).
///
/// Capacity stays null throughout — the endpoint carries no booking counts, so
/// the capacity bar simply does not render.
abstract final class FacilityWeeklyScheduleMapper {
  static FacilityScheduleEntity toEntity(
    List<FacilityScheduleSlotModel> models,
    GetFacilityWeeklyScheduleDto dto,
  ) {
    final windowStart = _dayOf(dto.windowStart);
    final windowEnd = _dayOf(dto.windowEnd);

    final slots = models
        .where((slot) => _isActive(slot) && _matchesType(slot, dto.type))
        .toList(growable: false);

    final sessions = <FacilitySessionEntity>[];

    for (var day = windowStart; !day.isAfter(windowEnd); day = _nextDay(day)) {
      for (final slot in slots) {
        if (_weekdayOf(slot) != day.weekday) continue;

        final session = _toSessionEntity(slot, day);
        if (session != null) {
          sessions.add(session.copyWith(facilityId: dto.facilityId, isRecurring: true));
        }
      }
    }

    sessions.sort((a, b) => a.startsAt.compareTo(b.startsAt));

    return FacilityScheduleEntity(
      windowStart: windowStart,
      windowEnd: windowEnd,
      sessions: List.unmodifiable(sessions),
    );
  }

  /// One occurrence of [slot] on [day], or null when the slot's clock times are
  /// unparseable — a malformed row is skipped rather than failing the window.
  static FacilitySessionEntity? _toSessionEntity(FacilityScheduleSlotModel slot, DateTime day) {
    final from = _parseTime(slot.from);
    final to = _parseTime(slot.to);
    if (from == null || to == null) return null;

    final startsAt = DateTime(day.year, day.month, day.day, from.$1, from.$2);
    var endsAt = DateTime(day.year, day.month, day.day, to.$1, to.$2);

    // A slot ending at or before its start runs past midnight.
    if (!endsAt.isAfter(startsAt)) {
      endsAt = DateTime(day.year, day.month, day.day + 1, to.$1, to.$2);
    }

    final service = slot.service;
    final level = service?.level;

    return FacilitySessionEntity(
      id: slot.id,
      serviceId: service?.id ?? slot.serviceId ?? 0,
      name: service?.name ?? '',
      startsAt: startsAt,
      endsAt: endsAt,
      // No per-session hex on this endpoint, so the level colour is the accent.
      colorHex: _accentHex(level),
      level: _toLevel(level),
      isLadiesOnly: slot.ladiesOnly ?? false,
      instructorNames: slot.instructors
          .map((instructor) => '${instructor.firstName} ${instructor.lastName}'.trim())
          .where((name) => name.isNotEmpty)
          .toList(growable: false),
    );
  }

  static bool _isActive(FacilityScheduleSlotModel slot) {
    final status = slot.status?.trim().toLowerCase();
    // Absent status is treated as active — only an explicit non-active hides a
    // slot, so a new status value never silently empties the schedule.
    return status == null || status.isEmpty || status == 'active';
  }

  /// Slots whose service type is missing are kept: the toggle only exists for
  /// facilities that schedule more than one type, and dropping untyped rows
  /// would empty the tab for everyone else.
  static bool _matchesType(FacilityScheduleSlotModel slot, FacilityServiceType type) {
    final slotType = FacilityServiceType.fromApi(slot.service?.type);
    return slotType == null || slotType == type;
  }

  /// The slot's weekday as `DateTime.monday`…`DateTime.sunday`.
  ///
  /// Read from the weekday name; [FacilityScheduleSlotModel.dayInt] is only a
  /// fallback because it indexes a week that starts on Saturday rather than
  /// Dart's Monday.
  static int? _weekdayOf(FacilityScheduleSlotModel slot) =>
      _weekdayByName[slot.day.trim().toLowerCase()] ?? _weekdayByApiIndex[slot.dayInt];

  static String _accentHex(FacilityServiceLevelModel? level) {
    final color = level?.color;
    return color != null && color.isNotEmpty ? color : FacilityScheduleMapper.fallbackColorHex;
  }

  /// Mirrors [FacilityScheduleMapper]: a slot's level stays null when the API
  /// omits it, since level-less listings are legitimate.
  static FacilityServiceLevel? _toLevel(FacilityServiceLevelModel? model) {
    if (model == null) return null;
    return FacilityServiceLevel.custom(name: model.name, colorHex: model.color ?? '');
  }

  /// `(hour, minute)` from an `HH:mm:ss` clock time, or null if malformed.
  static (int, int)? _parseTime(String value) {
    final parts = value.split(':');
    if (parts.length < 2) return null;

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);
    if (hour == null || minute == null) return null;
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return null;

    return (hour, minute);
  }

  static DateTime _dayOf(DateTime date) => DateTime(date.year, date.month, date.day);

  /// Steps a day via the constructor rather than `add(Duration(days: 1))`, so a
  /// DST transition inside the window cannot shift midnight.
  static DateTime _nextDay(DateTime day) => DateTime(day.year, day.month, day.day + 1);
}

const Map<String, int> _weekdayByName = {
  'monday': DateTime.monday,
  'tuesday': DateTime.tuesday,
  'wednesday': DateTime.wednesday,
  'thursday': DateTime.thursday,
  'friday': DateTime.friday,
  'saturday': DateTime.saturday,
  'sunday': DateTime.sunday,
};

/// The API's `day_int`, whose week starts on Saturday.
const Map<int?, int> _weekdayByApiIndex = {
  1: DateTime.saturday,
  2: DateTime.sunday,
  3: DateTime.monday,
  4: DateTime.tuesday,
  5: DateTime.wednesday,
  6: DateTime.thursday,
  7: DateTime.friday,
};
