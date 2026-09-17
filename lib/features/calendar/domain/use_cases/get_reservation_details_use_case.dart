import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get one reservation's full details.
@lazySingleton
class GetReservationDetailsUseCase {
  const GetReservationDetailsUseCase(this._repository);

  final ReservationRepository _repository;

  AsyncTask<ReservationDetailsEntity> call(GetReservationDetailsDto dto) =>
      _repository.getReservationDetails(dto);
}
