import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../repositories/repositories.dart';

/// Use case for verifying OTP code.
@lazySingleton
class VerifyOtpUseCase {
  const VerifyOtpUseCase(this._repository);
  final AuthenticationRepository _repository;

  AsyncTask<void> call(VerifyOtpDto dto) => _repository.verifyOtp(dto);
}
