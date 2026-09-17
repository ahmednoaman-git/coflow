import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const CalendarState._();

  const factory CalendarState({
    /// First day of the loaded window, inclusive — always today, since past
    /// reservations are not browsable.
    required DateTime windowStart,

    /// Last day of the loaded window, inclusive.
    required DateTime windowEnd,

    /// The day the user picked, or null before they pick one — the screen then
    /// opens on the first day carrying a reservation, see [focusedDay].
    DateTime? selectedDay,

    @Default(AsyncState.idle()) AsyncState<ReservationCalendarEntity> calendarRequest,
  }) = _CalendarState;

  /// Loaded reservations, or null while idle/loading/errored.
  ReservationCalendarEntity? get calendar => calendarRequest.dataOrNull;

  /// The day the timeline is showing.
  ///
  /// Until the user picks one this is the first upcoming reservation's day,
  /// falling back to today while the window is still loading or empty.
  DateTime get focusedDay => selectedDay ?? calendar?.firstBookedDay ?? today;

  /// Sunday of the focused day's week — the first chip in the strip.
  DateTime get weekStart => startOfWeek(focusedDay);

  /// The seven chips of the focused week, in order.
  List<DateTime> get visibleDays => [
    for (var offset = 0; offset < 7; offset++) weekStart.add(Duration(days: offset)),
  ];

  /// Days the strip renders as selectable. Null while the window has not
  /// loaded, so nothing is dimmed until we actually know.
  Set<DateTime>? get bookedDays => calendar?.bookedDays;

  List<ReservationEntity> get focusedDayReservations =>
      calendar?.reservationsOn(focusedDay) ?? const [];

  /// Whether the stepper can go back a week.
  ///
  /// The calendar only moves forward: the current week is as far back as it
  /// goes, so stepping back is only possible after having stepped forward.
  bool get canShowPreviousWeek => weekStart.isAfter(startOfWeek(today));

  /// Whether [day] falls outside the window that has been fetched, in which
  /// case the reservations for it are not loaded yet.
  bool isOutsideWindow(DateTime day) => day.isBefore(windowStart) || day.isAfter(windowEnd);

  static DateTime get today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// Weeks run Sunday to Saturday, matching the design.
  static DateTime startOfWeek(DateTime day) => day.subtract(Duration(days: day.weekday % 7));
}
