import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

/// Use case for logging out the current user.
@lazySingleton
class LogoutUseCase {
  const LogoutUseCase(this._repository);
  final AuthenticationRepository _repository;

  AsyncTask<void> call() => _repository.logout();
}
