import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class FacilityScheduleMapper {
  /// Neutral accent used when the API sends no colour for a session.
  static const String fallbackColorHex = '#5BC5F2';

  static FacilityScheduleEntity toEntity(
    FacilitySessionsResponseModel model,
    GetFacilitySessionsDto dto,
  ) {
    final sessions =
        model.sessions
            .map((model) => _toSessionEntity(model).copyWith(facilityId: dto.facilityId))
            .toList()
          ..sort((a, b) => a.startsAt.compareTo(b.startsAt));

    return FacilityScheduleEntity(
      windowStart: _dayOf(dto.startDate),
      windowEnd: _dayOf(dto.endDate),
      sessions: List.unmodifiable(sessions),
    );
  }

  static FacilitySessionEntity _toSessionEntity(FacilitySessionModel model) {
    return FacilitySessionEntity(
      id: model.id,
      serviceId: model.serviceId,
      name: model.name,
      startsAt: model.startsAt,
      endsAt: model.endsAt,
      colorHex: model.color?.isNotEmpty ?? false ? model.color! : fallbackColorHex,
      level: _toLevel(model.level),
      isLadiesOnly: model.ladiesOnly ?? false,
      instructorNames: model.instructors
          .map((instructor) => '${instructor.firstName} ${instructor.lastName}')
          .toList(growable: false),
      capacity: _toCapacity(model.capacity),
    );
  }

  /// A session's level stays null when the API omits it — unlike service
  /// listings there is no all-levels fallback, since Pro activities are
  /// legitimately level-less.
  static FacilityServiceLevel? _toLevel(FacilityServiceLevelModel? model) {
    if (model == null) return null;
    return FacilityServiceLevel.custom(name: model.name, colorHex: model.color ?? '');
  }

  static FacilitySessionCapacityEntity? _toCapacity(FacilitySessionCapacityModel? model) {
    if (model == null) return null;
    return FacilitySessionCapacityEntity(
      booked: model.booked,
      total: model.total,
      waitlistCount: model.waitlist ?? 0,
    );
  }

  static DateTime _dayOf(DateTime date) => DateTime(date.year, date.month, date.day);
}
