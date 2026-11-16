import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification_entity.freezed.dart';

/// A notification sent to the customer, from `GET notifications`.
@freezed
abstract class AppNotificationEntity with _$AppNotificationEntity {
  const factory AppNotificationEntity({
    required int id,
    required String title,
    required String content,

    /// The day it was sent (the server sends no time).
    DateTime? sentOn,

    /// The facility it is about, or null for a message from Coflow itself.
    NotificationFacilityEntity? facility,
  }) = _AppNotificationEntity;
}

/// The little the notification carries about its facility: enough for a logo,
/// a name and opening the facility screen as a preview.
@freezed
abstract class NotificationFacilityEntity with _$NotificationFacilityEntity {
  const factory NotificationFacilityEntity({
    required int id,
    required String name,
    String? logoUrl,
    int? activityLineId,

    /// `GO`, `FLOW` or `PRO`.
    String? facilityType,
  }) = _NotificationFacilityEntity;
}
