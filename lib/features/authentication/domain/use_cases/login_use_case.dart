import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case for user login.
@lazySingleton
class LoginUseCase {
  const LoginUseCase(this._repository);
  final AuthenticationRepository _repository;

  AsyncTask<UserEntity> call(LoginDto dto) => _repository.login(dto);
}
