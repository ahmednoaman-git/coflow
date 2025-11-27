import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case for user registration.
@lazySingleton
class RegisterUseCase {
  const RegisterUseCase(this._repository);
  final AuthenticationRepository _repository;

  AsyncTask<UserEntity> call(RegisterDto dto) => _repository.register(dto);
}
