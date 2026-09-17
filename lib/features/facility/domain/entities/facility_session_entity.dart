import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_service_level.dart';

part 'facility_session_entity.freezed.dart';

/// How many people have booked a scheduled session.
///
/// Only surfaced on the Calendar variant — the Schedule variant hides it by
/// product rule, not because the data is missing.
@freezed
abstract class FacilitySessionCapacityEntity with _$FacilitySessionCapacityEntity {
  const FacilitySessionCapacityEntity._();

  const factory FacilitySessionCapacityEntity({
    required int booked,
    required int total,

    /// People queued for a spot. Only meaningful once the session is full.
    @Default(0) int waitlistCount,
  }) = _FacilitySessionCapacityEntity;

  /// Fill ratio of the capacity bar, clamped to `0..1`.
  double get fillFraction => total <= 0 ? 0 : (booked / total).clamp(0.0, 1.0);

  bool get isFull => total > 0 && booked >= total;

  /// A waitlist is only shown for a fully booked session.
  bool get hasWaitlist => isFull && waitlistCount > 0;
}

/// A single scheduled occurrence of a service — one card in the
/// Schedule/Calendar timeline.
///
/// [colorHex] is the accent the facility picked for the session and drives the
/// card tint, title, and capacity bar. It is sent per session rather than
/// derived from [level] so a facility can colour-code sessions that have no
/// level at all (e.g. Pro activities).
@freezed
abstract class FacilitySessionEntity with _$FacilitySessionEntity {
  const FacilitySessionEntity._();

  const factory FacilitySessionEntity({
    required int id,
    required int serviceId,
    required String name,
    required DateTime startsAt,
    required DateTime endsAt,
    required String colorHex,
    @Default(0) int facilityId,
    @Default(false) bool isRecurring,
    FacilityServiceLevel? level,
    @Default(false) bool isLadiesOnly,
    @Default(<String>[]) List<String> instructorNames,
    FacilitySessionCapacityEntity? capacity,
  }) = _FacilitySessionEntity;

  /// The calendar day this session belongs to, normalized to midnight so it
  /// can be used as a grouping key.
  DateTime get day => DateTime(startsAt.year, startsAt.month, startsAt.day);
}
