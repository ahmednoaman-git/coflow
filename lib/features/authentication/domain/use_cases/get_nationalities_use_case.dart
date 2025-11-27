import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

/// Use case for fetching available nationalities.
@lazySingleton
class GetNationalitiesUseCase {
  const GetNationalitiesUseCase(this._repository);
  final AuthenticationRepository _repository;

  AsyncTask<List<String>> call() => _repository.getNationalities();
}
