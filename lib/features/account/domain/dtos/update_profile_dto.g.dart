// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UpdateProfileDtoToJson(_UpdateProfileDto instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'birthdate': const DateFormatConverter().toJson(instance.birthdate),
  'gender': const GenderConverter().toJson(instance.gender),
  'nationality': instance.nationality,
};
