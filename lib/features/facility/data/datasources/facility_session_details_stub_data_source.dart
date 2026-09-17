import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../models/models.dart';

/// TODO(backend): no slot-details or reservation endpoints exist yet. This
/// source fabricates a slot from the listing entry it was handed and keeps the
/// result in memory, so reserving, cancelling and queueing behave like the real
/// thing for the length of an app run. Delete this class and its routing in
/// `FacilityRepositoryImpl` once the endpoints ship.
///
/// Seeded off the session id so a given slot always shows the same customers,
/// visibility setting, ticket count and location kind — the ids fan out across
/// every CTA state, which is what makes the sheet reviewable.
@lazySingleton
class FacilitySessionDetailsStubDataSource {
  final Map<int, _SlotState> _slots = {};

  AsyncTask<FacilitySessionDetailsModel> getFacilitySessionDetails(
    GetFacilitySessionDetailsDto dto,
  ) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      await Future<void>.delayed(const Duration(milliseconds: 350));
      return _stateFor(dto.session).toModel(dto.session);
    });
  }

  AsyncTask<FacilitySessionDetailsModel> updateSessionReservation(SessionReservationDto dto) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      await Future<void>.delayed(const Duration(milliseconds: 450));

      final state = _stateFor(dto.session)..apply(dto.action);
      return state.toModel(dto.session);
    });
  }

  _SlotState _stateFor(FacilitySessionEntity session) =>
      _slots.putIfAbsent(session.id, () => _SlotState.seed(session));
}

/// The mutable half of a stubbed slot — everything an action can change.
class _SlotState {
  _SlotState({
    required this.booked,
    required this.total,
    required this.customers,
    required this.waitlist,
    required this.areCustomersVisible,
    required this.accessibleTickets,
    required this.note,
    required this.isFacilityLocation,
  });

  factory _SlotState.seed(FacilitySessionEntity session) {
    final capacity = session.capacity;
    final booked = capacity?.booked ?? 0;
    final total = capacity?.total ?? 10;
    final waitlistCount = capacity?.waitlistCount ?? 0;

    return _SlotState(
      booked: booked,
      total: total,
      customers: _names.take(booked).toList(),
      waitlist: _names.reversed.take(waitlistCount).toList(),
      // Fans the seeded slots across both privacy settings, both location
      // kinds, and every accessible-ticket count that changes the CTA.
      areCustomersVisible: session.id.isEven,
      accessibleTickets: session.id % 3,
      note: session.id % 4 == 0 ? 'Expected wind 15 - 25 km/hr between 12 - 4pm' : null,
      isFacilityLocation: session.id % 3 != 0,
    );
  }

  int booked;
  final int total;
  final List<String> customers;
  final List<String> waitlist;
  final bool areCustomersVisible;
  int accessibleTickets;
  final String? note;
  final bool isFacilityLocation;

  SessionViewerState viewerState = SessionViewerState.none;

  void apply(SessionReservationAction action) {
    switch (action) {
      case SessionReservationAction.reserve:
        booked += 1;
        accessibleTickets -= 1;
        customers.add(_currentUserName);
        viewerState = SessionViewerState.reserved;

      case SessionReservationAction.cancelReservation:
        booked -= 1;
        // The same ticket comes back and can be spent again.
        accessibleTickets += 1;
        customers.remove(_currentUserName);
        viewerState = SessionViewerState.none;

      case SessionReservationAction.joinWaitlist:
        // Queueing costs nothing — the ticket is only spent on conversion.
        waitlist.add(_currentUserName);
        viewerState = SessionViewerState.waitlisted;

      case SessionReservationAction.leaveWaitlist:
        waitlist.remove(_currentUserName);
        viewerState = SessionViewerState.none;
    }
  }

  FacilitySessionDetailsModel toModel(FacilitySessionEntity session) {
    return FacilitySessionDetailsModel(
      id: session.id,
      serviceId: session.serviceId,
      name: session.name,
      startsAt: session.startsAt,
      endsAt: session.endsAt,
      color: session.colorHex,
      ladiesOnly: session.isLadiesOnly,
      level: switch (session.level) {
        FacilityServiceLevelCustom(:final name, :final colorHex) => FacilityServiceLevelModel(
          id: 0,
          name: name,
          color: colorHex,
        ),
        _ => null,
      },
      instructors: [
        for (final (index, name) in session.instructorNames.indexed)
          FacilitySessionInstructorModel(
            id: index,
            firstName: name.split(' ').first,
            lastName: name.split(' ').skip(1).join(' '),
          ),
      ],
      capacity: FacilitySessionCapacityModel(
        booked: booked,
        total: total,
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
      cancellationDeadline: session.startsAt.subtract(
        const Duration(hours: _cancellationWindowHours),
      ),
      cancellationWindowHours: _cancellationWindowHours,
      viewerState: viewerState.name,
      accessibleTickets: accessibleTickets,
      reservationTicket: accessibleTickets >= 1
          ? SessionReservationTicketModel(
              name: 'Training Session',
              quantity: accessibleTickets,
              due: session.id.isOdd,
              purchasedAt: session.startsAt.subtract(const Duration(days: 30)),
              validForDays: 12,
              addOns: 2,
            )
          : null,
    );
  }

  List<SessionAttendeeModel> _attendees(List<String> names) => [
    for (final (index, name) in names.indexed)
      SessionAttendeeModel(
        position: index + 1,
        name: name,
        isCurrentUser: name == _currentUserName,
      ),
  ];
}

const int _cancellationWindowHours = 6;

/// Stands in for the signed-in customer until the endpoint flags their own row.
const String _currentUserName = 'K. Emad';

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
