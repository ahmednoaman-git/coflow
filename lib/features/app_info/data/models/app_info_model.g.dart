// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppInfoModel _$AppInfoModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AppInfoModel', json, ($checkedConvert) {
      final val = AppInfoModel(
        terms: $checkedConvert('terms', (v) => v as String?),
        policy: $checkedConvert('policy', (v) => v as String?),
        email: $checkedConvert('email', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
      );
      return val;
    });
