import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'calendar_state.dart';

/// Drives the account Calendar screen.
///
/// Reservations are fetched a **window** at a time and grouped locally, so
/// stepping between weeks never waits on the network. Only walking past the
/// end of the loaded window refetches.
@injectable
class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit(this._getReservations) : super(_initialState()) {
    _configureManager(autoExecute: true);
  }

  int _requestRevision = 0;

  void _configureManager({bool autoExecute = false}) {
    final revision = ++_requestRevision;
    calendarManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.calendarRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(calendarRequest: partial),
      ),
      emit: (next) {
        if (revision == _requestRevision) _emitIfOpen(next);
      },
      autoExecute: autoExecute,
      defaultRequest: _requestFor(state),
    );
  }

  final GetReservationsUseCase _getReservations;

  /// How far ahead reservations are loaded in one go. Wide enough that the
  /// opening week and a good stretch of forward stepping are already in hand.
  static const int _windowDays = 31;

  late AsyncRequestManager<CalendarState, ReservationCalendarEntity> calendarManager;

  static CalendarState _initialState() {
    final today = CalendarState.today;
    return CalendarState(
      windowStart: today,
      windowEnd: today.add(const Duration(days: _windowDays)),
    );
  }

  AsyncTask<ReservationCalendarEntity> _requestFor(CalendarState state) =>
      _getReservations(GetReservationsDto(startDate: state.windowStart, endDate: state.windowEnd));

  /// Picks a day in the strip. Days with no reservations are not selectable in
  /// the UI, so this only ever lands on a booked day.
  void selectDay(DateTime day) {
    final normalized = _dayOf(day);
    if (normalized == state.focusedDay) return;

    emit(state.copyWith(selectedDay: normalized));
  }

  /// No-op while the strip is on the current week — the past is not browsable.
  void showPreviousWeek() {
    if (!state.canShowPreviousWeek) return;
    _showWeek(state.weekStart.subtract(const Duration(days: 7)));
  }

  void showNextWeek() => _showWeek(state.weekStart.add(const Duration(days: 7)));

  Future<void> refresh() async {
    if (calendarManager.isLoading) return;
    _configureManager();
    await calendarManager.execute();
  }

  void _emitIfOpen(CalendarState next) {
    if (!isClosed) emit(next);
  }

  /// Moves to the week starting [weekStart], focusing its first booked day so
  /// the timeline lands on something wherever possible. Weeks with nothing
  /// booked focus their first day and read as empty.
  void _showWeek(DateTime weekStart) {
    final days = [
      for (var offset = 0; offset < 7; offset++) weekStart.add(Duration(days: offset)),
    ];
    final booked = state.calendar?.bookedDays ?? const <DateTime>{};

    emit(
      state.copyWith(
        selectedDay: days.where(booked.contains).firstOrNull ?? weekStart,
      ),
    );

    // Stepping past the loaded window extends it rather than showing days we
    // simply have not asked about yet.
    final firstRelevantDay = days.first.isBefore(CalendarState.today)
        ? CalendarState.today
        : days.first;
    if (state.isOutsideWindow(days.last) || state.isOutsideWindow(firstRelevantDay)) {
      _extendWindowTo(days.last);
    }
  }

  void _extendWindowTo(DateTime day) {
    final firstDay = CalendarState.startOfWeek(day);
    emit(
      state.copyWith(
        windowStart: firstDay.isBefore(CalendarState.today) ? CalendarState.today : firstDay,
        windowEnd: day.add(const Duration(days: _windowDays)),
      ),
    );
    _configureManager();
    calendarManager.execute();
  }

  static DateTime _dayOf(DateTime date) => DateTime(date.year, date.month, date.day);
}
