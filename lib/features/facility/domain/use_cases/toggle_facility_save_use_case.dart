import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../repositories/repositories.dart';

/// Use case for saving/unsaving a facility.
@lazySingleton
class ToggleFacilitySaveUseCase {
  const ToggleFacilitySaveUseCase(this._repository);
  final FacilityRepository _repository;

  AsyncTask<void> call(ToggleFacilitySaveDto dto) => _repository.toggleFacilitySave(dto);
}
