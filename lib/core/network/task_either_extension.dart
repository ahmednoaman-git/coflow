import 'package:coflow_users_v2/core/core.dart';

extension AsyncTaskExtension on AsyncTask {
  /// Wraps an async operation in a TaskEither with generic error handling.
  /// Use this for local data source operations (cache, storage, etc.).
  static AsyncTask<R> tryCatchCacheFailure<R>(Future<R> Function() task) {
    return AsyncTask.tryCatch(
      task,
      (error, stackTrace) => CacheFailure(error.toString()),
    );
  }

  /// Wraps an async operation in a TaskEither with Dio-specific error handling.
  /// Use this for remote data source operations (API calls).
  static AsyncTask<R> tryCatchMapDioToFailure<R>(Future<R> Function() task) {
    return AsyncTask.tryCatch(task, mapDioErrorToFailure);
  }
}
