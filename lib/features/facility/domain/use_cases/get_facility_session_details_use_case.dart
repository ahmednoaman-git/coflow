import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get one scheduled slot's full details.
@lazySingleton
class GetFacilitySessionDetailsUseCase {
  const GetFacilitySessionDetailsUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<FacilitySessionDetailsEntity> call(GetFacilitySessionDetailsDto dto) =>
      _repository.getFacilitySessionDetails(dto);
}
