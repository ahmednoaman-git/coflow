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
    this._localDataSource,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  AsyncTask<SessionEntity> login(LoginDto dto) {
    return _remoteDataSource.login(dto).flatMap((userModel) {
      final session = AuthMapper.toSessionEntity(userModel);
      // Save access token to cache
      return _localDataSource
          .saveAccessToken(session.accessToken)
          .flatMap((_) => _localDataSource.saveUserData(userModel.toJson()))
          .map((_) => session);
    });
  }

  @override
  AsyncTask<UserEntity> register(RegisterDto dto) {
    return _remoteDataSource
        .register(dto)
        .map(AuthMapper.registerResponseToUserEntity);
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
  AsyncTask<List<String>> getNationalities() {
    return _remoteDataSource.getNationalities().map(
      AuthMapper.toNationalityList,
    );
  }

  @override
  AsyncTask<void> logout() {
    return _localDataSource.clearAuthData();
  }
}
