// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotificationModel _$AppNotificationModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AppNotificationModel', json, ($checkedConvert) {
  final val = AppNotificationModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    title: $checkedConvert('title', (v) => v as String?),
    content: $checkedConvert('content', (v) => v as String?),
    createdAt: $checkedConvert('created_at', (v) => v as String?),
    facility: $checkedConvert(
      'facility',
      (v) => v == null ? null : NotificationFacilityModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
}, fieldKeyMap: const {'createdAt': 'created_at'});

NotificationFacilityModel _$NotificationFacilityModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'NotificationFacilityModel',
  json,
  ($checkedConvert) {
    final val = NotificationFacilityModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      logo: $checkedConvert('logo', (v) => v as String?),
      facilityType: $checkedConvert('facility_type', (v) => v as String?),
      activityLineId: $checkedConvert(
        'activity_line_id',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'facilityType': 'facility_type',
    'activityLineId': 'activity_line_id',
  },
);
