import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../repositories/repositories.dart';

/// Use case to remove a facility from the user's saved profiles.
@lazySingleton
class UnsaveProfileUseCase {
  const UnsaveProfileUseCase(this._repository);

  final SavedProfilesRepository _repository;

  AsyncTask<void> call(UnsaveProfileDto dto) => _repository.unsaveProfile(dto);
}
