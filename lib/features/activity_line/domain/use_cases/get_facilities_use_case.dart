import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case for fetching facilities by activity line.
@lazySingleton
class GetFacilitiesUseCase {
  const GetFacilitiesUseCase(this._repository);
  final ActivityLineRepository _repository;

  /// Fetches facilities with the given filters.
  AsyncTask<ActivityLineFacilitiesEntity> call(GetFacilitiesDto dto) =>
      _repository.getFacilities(dto);
}
