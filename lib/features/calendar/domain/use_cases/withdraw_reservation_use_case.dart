import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to cancel a reservation or leave a waitlist, answering with the
/// updated reservation.
@lazySingleton
class WithdrawReservationUseCase {
  const WithdrawReservationUseCase(this._repository);

  final ReservationRepository _repository;

  AsyncTask<ReservationDetailsEntity> call(WithdrawReservationDto dto) =>
      _repository.withdrawReservation(dto);
}
