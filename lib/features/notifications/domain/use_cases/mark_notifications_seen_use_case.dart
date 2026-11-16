import 'package:coflow_users_v2/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Records the newest of [notifications] as seen. Never moves the mark back.
@lazySingleton
class MarkNotificationsSeenUseCase {
  const MarkNotificationsSeenUseCase(this._repository);
  final NotificationsRepository _repository;

  AsyncTask<void> call(List<AppNotificationEntity> notifications) {
    if (notifications.isEmpty) return TaskEither.right(null);
    final newest = notifications
        .map((notification) => notification.id)
        .reduce(
          (a, b) => a > b ? a : b,
        );
    return _repository.getLastSeenId().flatMap(
      (lastSeen) => newest > (lastSeen ?? 0)
          ? _repository.setLastSeenId(newest)
          : TaskEither<Failure, void>.right(null),
    );
  }
}
