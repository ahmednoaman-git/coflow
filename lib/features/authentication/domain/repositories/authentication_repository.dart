import 'package:coflow_users_v2/core/core.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

/// Repository interface for authentication operations.
///
/// All methods return [AsyncTask] for functional error handling.
abstract interface class AuthenticationRepository {
  /// Authenticates a user with email and password.
  ///
  /// Returns [UserEntity] of the authenticated user on success.
  /// The access token is handled internally by [AuthStateManager].
  AsyncTask<UserEntity> login(LoginDto dto);

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

  /// Logs out the current user and clears session.
  AsyncTask<void> logout();
}
