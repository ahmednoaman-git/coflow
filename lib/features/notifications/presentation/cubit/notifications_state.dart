import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(AsyncState.idle()) AsyncState<List<AppNotificationEntity>> notificationsRequest,
  }) = _NotificationsState;
}

@freezed
abstract class NotificationsBadgeState with _$NotificationsBadgeState {
  const factory NotificationsBadgeState({
    @Default(AsyncState.idle()) AsyncState<bool> unseenRequest,
  }) = _NotificationsBadgeState;
}
