// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterDto _$RegisterDtoFromJson(Map<String, dynamic> json) => _RegisterDto(
  name: json['name'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  birthdate: const DateFormatConverter().fromJson(json['birthdate'] as String),
  gender: const GenderConverter().fromJson(json['gender'] as String),
  nationality: json['nationality'] as String,
  phone: json['phone'] as String,
  otpCode: json['otpCode'] as String,
);

Map<String, dynamic> _$RegisterDtoToJson(_RegisterDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'birthdate': const DateFormatConverter().toJson(instance.birthdate),
      'gender': const GenderConverter().toJson(instance.gender),
      'nationality': instance.nationality,
      'phone': instance.phone,
      'otpCode': instance.otpCode,
    };
