// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportRequestModel _$SupportRequestModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  'SupportRequestModel',
  json,
  ($checkedConvert) {
    final val = SupportRequestModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      issue: $checkedConvert('issue', (v) => v as String?),
      description: $checkedConvert('description', (v) => v as String?),
      notes: $checkedConvert('notes', (v) => v as String?),
      adminResponse: $checkedConvert('admin_response', (v) => v as String?),
      status: $checkedConvert('status', (v) => v as String?),
      image: $checkedConvert('image', (v) => v as String?),
      createdAt: $checkedConvert('created_at', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'adminResponse': 'admin_response',
    'createdAt': 'created_at',
  },
);
