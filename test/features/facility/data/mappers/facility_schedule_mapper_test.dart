import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/dtos/dtos.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:flutter_test/flutter_test.dart';

GetFacilitySessionsDto _dto({DateTime? start, DateTime? end}) => GetFacilitySessionsDto(
  facilityId: 1,
  startDate: start ?? DateTime(2026, 1, 1, 9, 30),
  endDate: end ?? DateTime(2026, 1, 31, 22),
  type: FacilityServiceType.flow,
);

FacilitySessionModel _session({
  int id = 1,
  required DateTime startsAt,
  String? color,
  bool? ladiesOnly,
  FacilityServiceLevelModel? level,
  List<FacilitySessionInstructorModel> instructors = const [],
  FacilitySessionCapacityModel? capacity,
}) {
  return FacilitySessionModel(
    id: id,
    serviceId: 555,
    name: 'Yoga Flow',
    startsAt: startsAt,
    endsAt: startsAt.add(const Duration(hours: 1)),
    color: color,
    ladiesOnly: ladiesOnly,
    level: level,
    instructors: instructors,
    capacity: capacity,
  );
}

void main() {
  group('FacilityScheduleMapper.toEntity', () {
    test('sorts sessions chronologically across the window', () {
      final entity = FacilityScheduleMapper.toEntity(
        FacilitySessionsResponseModel(
          sessions: [
            _session(id: 3, startsAt: DateTime(2026, 1, 2, 18)),
            _session(id: 1, startsAt: DateTime(2026, 1, 1, 18)),
            _session(id: 2, startsAt: DateTime(2026, 1, 1, 20)),
          ],
        ),
        _dto(),
      );

      expect(entity.sessions.map((s) => s.id), [1, 2, 3]);
    });

    test('normalizes the window to whole days', () {
      final entity = FacilityScheduleMapper.toEntity(
        const FacilitySessionsResponseModel(),
        _dto(),
      );

      expect(entity.windowStart, DateTime(2026, 1, 1));
      expect(entity.windowEnd, DateTime(2026, 1, 31));
    });

    test('falls back to the neutral accent when the API sends no colour', () {
      final entity = FacilityScheduleMapper.toEntity(
        FacilitySessionsResponseModel(
          sessions: [
            _session(startsAt: DateTime(2026, 1, 1, 18)),
            _session(id: 2, startsAt: DateTime(2026, 1, 1, 19), color: ''),
            _session(id: 3, startsAt: DateTime(2026, 1, 1, 20), color: '#FE9E12'),
          ],
        ),
        _dto(),
      );

      expect(entity.sessions[0].colorHex, FacilityScheduleMapper.fallbackColorHex);
      expect(entity.sessions[1].colorHex, FacilityScheduleMapper.fallbackColorHex);
      expect(entity.sessions[2].colorHex, '#FE9E12');
    });

    test('leaves a missing level null instead of falling back to all levels', () {
      final entity = FacilityScheduleMapper.toEntity(
        FacilitySessionsResponseModel(
          sessions: [_session(startsAt: DateTime(2026, 1, 1, 18))],
        ),
        _dto(),
      );

      expect(entity.sessions.single.level, isNull);
    });

    test('maps level, ladies-only, instructors and capacity', () {
      final entity = FacilityScheduleMapper.toEntity(
        FacilitySessionsResponseModel(
          sessions: [
            _session(
              startsAt: DateTime(2026, 1, 1, 18),
              ladiesOnly: true,
              level: const FacilityServiceLevelModel(id: 2, name: 'BEGINNER', color: '#2FDAC2'),
              instructors: const [
                FacilitySessionInstructorModel(id: 1, firstName: 'Abdelrahman', lastName: 'Fouad'),
              ],
              capacity: const FacilitySessionCapacityModel(booked: 2, total: 10, waitlist: 3),
            ),
          ],
        ),
        _dto(),
      );

      final session = entity.sessions.single;
      expect(session.isLadiesOnly, isTrue);
      expect(session.instructorNames, ['Abdelrahman Fouad']);
      expect(
        session.capacity,
        const FacilitySessionCapacityEntity(booked: 2, total: 10, waitlistCount: 3),
      );
      expect(
        session.level,
        const FacilityServiceLevel.custom(name: 'BEGINNER', colorHex: '#2FDAC2'),
      );
    });

    test('defaults ladies-only to false when the API omits it', () {
      final entity = FacilityScheduleMapper.toEntity(
        FacilitySessionsResponseModel(
          sessions: [_session(startsAt: DateTime(2026, 1, 1, 18))],
        ),
        _dto(),
      );

      expect(entity.sessions.single.isLadiesOnly, isFalse);
    });
  });

  group('FacilityScheduleEntity day grouping', () {
    final entity = FacilityScheduleMapper.toEntity(
      FacilitySessionsResponseModel(
        sessions: [
          _session(id: 1, startsAt: DateTime(2026, 1, 1, 18)),
          _session(id: 2, startsAt: DateTime(2026, 1, 1, 20)),
          _session(id: 3, startsAt: DateTime(2026, 1, 3, 18)),
        ],
      ),
      _dto(),
    );

    test('returns a day\'s sessions in order, ignoring the time component', () {
      final sessions = entity.sessionsOn(DateTime(2026, 1, 1, 23, 59));
      expect(sessions.map((s) => s.id), [1, 2]);
    });

    test('reports days with and without sessions', () {
      expect(entity.hasSessionsOn(DateTime(2026, 1, 1)), isTrue);
      expect(entity.hasSessionsOn(DateTime(2026, 1, 2)), isFalse);
      expect(entity.sessionsOn(DateTime(2026, 1, 2)), isEmpty);
    });
  });

  group('FacilitySessionCapacityEntity', () {
    test('fill fraction is booked over total, clamped', () {
      expect(const FacilitySessionCapacityEntity(booked: 2, total: 10).fillFraction, 0.2);
      expect(const FacilitySessionCapacityEntity(booked: 12, total: 10).fillFraction, 1.0);
    });

    test('guards against a zero capacity', () {
      const capacity = FacilitySessionCapacityEntity(booked: 3, total: 0);
      expect(capacity.fillFraction, 0);
      expect(capacity.isFull, isFalse);
    });

    test('is full once bookings reach the total', () {
      expect(const FacilitySessionCapacityEntity(booked: 10, total: 10).isFull, isTrue);
      expect(const FacilitySessionCapacityEntity(booked: 9, total: 10).isFull, isFalse);
    });

    test('a waitlist only counts once the session is full', () {
      const full = FacilitySessionCapacityEntity(booked: 10, total: 10, waitlistCount: 5);
      const partial = FacilitySessionCapacityEntity(booked: 9, total: 10, waitlistCount: 5);
      const fullWithoutQueue = FacilitySessionCapacityEntity(booked: 10, total: 10);

      expect(full.hasWaitlist, isTrue);
      expect(partial.hasWaitlist, isFalse);
      expect(fullWithoutQueue.hasWaitlist, isFalse);
    });

    test('defaults the waitlist to zero when the API omits it', () {
      expect(const FacilitySessionCapacityEntity(booked: 1, total: 10).waitlistCount, 0);
    });
  });
}
