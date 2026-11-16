import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Fetches the nationalities the profile form offers.
@lazySingleton
class GetNationalitiesUseCase {
  const GetNationalitiesUseCase(this._repository);
  final ProfileRepository _repository;

  AsyncTask<List<NationalityEntity>> call() => _repository.getNationalities();
}
