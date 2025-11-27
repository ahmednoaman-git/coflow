import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

/// Local data source for authentication data caching.
@lazySingleton
class AuthLocalDataSource {
  const AuthLocalDataSource(this._cache);
  final CacheClient _cache;

  static const String _accessTokenKey = 'access_token';
  static const String _userDataKey = 'user_data';

  /// Saves the access token to cache.
  AsyncTask<void> saveAccessToken(String token) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      await _cache.put(_accessTokenKey, token);
    });
  }

  /// Retrieves the cached access token.
  AsyncTask<String?> getAccessToken() {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      return _cache.get<String>(_accessTokenKey);
    });
  }

  /// Saves user data to cache.
  AsyncTask<void> saveUserData(Json userData) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      await _cache.put(_userDataKey, userData);
    });
  }

  /// Retrieves cached user data.
  AsyncTask<Json?> getUserData() {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      return _cache.get<Json>(_userDataKey);
    });
  }

  /// Clears all authentication data from cache.
  AsyncTask<void> clearAuthData() {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      await _cache.remove(_accessTokenKey);
      await _cache.remove(_userDataKey);
    });
  }

  /// Checks if user is authenticated (has valid token).
  AsyncTask<bool> isAuthenticated() {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      final token = _cache.get<String>(_accessTokenKey);
      return token != null && token.isNotEmpty;
    });
  }
}
