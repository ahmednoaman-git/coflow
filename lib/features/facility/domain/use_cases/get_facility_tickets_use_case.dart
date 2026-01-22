import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get tickets for a facility.
@lazySingleton
class GetFacilityTicketsUseCase {
  const GetFacilityTicketsUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<List<FacilityTicketEntity>> call(GetFacilityTicketsDto dto) =>
      _repository.getFacilityTickets(dto);
}
