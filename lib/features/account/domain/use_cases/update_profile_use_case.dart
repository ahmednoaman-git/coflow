import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Saves the signed-in user's account details.
@lazySingleton
class UpdateProfileUseCase {
  const UpdateProfileUseCase(this._repository);
  final ProfileRepository _repository;

  AsyncTask<ProfileEntity> call(UpdateProfileDto dto) => _repository.updateProfile(dto);
}
