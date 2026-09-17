// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountStatisticsModel _$AccountStatisticsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AccountStatisticsModel', json, ($checkedConvert) {
  final val = AccountStatisticsModel(
    calendars: $checkedConvert('calendars', (v) => (v as num).toInt()),
    purchases: $checkedConvert('purchases', (v) => (v as num).toInt()),
    gifts: $checkedConvert('gifts', (v) => (v as num).toInt()),
    profiles: $checkedConvert('profiles', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$AccountStatisticsModelToJson(
  AccountStatisticsModel instance,
) => <String, dynamic>{
  'calendars': instance.calendars,
  'purchases': instance.purchases,
  'gifts': instance.gifts,
  'profiles': instance.profiles,
};
