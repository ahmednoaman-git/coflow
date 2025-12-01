import 'package:injectable/injectable.dart';

import '../../async/types.dart';
import '../../caching/cache_client.dart';
import '../../network/task_either_extension.dart';
import '../../utils/typedefs.dart';

/// Manages the authentication state of the application.
///
/// This singleton holds the current user's authentication status,
/// access token, and user data. It serves as the single source of truth
/// for auth state across the app, accessible by data layers and UI.
@lazySingleton
class AuthStateManager {
  AuthStateManager(this._cache);
  final CacheClient _cache;

  static const String _accessTokenKey = 'access_token';
  static const String _userDataKey = 'user_data';

  String? _accessToken;
  Json? _userData;

  /// Returns the current access token, if authenticated.
  String? get accessToken => _accessToken;

  /// Returns the cached user data, if available.
  Json? get userData => _userData;

  /// Whether the user is currently authenticated.
  bool get isAuthenticated => _accessToken != null && _accessToken!.isNotEmpty;

  /// Initializes auth state from cache on app startup.
  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _accessToken = _cache.get<String>(_accessTokenKey);
    _userData = _cache.get<Json>(_userDataKey);
  }

  /// Sets the access token and persists it to cache.
  AsyncTask<void> setAccessToken(String token) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      _accessToken = token;
      await _cache.put(_accessTokenKey, token);
    });
  }

  /// Sets the user data and persists it to cache.
  AsyncTask<void> setUserData(Json userData) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      _userData = userData;
      await _cache.put(_userDataKey, userData);
    });
  }

  /// Clears all authentication data (logout).
  AsyncTask<void> clearAuth() {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      _accessToken = null;
      _userData = null;
      await _cache.remove(_accessTokenKey);
      await _cache.remove(_userDataKey);
    });
  }
}
