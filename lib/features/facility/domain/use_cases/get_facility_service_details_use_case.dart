import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get details for a specific service/flow/course.
@lazySingleton
class GetFacilityServiceDetailsUseCase {
  const GetFacilityServiceDetailsUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<FacilityServiceDetailsEntity> call(GetFacilityServiceDetailsDto dto) =>
      _repository.getFacilityServiceDetails(dto);
}
