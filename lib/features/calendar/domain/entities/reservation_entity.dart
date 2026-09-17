import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_entity.freezed.dart';

/// A level badge on a reservation, e.g. `BEGINNER` in the facility's colour.
@freezed
abstract class ReservationLevelEntity with _$ReservationLevelEntity {
  const factory ReservationLevelEntity({
    required String name,
    required String colorHex,
  }) = _ReservationLevelEntity;
}

/// One booked slot in the user's calendar.
///
/// Unlike a facility's own schedule, this timeline spans facilities, so every
/// reservation carries the facility it belongs to — the card leads with
/// [facilityName] and only then names the service.
///
/// [colorHex] is the accent the facility picked for the slot and drives the
/// card tint and its text, same as on the facility Schedule tab.
@freezed
abstract class ReservationEntity with _$ReservationEntity {
  const ReservationEntity._();

  const factory ReservationEntity({
    required int id,
    required int facilityId,
    required String facilityName,
    required String serviceName,
    required DateTime startsAt,
    required DateTime endsAt,
    required String colorHex,
    String? facilityLogoUrl,
    ReservationLevelEntity? level,
    @Default(<String>[]) List<String> instructorNames,
  }) = _ReservationEntity;

  /// The calendar day this reservation belongs to, normalized to midnight so it
  /// can be used as a grouping key.
  DateTime get day => DateTime(startsAt.year, startsAt.month, startsAt.day);
}

/// Every reservation the user holds between [windowStart] and [windowEnd]
/// (both inclusive, normalized to midnight).
///
/// The window is fetched in one go and days are switched locally, so moving
/// through the strip never waits on the network.
@freezed
abstract class ReservationCalendarEntity with _$ReservationCalendarEntity {
  const ReservationCalendarEntity._();

  const factory ReservationCalendarEntity({
    required DateTime windowStart,
    required DateTime windowEnd,

    /// Chronologically sorted across the whole window.
    required List<ReservationEntity> reservations,
  }) = _ReservationCalendarEntity;

  /// Reservations starting on [day], in chronological order.
  List<ReservationEntity> reservationsOn(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return reservations.where((reservation) => reservation.day == key).toList(growable: false);
  }

  /// Every day that holds at least one reservation — what the strip renders as
  /// selectable.
  Set<DateTime> get bookedDays => {for (final reservation in reservations) reservation.day};

  /// The day the calendar opens on: the first one carrying a reservation.
  ///
  /// Null when the window is empty, in which case the caller falls back to
  /// today.
  DateTime? get firstBookedDay => reservations.isEmpty ? null : reservations.first.day;
}
