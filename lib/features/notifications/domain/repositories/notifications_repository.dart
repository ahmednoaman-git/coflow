import 'package:coflow_users_v2/core/core.dart';

import '../entities/entities.dart';

abstract interface class NotificationsRepository {
  /// Newest first.
  AsyncTask<List<AppNotificationEntity>> getNotifications();

  /// The newest notification id the customer has seen on this device, or null
  /// before they first open the list.
  AsyncTask<int?> getLastSeenId();

  AsyncTask<void> setLastSeenId(int id);
}
