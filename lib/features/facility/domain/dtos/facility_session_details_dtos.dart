import '../entities/facility_session_entity.dart';

/// Request for a single slot's full details.
///
/// TODO(backend): the real endpoint only needs `sessionId`. The whole
/// [session] is carried so the stub data source can echo the listing fields it
/// cannot invent (name, times, colour); drop it to an id when the endpoint
/// ships.
class GetFacilitySessionDetailsDto {
  const GetFacilitySessionDetailsDto({required this.session});

  final FacilitySessionEntity session;

  int get sessionId => session.id;
}

/// What the customer is doing to their standing on a slot.
enum SessionReservationAction {
  reserve,
  cancelReservation,
  joinWaitlist,
  leaveWaitlist,
}

/// Request for one of the four reservation actions.
///
/// Modelled as a single operation with an [action] rather than four use cases,
/// because they are one family: same target, same response (the updated slot),
/// and they only ever differ by endpoint verb.
class SessionReservationDto {
  const SessionReservationDto({required this.session, required this.action});

  final FacilitySessionEntity session;
  final SessionReservationAction action;

  int get sessionId => session.id;
}
