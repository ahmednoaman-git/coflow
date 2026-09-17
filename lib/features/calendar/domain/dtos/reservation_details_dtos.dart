import '../entities/reservation_entity.dart';

/// Request for a single reservation's full details.
///
/// The listing supplies the facility header while the endpoint resolves the
/// reservation's dated calendar and actual purchase ticket.
class GetReservationDetailsDto {
  const GetReservationDetailsDto({required this.reservation});

  final ReservationEntity reservation;

  int get reservationId => reservation.id;
}

/// How the customer is giving up their place.
///
/// The Calendar only ever lists slots the customer already stands on, so
/// reserving and joining a waitlist — the other half of the facility-side
/// family — cannot happen from here.
enum ReservationWithdrawAction {
  cancelReservation,
  leaveWaitlist,
}

/// Request to give up a reservation or a waitlist place.
class WithdrawReservationDto {
  const WithdrawReservationDto({required this.reservation, required this.action});

  final ReservationEntity reservation;
  final ReservationWithdrawAction action;

  int get reservationId => reservation.id;
}
