import 'package:json_annotation/json_annotation.dart';

part 'app_notification_model.g.dart';

/// A row of `GET notifications` (a plain, unpaginated list).
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class AppNotificationModel {
  const AppNotificationModel({
    required this.id,
    this.title,
    this.content,
    this.createdAt,
    this.facility,
  });

  final int id;
  final String? title;
  final String? content;

  /// `yyyy-MM-dd`.
  final String? createdAt;
  final NotificationFacilityModel? facility;

  factory AppNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class NotificationFacilityModel {
  const NotificationFacilityModel({
    required this.id,
    this.name,
    this.logo,
    this.facilityType,
    this.activityLineId,
  });

  final int id;
  final String? name;
  final String? logo;
  final String? facilityType;
  final int? activityLineId;

  factory NotificationFacilityModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationFacilityModelFromJson(json);
}
