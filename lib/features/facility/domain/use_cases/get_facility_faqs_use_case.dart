import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case for loading a facility's FAQ list.
@lazySingleton
class GetFacilityFaqsUseCase {
  const GetFacilityFaqsUseCase(this._repository);
  final FacilityRepository _repository;

  AsyncTask<List<FacilityFaqEntity>> call(GetFacilityFaqsDto dto) =>
      _repository.getFacilityFaqs(dto);
}
