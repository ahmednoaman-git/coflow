import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_session_entity.dart';

part 'facility_schedule_entity.freezed.dart';

/// Every session a facility runs between [windowStart] and [windowEnd]
/// (both inclusive, normalized to midnight).
///
/// The UI fetches a whole window at once and switches days locally, so day
/// selection never waits on the network.
@freezed
abstract class FacilityScheduleEntity with _$FacilityScheduleEntity {
  const FacilityScheduleEntity._();

  const factory FacilityScheduleEntity({
    required DateTime windowStart,
    required DateTime windowEnd,

    /// Chronologically sorted across the whole window.
    required List<FacilitySessionEntity> sessions,
  }) = _FacilityScheduleEntity;

  /// Sessions starting on [day], in chronological order.
  List<FacilitySessionEntity> sessionsOn(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return sessions.where((session) => session.day == key).toList(growable: false);
  }

  bool hasSessionsOn(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return sessions.any((session) => session.day == key);
  }
}
