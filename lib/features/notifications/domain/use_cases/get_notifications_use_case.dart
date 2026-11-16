import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetNotificationsUseCase {
  const GetNotificationsUseCase(this._repository);
  final NotificationsRepository _repository;

  AsyncTask<List<AppNotificationEntity>> call() => _repository.getNotifications();
}
