import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../repositories/repositories.dart';

/// Sets a new password for the signed-in user.
@lazySingleton
class ChangePasswordUseCase {
  const ChangePasswordUseCase(this._repository);
  final ProfileRepository _repository;

  AsyncTask<void> call(ChangePasswordDto dto) => _repository.changePassword(dto);
}
