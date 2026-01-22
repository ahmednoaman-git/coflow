import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get a facility profile.
@lazySingleton
class GetFacilityProfileUseCase {
  const GetFacilityProfileUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<FacilityProfileEntity> call(GetFacilityProfileDto dto) =>
      _repository.getFacilityProfile(dto);
}
