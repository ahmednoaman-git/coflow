import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// TODO(backend): the user-reservations endpoint does not exist yet. This
/// source generates a deterministic pattern for whatever window the UI asks
/// for, so the Calendar screen can be built and reviewed against realistic
/// data. Delete this class and its routing in `ReservationRepositoryImpl` once
/// the real endpoint ships.
///
/// The pattern spans two facilities — the Calendar is a cross-facility view —
/// and deliberately books only some weekdays, within a limited horizon, so the
/// screen exercises both its disabled-day chips and its empty weeks.
@lazySingleton
class ReservationStubDataSource {
  ReservationStubDataSource();

  /// Nothing is booked past this many days out, so stepping far enough forward
  /// always reaches empty weeks.
  static const int _bookedHorizonDays = 45;

  /// Nothing is booked in the first few days either, so the screen opens on a
  /// day further out and the "first upcoming reservation" rule is visible.
  static const int _bookedFromDays = 2;

  AsyncTask<ReservationsResponseModel> getReservations(GetReservationsDto dto) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      // Simulated network latency so loading states are visible in review.
      await Future<void>.delayed(const Duration(milliseconds: 400));
      return ReservationsResponseModel(reservations: _generateReservations(dto));
    });
  }

  List<ReservationModel> _generateReservations(GetReservationsDto dto) {
    final today = _dayOf(DateTime.now());
    final bookableFrom = today.add(const Duration(days: _bookedFromDays));
    final bookableUntil = today.add(const Duration(days: _bookedHorizonDays));

    final reservations = <ReservationModel>[];

    var day = _dayOf(dto.startDate);
    final lastDay = _dayOf(dto.endDate);

    while (!day.isAfter(lastDay)) {
      if (day.isBefore(bookableFrom) || day.isAfter(bookableUntil)) {
        day = day.add(const Duration(days: 1));
        continue;
      }

      for (final (index, template) in _templates.indexed) {
        if (!template.weekdays.contains(day.weekday)) continue;

        final startsAt = DateTime(day.year, day.month, day.day, template.startHour);

        reservations.add(
          ReservationModel(
            // Stable per day + template so rebuilds keep the same ids.
            id: day.millisecondsSinceEpoch ~/ 1000 + index,
            facilityId: template.facilityId,
            facilityName: template.facilityName,
            serviceName: template.serviceName,
            startsAt: startsAt,
            endsAt: startsAt.add(Duration(minutes: template.durationMinutes)),
            color: template.colorHex,
            level: template.level,
            instructors: template.instructors,
          ),
        );
      }

      day = day.add(const Duration(days: 1));
    }

    return reservations;
  }

  static DateTime _dayOf(DateTime date) => DateTime(date.year, date.month, date.day);
}

/// Weekday constants mirroring `DateTime.monday`… for readability below.
const _mon = DateTime.monday;
const _tue = DateTime.tuesday;
const _thu = DateTime.thursday;
const _sat = DateTime.saturday;
const _sun = DateTime.sunday;

class _ReservationTemplate {
  const _ReservationTemplate({
    required this.facilityId,
    required this.facilityName,
    required this.serviceName,
    required this.startHour,
    required this.durationMinutes,
    required this.colorHex,
    required this.weekdays,
    this.level,
    this.instructors = const <ReservationInstructorModel>[],
  });

  final int facilityId;
  final String facilityName;
  final String serviceName;
  final int startHour;
  final int durationMinutes;
  final String colorHex;
  final Set<int> weekdays;
  final ReservationLevelModel? level;
  final List<ReservationInstructorModel> instructors;
}

const _fouad = ReservationInstructorModel(id: 1, firstName: 'Abdelrahman', lastName: 'Fouad');
const _saeed = ReservationInstructorModel(id: 2, firstName: 'Abdelrahman', lastName: 'Saeed');

const _beginner = ReservationLevelModel(name: 'BEGINNER', color: '#2FDAC2');
const _advanced = ReservationLevelModel(name: 'ADVANCED', color: '#DA302B');
const _allLevels = ReservationLevelModel(name: 'ALL LEVELS', color: '#FE9E12');

/// Wednesday and Friday are intentionally absent — those chips render disabled.
///
/// A slot's colour comes from its level, so the level-less one (an activity)
/// is blue, per the product rule.
const _templates = <_ReservationTemplate>[
  _ReservationTemplate(
    facilityId: 101,
    facilityName: 'Calisthenics Club',
    serviceName: 'Calisthenics Session',
    startHour: 17,
    durationMinutes: 60,
    colorHex: '#2FDAC2',
    weekdays: {_sun, _tue, _thu},
    level: _beginner,
    instructors: [_fouad],
  ),
  _ReservationTemplate(
    facilityId: 102,
    facilityName: 'Happy Horse',
    serviceName: 'Pony Ride',
    startHour: 18,
    durationMinutes: 60,
    colorHex: '#2F9BE8',
    weekdays: {_sun, _mon, _sat},
  ),
  _ReservationTemplate(
    facilityId: 102,
    facilityName: 'Happy Horse',
    serviceName: 'Equestrian Jumping',
    startHour: 19,
    durationMinutes: 90,
    colorHex: '#DA302B',
    weekdays: {_sun, _thu},
    level: _advanced,
    instructors: [_saeed],
  ),
  _ReservationTemplate(
    facilityId: 101,
    facilityName: 'Calisthenics Club',
    serviceName: 'Mobility Flow',
    startHour: 21,
    durationMinutes: 45,
    colorHex: '#FE9E12',
    weekdays: {_sun, _mon, _tue, _sat},
    level: _allLevels,
    instructors: [_fouad, _saeed],
  ),
];
