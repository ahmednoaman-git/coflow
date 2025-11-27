import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

/// Use case for resending OTP to email.
@lazySingleton
class ResendOtpUseCase {
  const ResendOtpUseCase(this._repository);
  final AuthenticationRepository _repository;

  AsyncTask<void> call(String email) => _repository.resendOtp(email);
}
