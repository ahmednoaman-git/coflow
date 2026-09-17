import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get the facilities the user has saved.
@lazySingleton
class GetSavedProfilesUseCase {
  const GetSavedProfilesUseCase(this._repository);

  final SavedProfilesRepository _repository;

  AsyncTask<List<SavedProfileEntity>> call() => _repository.getSavedProfiles();
}
