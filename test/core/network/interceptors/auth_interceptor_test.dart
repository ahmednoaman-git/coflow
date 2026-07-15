import 'package:coflow_users_v2/core/caching/cache_client.dart';
import 'package:coflow_users_v2/core/data/auth/auth_state_manager.dart';
import 'package:coflow_users_v2/core/network/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

/// In-memory [CacheClient] that avoids touching Hive in unit tests.
class _FakeCacheClient extends CacheClient {
  final Map<String, dynamic> _store = {};

  @override
  Future<void> put(String key, dynamic value, {Duration? expiryDuration}) async {
    _store[key] = value;
  }

  @override
  T? get<T>(String key, {T? defaultValue}) => (_store[key] as T?) ?? defaultValue;

  @override
  Future<void> remove(String key) async {
    _store.remove(key);
  }
}

void main() {
  late AuthStateManager authStateManager;
  late AuthInterceptor interceptor;

  setUp(() {
    authStateManager = AuthStateManager(_FakeCacheClient());
    interceptor = AuthInterceptor(authStateManager);
  });

  Future<RequestOptions> runOnRequest() async {
    final options = RequestOptions(path: '/anything');
    interceptor.onRequest(options, RequestInterceptorHandler());
    return options;
  }

  test('adds Bearer token to request headers when authenticated', () async {
    await authStateManager.setAccessToken('my-token').run();

    final options = await runOnRequest();

    expect(options.headers['Authorization'], 'Bearer my-token');
  });

  test('does not add Authorization header when no token is stored', () async {
    final options = await runOnRequest();

    expect(options.headers.containsKey('Authorization'), isFalse);
  });

  test('does not add Authorization header when token is empty', () async {
    await authStateManager.setAccessToken('').run();

    final options = await runOnRequest();

    expect(options.headers.containsKey('Authorization'), isFalse);
  });

  test('does not add Authorization header after logout', () async {
    await authStateManager.setAccessToken('my-token').run();
    await authStateManager.clearAuth().run();

    final options = await runOnRequest();

    expect(options.headers.containsKey('Authorization'), isFalse);
  });
}
