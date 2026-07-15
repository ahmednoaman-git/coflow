import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data/auth/auth_state_manager.dart';

/// Interceptor that automatically adds authentication token to requests
/// and handles authentication errors
@injectable
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authStateManager);

  final AuthStateManager _authStateManager;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _authStateManager.accessToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: Handle 401 errors (token refresh, logout, etc.)
    handler.next(err);
  }
}
