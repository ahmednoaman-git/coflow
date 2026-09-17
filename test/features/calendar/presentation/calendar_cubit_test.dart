import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/calendar/domain/dtos/dtos.dart';
import 'package:coflow_users_v2/features/calendar/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/calendar/domain/repositories/repositories.dart';
import 'package:coflow_users_v2/features/calendar/domain/use_cases/use_cases.dart';
import 'package:coflow_users_v2/features/calendar/presentation/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

DateTime _dayOf(DateTime date) => DateTime(date.year, date.month, date.day);

final _today = _dayOf(DateTime.now());

ReservationEntity _reservationOn(DateTime day) => ReservationEntity(
  id: day.millisecondsSinceEpoch ~/ 1000,
  facilityId: 1,
  facilityName: 'Happy Horse',
  serviceName: 'Pony Ride',
  startsAt: DateTime(day.year, day.month, day.day, 18),
  endsAt: DateTime(day.year, day.month, day.day, 19),
  colorHex: '#2F9BE8',
);

/// Records every window the cubit asks for and answers with reservations on
/// the days it was seeded with.
class _RecordingRepository implements ReservationRepository {
  _RecordingRepository(this.bookedDays);

  final List<DateTime> bookedDays;
  final requests = <GetReservationsDto>[];

  @override
  AsyncTask<ReservationCalendarEntity> getReservations(GetReservationsDto dto) {
    requests.add(dto);
    return TaskEither.right(
      ReservationCalendarEntity(
        windowStart: dto.startDate,
        windowEnd: dto.endDate,
        reservations: bookedDays
            .where((day) => !day.isBefore(dto.startDate) && !day.isAfter(dto.endDate))
            .map(_reservationOn)
            .toList(),
      ),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

({CalendarCubit cubit, _RecordingRepository repository}) _build(List<DateTime> bookedDays) {
  final repository = _RecordingRepository(bookedDays);
  final cubit = CalendarCubit(GetReservationsUseCase(repository));
  return (cubit: cubit, repository: repository);
}

void main() {
  group('CalendarCubit', () {
    test('opens on the first upcoming reservation, not today', () async {
      final firstBooked = _today.add(const Duration(days: 9));
      final (:cubit, :repository) = _build([firstBooked, _today.add(const Duration(days: 20))]);
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.focusedDay, firstBooked);
      expect(cubit.state.weekStart, CalendarState.startOfWeek(firstBooked));
    });

    test('falls back to today while nothing is booked', () async {
      final (:cubit, :repository) = _build([]);
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.focusedDay, _today);
    });

    test('loads a single forward window starting today', () async {
      final (:cubit, :repository) = _build([_today.add(const Duration(days: 3))]);
      await Future<void>.delayed(Duration.zero);

      expect(repository.requests, hasLength(1));
      expect(repository.requests.single.startDate, _today);
      expect(repository.requests.single.endDate.isAfter(_today), isTrue);
    });

    test('stepping back from the opening week is a no-op', () async {
      final (:cubit, :repository) = _build([_today]);
      await Future<void>.delayed(Duration.zero);

      final weekStart = cubit.state.weekStart;
      expect(cubit.state.canShowPreviousWeek, isFalse);

      cubit.showPreviousWeek();

      expect(cubit.state.weekStart, weekStart);
    });

    test('stepping forward then back returns to the opening week', () async {
      final (:cubit, :repository) = _build([_today.add(const Duration(days: 1))]);
      await Future<void>.delayed(Duration.zero);

      final weekStart = cubit.state.weekStart;

      cubit.showNextWeek();
      expect(cubit.state.weekStart, weekStart.add(const Duration(days: 7)));
      expect(cubit.state.canShowPreviousWeek, isTrue);

      cubit.showPreviousWeek();
      expect(cubit.state.weekStart, weekStart);
    });

    test('stepping into a week focuses its first booked day', () async {
      final nextWeekBooking = CalendarState.startOfWeek(
        _today,
      ).add(const Duration(days: 7 + 4));
      final (:cubit, :repository) = _build([_today, nextWeekBooking]);
      await Future<void>.delayed(Duration.zero);

      cubit.showNextWeek();

      expect(cubit.state.focusedDay, nextWeekBooking);
    });

    test('a week with nothing booked focuses its first day and reads as empty', () async {
      final (:cubit, :repository) = _build([_today]);
      await Future<void>.delayed(Duration.zero);

      cubit.showNextWeek();

      expect(cubit.state.focusedDay, cubit.state.weekStart);
      expect(cubit.state.focusedDayReservations, isEmpty);
    });

    test('stepping within the loaded window does not refetch', () async {
      final (:cubit, :repository) = _build([_today]);
      await Future<void>.delayed(Duration.zero);

      cubit
        ..showNextWeek()
        ..showNextWeek();
      await Future<void>.delayed(Duration.zero);

      expect(repository.requests, hasLength(1));
    });

    test('stepping past the loaded window extends it and refetches', () async {
      final (:cubit, :repository) = _build([_today]);
      await Future<void>.delayed(Duration.zero);

      final windowEnd = cubit.state.windowEnd;
      // Walk past the end of the window a week at a time.
      final weeksToWalk = windowEnd.difference(cubit.state.weekStart).inDays ~/ 7 + 1;
      for (var week = 0; week < weeksToWalk; week++) {
        cubit.showNextWeek();
      }
      await Future<void>.delayed(Duration.zero);

      expect(repository.requests, hasLength(2));
      expect(cubit.state.windowEnd.isAfter(windowEnd), isTrue);
      expect(repository.requests.last.endDate, cubit.state.windowEnd);
    });
  });
}
