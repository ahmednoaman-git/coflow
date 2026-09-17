import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/dtos/dtos.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:coflow_users_v2/features/facility/domain/repositories/repositories.dart';
import 'package:coflow_users_v2/features/facility/domain/use_cases/use_cases.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

typedef _WindowRequest = ({DateTime start, DateTime end, FacilityServiceType type});

/// Records every window the cubit asks for and answers with an empty schedule.
///
/// Both variants are recorded into one list: a cubit only ever takes one of the
/// two paths, so the list doubles as "how many times did it fetch".
class _RecordingRepository implements FacilityRepository {
  final requests = <_WindowRequest>[];

  @override
  AsyncTask<FacilityScheduleEntity> getFacilitySessions(GetFacilitySessionsDto dto) =>
      _record(dto.startDate, dto.endDate, dto.type);

  @override
  AsyncTask<FacilityScheduleEntity> getFacilityWeeklySchedule(
    GetFacilityWeeklyScheduleDto dto,
  ) => _record(dto.windowStart, dto.windowEnd, dto.type);

  AsyncTask<FacilityScheduleEntity> _record(
    DateTime start,
    DateTime end,
    FacilityServiceType type,
  ) {
    requests.add((start: start, end: end, type: type));
    return TaskEither.right(
      FacilityScheduleEntity(windowStart: start, windowEnd: end, sessions: const []),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const _scheduleConfig = FacilityScheduleConfig(
  isCalendar: false,
  showsMonthNavigator: false,
  showsCapacity: false,
  serviceTypes: [FacilityServiceType.flow],
);

const _calendarConfig = FacilityScheduleConfig(
  isCalendar: true,
  showsMonthNavigator: true,
  showsCapacity: true,
  serviceTypes: [FacilityServiceType.activity, FacilityServiceType.course],
);

({FacilityScheduleCubit cubit, _RecordingRepository repository}) _build(
  FacilityScheduleConfig config,
) {
  final repository = _RecordingRepository();
  final cubit = FacilityScheduleCubit(
    GetFacilitySessionsUseCase(repository),
    GetFacilityWeeklyScheduleUseCase(repository),
    1,
    config,
  );
  return (cubit: cubit, repository: repository);
}

void main() {
  group('FacilityScheduleCubit windowing', () {
    test('Calendar opens on today, not the 1st — past slots are not browsable', () async {
      final (:cubit, :repository) = _build(_calendarConfig);
      await Future<void>.delayed(Duration.zero);

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      expect(cubit.state.windowStart, today);
      expect(cubit.state.windowEnd, DateTime(now.year, now.month + 1, 0));
      expect(cubit.state.canShowPreviousMonth, isFalse);
      expect(repository.requests, hasLength(1));
      expect(repository.requests.single.type, FacilityServiceType.activity);
    });

    test('stepping back from the current month is a no-op', () async {
      final (:cubit, :repository) = _build(_calendarConfig);
      await Future<void>.delayed(Duration.zero);

      final windowStart = cubit.state.windowStart;
      cubit.showPreviousMonth();
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.windowStart, windowStart);
      expect(repository.requests, hasLength(1));
    });

    test('stepping forward then back returns to the current month', () async {
      final (:cubit, :repository) = _build(_calendarConfig);
      await Future<void>.delayed(Duration.zero);

      final today = cubit.state.windowStart;

      cubit.showNextMonth();
      await Future<void>.delayed(Duration.zero);
      expect(cubit.state.canShowPreviousMonth, isTrue);

      cubit.showPreviousMonth();
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.windowStart, today);
      expect(cubit.state.canShowPreviousMonth, isFalse);
      expect(repository.requests, hasLength(3));
    });

    test('Schedule loads one turn of the weekly cycle starting today', () async {
      final (:cubit, :repository) = _build(_scheduleConfig);
      await Future<void>.delayed(Duration.zero);

      final today = DateTime.now();
      expect(cubit.state.windowStart, DateTime(today.year, today.month, today.day));
      // Seven days covers each weekday of the recurring cycle exactly once.
      expect(cubit.state.visibleDays, hasLength(7));
      expect(
        cubit.state.visibleDays.map((day) => day.weekday).toSet(),
        hasLength(7),
      );
      expect(repository.requests.single.type, FacilityServiceType.flow);
    });

    test('picking a day inside the window does not refetch', () async {
      final (:cubit, :repository) = _build(_scheduleConfig);
      await Future<void>.delayed(Duration.zero);

      final target = cubit.state.windowStart.add(const Duration(days: 3));
      cubit.selectDay(target);

      expect(cubit.state.selectedDay, target);
      expect(repository.requests, hasLength(1));
    });

    test('picking a day outside the window loads a window around it', () async {
      final (:cubit, :repository) = _build(_scheduleConfig);
      await Future<void>.delayed(Duration.zero);

      final target = cubit.state.windowEnd.add(const Duration(days: 10));
      cubit.selectDay(target);
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.selectedDay, target);
      expect(cubit.state.windowStart, target);
      expect(repository.requests, hasLength(2));
    });

    test('stepping a month moves the window and refetches', () async {
      final (:cubit, :repository) = _build(_calendarConfig);
      await Future<void>.delayed(Duration.zero);

      final firstWindowStart = cubit.state.windowStart;
      cubit.showNextMonth();
      await Future<void>.delayed(Duration.zero);

      // A future month opens on its 1st; only the current one starts at today.
      expect(
        cubit.state.windowStart,
        DateTime(firstWindowStart.year, firstWindowStart.month + 1),
      );
      // A month other than the current one starts on its first day.
      expect(cubit.state.selectedDay, cubit.state.windowStart);
      expect(repository.requests, hasLength(2));
      expect(repository.requests.last.start, cubit.state.windowStart);
    });

    test('switching type refetches the same window', () async {
      final (:cubit, :repository) = _build(_calendarConfig);
      await Future<void>.delayed(Duration.zero);

      cubit.selectType(FacilityServiceType.course);
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.selectedType, FacilityServiceType.course);
      expect(repository.requests, hasLength(2));
      expect(repository.requests.last.type, FacilityServiceType.course);
      expect(repository.requests.last.start, repository.requests.first.start);
    });

    test('selecting the already-selected day or type is a no-op', () async {
      final (:cubit, :repository) = _build(_calendarConfig);
      await Future<void>.delayed(Duration.zero);

      cubit.selectDay(cubit.state.selectedDay);
      cubit.selectType(cubit.state.selectedType);

      expect(repository.requests, hasLength(1));
    });
  });
}
