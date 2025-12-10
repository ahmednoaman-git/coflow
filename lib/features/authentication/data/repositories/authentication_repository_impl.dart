import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

/// Implementation of [AuthenticationRepository].
@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl(
    this._remoteDataSource,
    this._authStateManager,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final AuthStateManager _authStateManager;

  @override
  AsyncTask<UserEntity> login(LoginDto dto) {
    return _remoteDataSource.login(dto).flatMap((userModel) {
      final userEntity = AuthMapper.toUserEntity(userModel);
      // Store access token and user data in AuthStateManager
      return _authStateManager
          .setAccessToken(userModel.token ?? '')
          .flatMap((_) => _authStateManager.setUserData(userModel.toJson()))
          .map((_) => userEntity);
    });
  }

  @override
  AsyncTask<UserEntity> register(RegisterDto dto) {
    return _remoteDataSource.register(dto).flatMap((responseModel) {
      final userEntity = AuthMapper.registerResponseToUserEntity(responseModel);
      // Store access token and user data in AuthStateManager
      return _authStateManager
          .setAccessToken(responseModel.token ?? '')
          .flatMap((_) => _authStateManager.setUserData(responseModel.toJson()))
          .map((_) => userEntity);
    });
  }

  @override
  AsyncTask<void> sendOtp(String email) {
    return _remoteDataSource.sendOtp(email);
  }

  @override
  AsyncTask<void> resendOtp(String email) {
    return _remoteDataSource.resendOtp(email);
  }

  @override
  AsyncTask<void> verifyOtp(VerifyOtpDto dto) {
    return _remoteDataSource.verifyOtp(dto);
  }

  @override
  AsyncTask<void> logout() {
    return _authStateManager.clearAuth();
  }
}
