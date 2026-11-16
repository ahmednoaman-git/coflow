import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

/// Remembers, per signed-in user, the newest notification they have seen.
@lazySingleton
class NotificationsLocalDataSource {
  const NotificationsLocalDataSource(this._cache, this._auth);
  final CacheClient _cache;
  final AuthStateManager _auth;

  String get _key => 'notifications_last_seen_${_auth.userData?['id'] ?? 'anonymous'}';

  AsyncTask<int?> getLastSeenId() =>
      AsyncTaskExtension.tryCatchCacheFailure(() async => _cache.get<int>(_key));

  AsyncTask<void> setLastSeenId(int id) =>
      AsyncTaskExtension.tryCatchCacheFailure(() => _cache.put(_key, id));
}
