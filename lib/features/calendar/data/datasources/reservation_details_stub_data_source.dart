import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

/// TODO(backend): no reservation-details or withdrawal endpoints exist yet.
/// This source fabricates a slot from the listing entry it was handed and
/// keeps the result in memory, so cancelling and leaving a waitlist behave
/// like the real thing for the length of an app run. Delete this class and its
/// routing in `ReservationRepositoryImpl` once the endpoints ship.
///
/// Seeded off the reservation id so a given slot always shows the same
/// customers, visibility setting and location kind — and so the ids fan out
/// across both standings the Calendar can show (reserved, waitlisted), which
/// is what makes the sheet reviewable.
@lazySingleton
class ReservationDetailsStubDataSource {
  final Map<int, _ReservationState> _reservations = {};

  AsyncTask<ReservationDetailsModel> getReservationDetails(GetReservationDetailsDto dto) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      await Future<void>.delayed(const Duration(milliseconds: 350));
      return _stateFor(dto.reservation).toModel(dto.reservation);
    });
  }

  AsyncTask<ReservationDetailsModel> withdrawReservation(WithdrawReservationDto dto) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      await Future<void>.delayed(const Duration(milliseconds: 450));

      final state = _stateFor(dto.reservation)..apply(dto.action);
      return state.toModel(dto.reservation);
    });
  }

  _ReservationState _stateFor(ReservationEntity reservation) =>
      _reservations.putIfAbsent(reservation.id, () => _ReservationState.seed(reservation));
}

/// The mutable half of a stubbed reservation — everything withdrawing changes.
class _ReservationState {
  _ReservationState({
    required this.customers,
    required this.waitlist,
    required this.areCustomersVisible,
    required this.isFacilityLocation,
    required this.note,
    required this.viewerState,
  });

  factory _ReservationState.seed(ReservationEntity reservation) {
    // Every reservation in this list is one the customer stands on: most are
    // booked places, the rest are queued ones.
    final isWaitlisted = reservation.id % 3 == 0;
    final booked = isWaitlisted ? _capacity : _capacity - 3;

    return _ReservationState(
      customers: [
        ..._names.take(booked - 1),
        if (!isWaitlisted) currentUserName,
      ],
      waitlist: [
        ..._names.reversed.take(2),
        if (isWaitlisted) currentUserName,
      ],
      // Fans the seeded slots across both privacy settings and both location
      // kinds — the section title follows the latter.
      areCustomersVisible: reservation.id.isEven,
      isFacilityLocation: reservation.id % 3 != 0,
      note: reservation.id.isOdd ? 'Expected wind 15 - 25 km/hr between 12 - 4pm' : null,
      viewerState: isWaitlisted ? SessionViewerState.waitlisted : SessionViewerState.reserved,
    );
  }

  /// Stands in for the signed-in customer until the endpoint flags their own
  /// row.
  static const String currentUserName = 'K. Emad';

  final List<String> customers;
  final List<String> waitlist;
  final bool areCustomersVisible;
  final bool isFacilityLocation;
  final String? note;

  SessionViewerState viewerState;

  void apply(ReservationWithdrawAction action) {
    switch (action) {
      case ReservationWithdrawAction.cancelReservation:
        customers.remove(currentUserName);
        viewerState = SessionViewerState.none;

      case ReservationWithdrawAction.leaveWaitlist:
        waitlist.remove(currentUserName);
        viewerState = SessionViewerState.none;
    }
  }

  ReservationDetailsModel toModel(ReservationEntity reservation) {
    return ReservationDetailsModel(
      facilityId: reservation.facilityId,
      facilityName: reservation.facilityName,
      facilityLogo: reservation.facilityLogoUrl,
      slot: FacilitySessionDetailsModel(
        id: reservation.id,
        serviceId: reservation.facilityId,
        name: reservation.serviceName,
        startsAt: reservation.startsAt,
        endsAt: reservation.endsAt,
        color: reservation.colorHex,
        level: switch (reservation.level) {
          final level? => FacilityServiceLevelModel(
            id: 0,
            name: level.name,
            color: level.colorHex,
          ),
          _ => null,
        },
        instructors: [
          for (final (index, name) in reservation.instructorNames.indexed)
            FacilitySessionInstructorModel(
              id: index,
              firstName: name.split(' ').first,
              lastName: name.split(' ').skip(1).join(' '),
            ),
        ],
        capacity: FacilitySessionCapacityModel(
          booked: customers.length,
          total: _capacity,
          waitlist: waitlist.length,
        ),
        customersVisible: areCustomersVisible,
        customers: areCustomersVisible ? _attendees(customers) : const [],
        waitlist: _attendees(waitlist),
        location: SessionLocationModel(
          address: '32 Mostafa Makram, Maadi, Cairo',
          isFacilityLocation: isFacilityLocation,
        ),
        note: note,
        cancellationDeadline: reservation.startsAt.subtract(
          const Duration(hours: _cancellationWindowHours),
        ),
        cancellationWindowHours: _cancellationWindowHours,
        viewerState: viewerState.name,
      ),
    );
  }

  List<SessionAttendeeModel> _attendees(List<String> names) => [
    for (final (index, name) in names.indexed)
      SessionAttendeeModel(
        position: index + 1,
        name: name,
        isCurrentUser: name == currentUserName,
      ),
  ];
}

const int _capacity = 10;
const int _cancellationWindowHours = 6;

const List<String> _names = [
  'A. Deco',
  'O. Alshami',
  'R. Khaled',
  'A. Akram',
  'M. Helmy',
  'F. Akram',
  'A. Nabil',
  'S. Tarek',
  'H. Adel',
  'N. Samir',
];
