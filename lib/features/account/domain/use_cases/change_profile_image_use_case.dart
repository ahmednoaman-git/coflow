import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Uploads a new profile photo for the signed-in user.
@lazySingleton
class ChangeProfileImageUseCase {
  const ChangeProfileImageUseCase(this._repository);
  final ProfileRepository _repository;

  AsyncTask<ProfileEntity> call(ChangeProfileImageDto dto) => _repository.changeProfileImage(dto);
}
