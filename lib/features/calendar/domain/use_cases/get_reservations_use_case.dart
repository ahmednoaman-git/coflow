import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get the user's reservations for a date window.
@lazySingleton
class GetReservationsUseCase {
  const GetReservationsUseCase(this._repository);

  final ReservationRepository _repository;

  AsyncTask<ReservationCalendarEntity> call(GetReservationsDto dto) =>
      _repository.getReservations(dto);
}
