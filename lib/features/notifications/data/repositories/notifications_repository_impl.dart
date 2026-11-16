import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  const NotificationsRepositoryImpl(this._remote, this._local);
  final NotificationsRemoteDataSource _remote;
  final NotificationsLocalDataSource _local;

  @override
  AsyncTask<List<AppNotificationEntity>> getNotifications() =>
      _remote.getNotifications().map(AppNotificationMapper.toEntities);

  @override
  AsyncTask<int?> getLastSeenId() => _local.getLastSeenId();

  @override
  AsyncTask<void> setLastSeenId(int id) => _local.setLastSeenId(id);
}
