import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get a facility's scheduled sessions for a date window.
@lazySingleton
class GetFacilitySessionsUseCase {
  const GetFacilitySessionsUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<FacilityScheduleEntity> call(GetFacilitySessionsDto dto) =>
      _repository.getFacilitySessions(dto);
}
