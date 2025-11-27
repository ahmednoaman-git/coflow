import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:coflow_users_v2/core/network/dio_client.dart';
import 'package:coflow_users_v2/core/network/interceptors/auth_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Module for registering third-party dependencies and external packages
@module
abstract class RegisterModule {
  /// Register SharedPreferences as a preResolve async singleton
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  /// Register FlutterSecureStorage with default options
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  /// Register DioClient as a singleton
  @lazySingleton
  DioClient dioClient(AuthInterceptor authInterceptor) =>
      DioClient(authInterceptor: authInterceptor);

  /// Register Dio instance from DioClient
  @lazySingleton
  Dio dio(DioClient dioClient) => dioClient.dio;
}
