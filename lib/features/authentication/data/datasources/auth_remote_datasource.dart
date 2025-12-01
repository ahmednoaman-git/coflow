import 'package:coflow_users_v2/core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// Authentication API endpoints.
abstract final class AuthEndpoints {
  static const String login = 'login';
  static const String register = 'register';
  static const String sendOtp = 'sendCode';
  static const String resendOtp = 'resendCode';
  static const String verifyOtp = 'checkCode';
}

/// Remote data source for authentication API calls.
@lazySingleton
class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._dio);
  final DioClient _dio;

  /// Authenticates user with email and password.
  AsyncTask<UserModel> login(LoginDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.post(AuthEndpoints.login, data: dto.toJson());
      return UserModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  /// Registers a new user with multipart form data.
  AsyncTask<RegisterResponseModel> register(RegisterDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final formData = FormData.fromMap({
        ...dto.toJson(),
        if (dto.image != null)
          'image': await MultipartFile.fromFile(
            dto.image!.path,
            filename: dto.image!.path.split('/').last,
          ),
      });

      final response = await _dio.post(
        AuthEndpoints.register,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return RegisterResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    });
  }

  /// Sends OTP to the specified email.
  AsyncTask<void> sendOtp(String email) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      await _dio.post(AuthEndpoints.sendOtp, data: {'email': email});
    });
  }

  /// Resends OTP to the specified email.
  AsyncTask<void> resendOtp(String email) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      await _dio.post(AuthEndpoints.resendOtp, data: {'email': email});
    });
  }

  /// Verifies OTP code for the specified email.
  AsyncTask<void> verifyOtp(VerifyOtpDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      await _dio.post(AuthEndpoints.verifyOtp, data: dto.toJson());
    });
  }
}
