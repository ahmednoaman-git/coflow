import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get details for a specific ticket.
@lazySingleton
class GetFacilityTicketDetailsUseCase {
  const GetFacilityTicketDetailsUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<FacilityTicketDetailsEntity> call(GetFacilityTicketDetailsDto dto) =>
      _repository.getFacilityTicketDetails(dto);
}
