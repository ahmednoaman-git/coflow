import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

/// Permanently deletes the signed-in account and signs out on this device.
@lazySingleton
class DeleteAccountUseCase {
  const DeleteAccountUseCase(this._repository);
  final ProfileRepository _repository;

  AsyncTask<void> call() => _repository.deleteAccount();
}
