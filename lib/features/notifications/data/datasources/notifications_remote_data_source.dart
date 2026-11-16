import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../models/models.dart';

abstract final class NotificationsEndpoints {
  static const String notifications = 'notifications';
}

@lazySingleton
class NotificationsRemoteDataSource {
  const NotificationsRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<List<AppNotificationModel>> getNotifications() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(NotificationsEndpoints.notifications);
      return (response.data as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map(AppNotificationModel.fromJson)
          .toList(growable: false);
    });
  }
}
