import 'package:coflow_users_v2/core/async/async.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

abstract class ReservationRepository {
  /// The signed-in user's reservations across all facilities, within the
  /// requested window.
  AsyncTask<ReservationCalendarEntity> getReservations(GetReservationsDto dto);

  /// One reservation's full details — the slot sheet's payload.
  AsyncTask<ReservationDetailsEntity> getReservationDetails(GetReservationDetailsDto dto);

  /// Gives up a reservation or a waitlist place, answering with the updated
  /// reservation.
  AsyncTask<ReservationDetailsEntity> withdrawReservation(WithdrawReservationDto dto);
}
