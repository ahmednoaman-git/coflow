import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/dtos/dtos.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:flutter_test/flutter_test.dart';

/// One page of `schedule/191`, trimmed to the fields the mapper reads.
Map<String, dynamic> _slotJson({
  int id = 1007,
  int dayInt = 2,
  String day = 'sunday',
  String from = '09:00:00',
  String to = '10:00:00',
  bool ladiesOnly = false,
  String status = 'active',
  int serviceId = 581,
  String serviceType = 'flow',
  Map<String, dynamic>? level = const {'id': 2, 'name': 'BEGINNER', 'color': '#2fdac2'},
  List<Map<String, dynamic>> instructors = const [
    {'id': 707, 'first_name': 'Mahmoud', 'last_name': 'Fouad', 'service_id': 581},
    {'id': 708, 'first_name': 'Eslam', 'last_name': 'Ashraf', 'service_id': 581},
  ],
}) {
  return {
    'id': id,
    'day_int': dayInt,
    'day': day,
    'from': from,
    'to': to,
    'instructors': instructors,
    'ladies_only': ladiesOnly,
    'status': status,
    'service_id': serviceId,
    'facility_id': 191,
    'service': {
      'id': serviceId,
      'name': 'Beginner Flow 1',
      'type': serviceType,
      'facility_id': 191,
      'image': 'https://example.test/image',
      'level': level,
    },
  };
}

List<FacilityScheduleSlotModel> _slots(List<Map<String, dynamic>> json) =>
    json.map(FacilityScheduleSlotModel.fromJson).toList();

/// A seven-day window starting on a known Sunday, so weekday projection is
/// deterministic regardless of when the suite runs.
final _sunday = DateTime(2026, 1, 4);

GetFacilityWeeklyScheduleDto _dto({
  FacilityServiceType type = FacilityServiceType.flow,
  int days = 7,
}) {
  return GetFacilityWeeklyScheduleDto(
    facilityId: 191,
    windowStart: _sunday,
    windowEnd: DateTime(_sunday.year, _sunday.month, _sunday.day + days - 1),
    type: type,
  );
}

void main() {
  group('FacilityWeeklyScheduleMapper', () {
    test('parses a slot and projects it onto its weekday in the window', () {
      final schedule = FacilityWeeklyScheduleMapper.toEntity(
        _slots([_slotJson()]),
        _dto(),
      );

      expect(schedule.windowStart, _sunday);
      expect(schedule.sessions, hasLength(1));

      final session = schedule.sessions.single;
      expect(session.id, 1007);
      expect(session.serviceId, 581);
      expect(session.name, 'Beginner Flow 1');
      expect(session.startsAt, DateTime(2026, 1, 4, 9));
      expect(session.endsAt, DateTime(2026, 1, 4, 10));
      expect(session.instructorNames, ['Mahmoud Fouad', 'Eslam Ashraf']);
      expect(session.isLadiesOnly, isFalse);
      // No per-session hex on this endpoint — the level colour is the accent.
      expect(session.colorHex, '#2fdac2');
      expect(
        session.level,
        const FacilityServiceLevel.custom(name: 'BEGINNER', colorHex: '#2fdac2'),
      );
      // The endpoint carries no booking counts.
      expect(session.capacity, isNull);
    });

    test('repeats a slot once per matching weekday across a longer window', () {
      final schedule = FacilityWeeklyScheduleMapper.toEntity(
        _slots([_slotJson()]),
        _dto(days: 15),
      );

      expect(
        schedule.sessions.map((session) => session.day),
        [DateTime(2026, 1, 4), DateTime(2026, 1, 11), DateTime(2026, 1, 18)],
      );
    });

    test('reads the weekday from the name, not the Saturday-based day_int', () {
      // day_int 3 is Monday in the API's Saturday-first week; if it were read as
      // a Dart weekday it would land on Tuesday.
      final schedule = FacilityWeeklyScheduleMapper.toEntity(
        _slots([_slotJson(day: 'monday', dayInt: 3)]),
        _dto(),
      );

      expect(schedule.sessions.single.startsAt.weekday, DateTime.monday);
      expect(schedule.sessions.single.day, DateTime(2026, 1, 5));
    });

    test('falls back to day_int when the weekday name is unrecognized', () {
      final schedule = FacilityWeeklyScheduleMapper.toEntity(
        _slots([_slotJson(day: 'الأحد', dayInt: 2)]),
        _dto(),
      );

      expect(schedule.sessions.single.day, DateTime(2026, 1, 4));
    });

    test('sorts chronologically across the whole window', () {
      final schedule = FacilityWeeklyScheduleMapper.toEntity(
        _slots([
          _slotJson(id: 3, day: 'monday', from: '09:00:00', to: '10:00:00'),
          _slotJson(id: 2, day: 'sunday', from: '13:00:00', to: '14:00:00'),
          _slotJson(id: 1, day: 'sunday', from: '09:00:00', to: '10:00:00'),
        ]),
        _dto(),
      );

      expect(schedule.sessions.map((session) => session.id), [1, 2, 3]);
    });

    test('drops inactive slots but keeps ones with no status', () {
      final schedule = FacilityWeeklyScheduleMapper.toEntity(
        _slots([_slotJson(id: 1), _slotJson(id: 2, status: 'inactive')]),
        _dto(),
      );

      expect(schedule.sessions.map((session) => session.id), [1]);
    });

    test('filters by service type, keeping slots whose type is absent', () {
      final untyped = _slotJson(id: 3)..['service'] = {'id': 583, 'name': 'Untyped'};

      final schedule = FacilityWeeklyScheduleMapper.toEntity(
        _slots([
          _slotJson(id: 1, serviceType: 'flow'),
          _slotJson(id: 2, serviceType: 'course'),
          untyped,
        ]),
        _dto(),
      );

      expect(schedule.sessions.map((session) => session.id), [1, 3]);
    });

    test('falls back to a neutral accent when the service has no level', () {
      final schedule = FacilityWeeklyScheduleMapper.toEntity(
        _slots([_slotJson(level: null)]),
        _dto(),
      );

      expect(schedule.sessions.single.level, isNull);
      expect(schedule.sessions.single.colorHex, FacilityScheduleMapper.fallbackColorHex);
    });

    test('carries a slot that runs past midnight into the next day', () {
      final schedule = FacilityWeeklyScheduleMapper.toEntity(
        _slots([_slotJson(from: '23:00:00', to: '00:30:00')]),
        _dto(),
      );

      expect(schedule.sessions.single.startsAt, DateTime(2026, 1, 4, 23));
      expect(schedule.sessions.single.endsAt, DateTime(2026, 1, 5, 0, 30));
    });

    test('skips a malformed slot rather than failing the window', () {
      final schedule = FacilityWeeklyScheduleMapper.toEntity(
        _slots([_slotJson(id: 1), _slotJson(id: 2, from: 'not-a-time')]),
        _dto(),
      );

      expect(schedule.sessions.map((session) => session.id), [1]);
    });
  });

  group('FacilitySchedulePageModel', () {
    test('reads the paginator envelope the endpoint returns', () {
      final page = FacilitySchedulePageModel.fromJson({
        'current_page': 1,
        'last_page': 3,
        'per_page': 10,
        'total': 28,
        'next_page_url': 'https://api-test.coflow.co/apiApp/schedule/191?page=2',
        'data': [_slotJson()],
      });

      expect(page.currentPage, 1);
      expect(page.lastPage, 3);
      expect(page.slots.single.id, 1007);
      expect(page.slots.single.service?.type, 'flow');
    });
  });
}
