import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Interceptor that automatically adds authentication token to requests
/// and handles authentication errors
@injectable
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: Add auth token to headers when implemented
    // options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: Handle 401 errors (token refresh, logout, etc.)
    handler.next(err);
  }
}
