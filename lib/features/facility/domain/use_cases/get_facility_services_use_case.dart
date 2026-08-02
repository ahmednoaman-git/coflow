import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get the services/flows/courses listing for a facility.
@lazySingleton
class GetFacilityServicesUseCase {
  const GetFacilityServicesUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<FacilityServicesEntity> call(GetFacilityServicesDto dto) =>
      _repository.getFacilityServices(dto);
}
