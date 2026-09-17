import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/enums/enums.dart';
import '../models/models.dart';

/// TODO(backend): **Calendar only.** The Schedule tab now runs on the real
/// `schedule/{facilityId}` endpoint, but that returns a recurring weekly
/// pattern with no dates and no capacity — Calendar needs dated,
/// capacity-bearing sessions, which no endpoint serves yet. This source
/// generates a deterministic weekly pattern for whatever window Calendar asks
/// for. Delete this class and its routing in `FacilityRepositoryImpl` once a
/// dated sessions endpoint ships.
///
/// The pattern deliberately leaves Wednesday and Friday empty to exercise the
/// "no sessions" day state, and always returns capacity — the Schedule variant
/// hides it in the UI rather than the data being absent.
@lazySingleton
class FacilityScheduleStubDataSource {
  AsyncTask<FacilitySessionsResponseModel> getFacilitySessions(GetFacilitySessionsDto dto) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      // Simulated network latency so loading states are visible in review.
      await Future<void>.delayed(const Duration(milliseconds: 400));
      return FacilitySessionsResponseModel(sessions: _generateSessions(dto));
    });
  }

  List<FacilitySessionModel> _generateSessions(GetFacilitySessionsDto dto) {
    final templates = _templatesFor(dto.type);
    final sessions = <FacilitySessionModel>[];

    var day = DateTime(dto.startDate.year, dto.startDate.month, dto.startDate.day);
    final lastDay = DateTime(dto.endDate.year, dto.endDate.month, dto.endDate.day);

    while (!day.isAfter(lastDay)) {
      for (final (index, template) in templates.indexed) {
        if (!template.weekdays.contains(day.weekday)) continue;

        final startsAt = DateTime(day.year, day.month, day.day, template.startHour);

        sessions.add(
          FacilitySessionModel(
            // Stable per day + template so rebuilds keep the same ids.
            id: day.millisecondsSinceEpoch ~/ 1000 + index,
            serviceId: template.serviceId,
            name: template.name,
            startsAt: startsAt,
            endsAt: startsAt.add(Duration(minutes: template.durationMinutes)),
            color: template.colorHex,
            ladiesOnly: template.ladiesOnly,
            level: template.level,
            instructors: template.instructors,
            capacity: _capacityFor(day, index, template.capacity),
          ),
        );
      }

      day = day.add(const Duration(days: 1));
    }

    return sessions;
  }

  /// Deterministic pseudo-random bookings in `0..capacity`, so a given day
  /// always renders the same fill and some sessions come out full — with a
  /// waitlist on the ones that do.
  FacilitySessionCapacityModel _capacityFor(DateTime day, int index, int capacity) {
    final seed = day.day * 7 + day.month * 3 + index * 5;
    final booked = seed % (capacity + 1);

    return FacilitySessionCapacityModel(
      booked: booked,
      total: capacity,
      waitlist: booked >= capacity ? seed % 7 : 0,
    );
  }

  List<_SessionTemplate> _templatesFor(FacilityServiceType type) => switch (type) {
    FacilityServiceType.flow => _flowTemplates,
    FacilityServiceType.activity => _activityTemplates,
    FacilityServiceType.course => _courseTemplates,
  };
}

/// Weekday constants mirroring `DateTime.monday`… for readability below.
const _mon = DateTime.monday;
const _tue = DateTime.tuesday;
const _thu = DateTime.thursday;
const _sat = DateTime.saturday;
const _sun = DateTime.sunday;

/// Wednesday and Friday are intentionally absent — those days render as empty.
const _activeWeekdays = {_sun, _mon, _tue, _thu, _sat};

class _SessionTemplate {
  const _SessionTemplate({
    required this.serviceId,
    required this.name,
    required this.startHour,
    required this.durationMinutes,
    required this.colorHex,
    required this.capacity,
    this.level,
    this.ladiesOnly = false,
    this.instructors = const <FacilitySessionInstructorModel>[],
    this.weekdays = _activeWeekdays,
  });

  final int serviceId;
  final String name;
  final int startHour;
  final int durationMinutes;
  final String colorHex;
  final int capacity;
  final FacilityServiceLevelModel? level;
  final bool ladiesOnly;
  final List<FacilitySessionInstructorModel> instructors;
  final Set<int> weekdays;
}

const _fouad = FacilitySessionInstructorModel(id: 1, firstName: 'Abdelrahman', lastName: 'Fouad');
const _saeed = FacilitySessionInstructorModel(id: 2, firstName: 'Abdelrahman', lastName: 'Saeed');

const _beginner = FacilityServiceLevelModel(id: 2, name: 'BEGINNER', color: '#2FDAC2');
const _intermediate = FacilityServiceLevelModel(id: 3, name: 'INTERMEDIATE', color: '#FE9E12');
const _advanced = FacilityServiceLevelModel(id: 4, name: 'ADVANCED', color: '#DA302B');
const _allLevels = FacilityServiceLevelModel(id: 5, name: 'ALL LEVELS', color: '#2F9BE8');

const _flowTemplates = <_SessionTemplate>[
  _SessionTemplate(
    serviceId: 555,
    name: 'Yoga Flow',
    startHour: 17,
    durationMinutes: 60,
    colorHex: '#2FDAC2',
    capacity: 10,
    level: _beginner,
    ladiesOnly: true,
    instructors: [_fouad],
  ),
  _SessionTemplate(
    serviceId: 556,
    name: 'Slow Yoga',
    startHour: 18,
    durationMinutes: 60,
    colorHex: '#FE9E12',
    capacity: 10,
    level: _intermediate,
    instructors: [_saeed],
  ),
  _SessionTemplate(
    serviceId: 557,
    name: 'Aerial Flow',
    startHour: 19,
    durationMinutes: 90,
    colorHex: '#2F9BE8',
    capacity: 12,
    level: _allLevels,
    instructors: [_fouad, _saeed],
  ),
  _SessionTemplate(
    serviceId: 558,
    name: 'Flying Bungee',
    startHour: 21,
    durationMinutes: 60,
    colorHex: '#DA302B',
    capacity: 8,
    level: _advanced,
    instructors: [_saeed],
    weekdays: {_sun, _tue, _thu},
  ),
];

const _activityTemplates = <_SessionTemplate>[
  _SessionTemplate(
    serviceId: 572,
    name: 'Horse Ride',
    startHour: 17,
    durationMinutes: 60,
    colorHex: '#2F9BE8',
    capacity: 10,
  ),
  _SessionTemplate(
    serviceId: 573,
    name: 'Pony Ride',
    startHour: 18,
    durationMinutes: 60,
    colorHex: '#2F9BE8',
    capacity: 6,
  ),
  _SessionTemplate(
    serviceId: 574,
    name: 'Jumping Session',
    startHour: 20,
    durationMinutes: 90,
    colorHex: '#FE9E12',
    capacity: 4,
    ladiesOnly: true,
    instructors: [_fouad],
    weekdays: {_mon, _thu, _sat},
  ),
];

const _courseTemplates = <_SessionTemplate>[
  _SessionTemplate(
    serviceId: 580,
    name: 'Beginner Riding Course',
    startHour: 16,
    durationMinutes: 120,
    colorHex: '#2FDAC2',
    capacity: 8,
    level: _beginner,
    instructors: [_fouad],
    weekdays: {_sun, _tue, _thu},
  ),
  _SessionTemplate(
    serviceId: 581,
    name: 'Advanced Dressage',
    startHour: 19,
    durationMinutes: 90,
    colorHex: '#DA302B',
    capacity: 5,
    level: _advanced,
    instructors: [_saeed],
    weekdays: {_mon, _sat},
  ),
];
