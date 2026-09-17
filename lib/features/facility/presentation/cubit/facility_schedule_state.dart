import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';

part 'facility_schedule_state.freezed.dart';

@freezed
abstract class FacilityScheduleState with _$FacilityScheduleState {
  const FacilityScheduleState._();

  const factory FacilityScheduleState({
    /// The day whose sessions the timeline is showing.
    required DateTime selectedDay,

    /// First day of the loaded window, inclusive — also the first day chip.
    required DateTime windowStart,

    /// Last day of the loaded window, inclusive.
    required DateTime windowEnd,

    required FacilityServiceType selectedType,
    @Default(AsyncState.idle()) AsyncState<FacilityScheduleEntity> scheduleRequest,
  }) = _FacilityScheduleState;

  /// Every day rendered in the day strip, in order.
  ///
  /// Stepped through the `DateTime` constructor rather than by adding 24 hours,
  /// so a DST transition inside the window cannot shift a day off midnight and
  /// break equality with the mapped sessions' day keys.
  List<DateTime> get visibleDays {
    final days = <DateTime>[];
    for (
      var day = windowStart;
      !day.isAfter(windowEnd);
      day = DateTime(day.year, day.month, day.day + 1)
    ) {
      days.add(day);
    }
    return days;
  }

  /// Whether the month stepper can go back.
  ///
  /// Past slots are not browsable: once the window opens on today there is
  /// nothing earlier to show, so stepping back is only possible after having
  /// stepped forward.
  bool get canShowPreviousMonth {
    final now = DateTime.now();
    return windowStart.isAfter(DateTime(now.year, now.month, now.day));
  }

  /// Loaded schedule, or null while idle/loading/errored.
  FacilityScheduleEntity? get schedule => scheduleRequest.dataOrNull;

  List<FacilitySessionEntity> get selectedDaySessions =>
      schedule?.sessionsOn(selectedDay) ?? const [];
}
