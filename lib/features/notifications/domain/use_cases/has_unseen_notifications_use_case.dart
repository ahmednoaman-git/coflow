import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

/// Whether any notification is newer than the newest one seen on this device.
///
/// The API has no read state, so "seen" is kept locally: opening the list marks
/// everything in it as seen.
@lazySingleton
class HasUnseenNotificationsUseCase {
  const HasUnseenNotificationsUseCase(this._repository);
  final NotificationsRepository _repository;

  AsyncTask<bool> call() => _repository.getNotifications().flatMap(
    (notifications) => _repository.getLastSeenId().map(
      (lastSeen) => notifications.any((notification) => notification.id > (lastSeen ?? 0)),
    ),
  );
}
