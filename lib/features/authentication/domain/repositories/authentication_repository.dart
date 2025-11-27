import 'package:coflow_users_v2/core/core.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

/// Repository interface for authentication operations.
///
/// All methods return [AsyncTask] for functional error handling.
abstract interface class AuthenticationRepository {
  /// Authenticates a user with email and password.
  ///
  /// Returns [SessionEntity] containing user data and access token on success.
  AsyncTask<SessionEntity> login(LoginDto dto);

  /// Registers a new user.
  ///
  /// Returns [UserEntity] of the registered user on success.
  AsyncTask<UserEntity> register(RegisterDto dto);

  /// Sends an OTP to the specified email address.
  AsyncTask<void> sendOtp(String email);

  /// Resends an OTP to the specified email address.
  AsyncTask<void> resendOtp(String email);

  /// Verifies an OTP code for the specified email.
  AsyncTask<void> verifyOtp(VerifyOtpDto dto);

  /// Fetches the list of available nationalities.
  AsyncTask<List<String>> getNationalities();

  /// Logs out the current user and clears session.
  AsyncTask<void> logout();
}
