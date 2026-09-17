import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Fetches the signed-in user's profile.
@lazySingleton
class GetProfileUseCase {
  const GetProfileUseCase(this._repository);
  final ProfileRepository _repository;

  AsyncTask<ProfileEntity> call() => _repository.getProfile();
}
