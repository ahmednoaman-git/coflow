import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

/// Use case for sending OTP to email.
@lazySingleton
class SendOtpUseCase {
  const SendOtpUseCase(this._repository);
  final AuthenticationRepository _repository;

  AsyncTask<void> call(String email) => _repository.sendOtp(email);
}
