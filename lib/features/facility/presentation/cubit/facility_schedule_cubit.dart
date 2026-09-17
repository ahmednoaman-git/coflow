import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../../domain/use_cases/use_cases.dart';
import 'facility_schedule_config.dart';
import 'facility_schedule_state.dart';

/// Drives the Schedule/Calendar tab.
///
/// Both variants render one **window** of days and group locally, so picking a
/// day in the strip never waits on the network — but they are backed by
/// different shapes:
///
/// - **Calendar** (premium) fetches dated sessions a month at a time, and
///   refetches when the month or listing type changes.
/// - **Schedule** (Flow basic) is a recurring weekly cycle: `schedule/{id}`
///   returns a pattern with no dates, so the window is simply the coming seven
///   days — one of each weekday — and there is nothing to page through.
@injectable
class FacilityScheduleCubit extends Cubit<FacilityScheduleState> {
  FacilityScheduleCubit(
    this._getFacilitySessions,
    this._getWeeklySchedule,
    @factoryParam this._facilityId,
    @factoryParam this.config,
  ) : super(_initialState(config)) {
    _initManagers();
  }

  final GetFacilitySessionsUseCase _getFacilitySessions;
  final GetFacilityWeeklyScheduleUseCase _getWeeklySchedule;
  final int _facilityId;
  final FacilityScheduleConfig config;

  /// The Schedule variant shows exactly one turn of the weekly cycle: seven
  /// days from today, which covers each weekday once.
  static const int _weeklyWindowDays = 7;

  late final AsyncRequestManager<FacilityScheduleState, FacilityScheduleEntity> scheduleManager;

  static FacilityScheduleState _initialState(FacilityScheduleConfig config) {
    final today = _dayOf(DateTime.now());
    final (windowStart, windowEnd) = config.isCalendar
        ? _monthWindow(today, today)
        : _weeklyWindow(today);

    return FacilityScheduleState(
      selectedDay: today,
      windowStart: windowStart,
      windowEnd: windowEnd,
      selectedType: config.initialType,
    );
  }

  void _initManagers() {
    scheduleManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.scheduleRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(scheduleRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      defaultRequest: _requestFor(state),
    );
  }

  AsyncTask<FacilityScheduleEntity> _requestFor(FacilityScheduleState state) {
    if (!config.isCalendar) {
      return _getWeeklySchedule(
        GetFacilityWeeklyScheduleDto(
          facilityId: _facilityId,
          windowStart: state.windowStart,
          windowEnd: state.windowEnd,
          type: state.selectedType,
        ),
      );
    }

    return _getFacilitySessions(
      GetFacilitySessionsDto(
        facilityId: _facilityId,
        startDate: state.windowStart,
        endDate: state.windowEnd,
        type: state.selectedType,
      ),
    );
  }

  /// Selects a day in the strip. Stays local unless the day sits outside the
  /// loaded window, which only happens if a caller jumps somewhere far.
  void selectDay(DateTime day) {
    final normalized = _dayOf(day);
    if (normalized == state.selectedDay) return;

    if (normalized.isBefore(state.windowStart) || normalized.isAfter(state.windowEnd)) {
      _loadWindowContaining(normalized);
      return;
    }

    emit(state.copyWith(selectedDay: normalized));
  }

  /// Switches between the facility's listing types (Pro's Activities/Courses
  /// toggle). Refetches the same window for the new type.
  ///
  /// TODO(backend): neither endpoint filters by type server-side — Calendar's
  /// stub ignores it and the weekly schedule is narrowed in the mapper — so a
  /// per-type cache would save the round trip entirely. Worth doing once the
  /// Calendar endpoint is real.
  void selectType(FacilityServiceType type) {
    if (type == state.selectedType) return;

    emit(state.copyWith(selectedType: type));
    scheduleManager.execute(_requestFor(state));
  }

  /// No-op when the window already starts today — past slots are not browsable
  /// (product rule), so there is nothing earlier to step back to.
  void showPreviousMonth() {
    if (!state.canShowPreviousMonth) return;
    _showMonth(_shiftMonth(state.selectedDay, -1));
  }

  void showNextMonth() => _showMonth(_shiftMonth(state.selectedDay, 1));

  Future<void> refresh() => scheduleManager.refresh();

  /// Moves the window to the month containing [monthDay] and selects today
  /// when it falls in that month, otherwise its first day.
  void _showMonth(DateTime monthDay) {
    final today = _dayOf(DateTime.now());
    final (windowStart, windowEnd) = _monthWindow(monthDay, today);
    final selected = !today.isBefore(windowStart) && !today.isAfter(windowEnd)
        ? today
        : windowStart;

    emit(
      state.copyWith(
        selectedDay: selected,
        windowStart: windowStart,
        windowEnd: windowEnd,
      ),
    );
    scheduleManager.execute(_requestFor(state));
  }

  void _loadWindowContaining(DateTime day) {
    final (windowStart, windowEnd) = config.isCalendar
        ? _monthWindow(day, _dayOf(DateTime.now()))
        : _weeklyWindow(day);

    emit(
      state.copyWith(
        selectedDay: day,
        windowStart: windowStart,
        windowEnd: windowEnd,
      ),
    );
    scheduleManager.execute(_requestFor(state));
  }

  /// The month containing [day], trimmed so it never starts before [today] —
  /// the current month opens on today rather than on the 1st.
  static (DateTime, DateTime) _monthWindow(DateTime day, DateTime today) {
    final monthStart = DateTime(day.year, day.month);
    // Day 0 of the next month is the last day of this one.
    final end = DateTime(day.year, day.month + 1, 0);

    return (monthStart.isBefore(today) ? today : monthStart, end);
  }

  /// Seven days from [day] — each weekday of the recurring cycle exactly once,
  /// starting on today rather than on a fixed weekday so the tab opens on the
  /// user's own day.
  static (DateTime, DateTime) _weeklyWindow(DateTime day) {
    final start = _dayOf(day);
    return (start, DateTime(start.year, start.month, start.day + _weeklyWindowDays - 1));
  }

  static DateTime _shiftMonth(DateTime day, int months) => DateTime(day.year, day.month + months);

  static DateTime _dayOf(DateTime date) => DateTime(date.year, date.month, date.day);
}
