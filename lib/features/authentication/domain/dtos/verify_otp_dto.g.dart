// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyOtpDto _$VerifyOtpDtoFromJson(Map<String, dynamic> json) =>
    _VerifyOtpDto(email: json['email'] as String, otp: json['code'] as String);

Map<String, dynamic> _$VerifyOtpDtoToJson(_VerifyOtpDto instance) =>
    <String, dynamic>{'email': instance.email, 'code': instance.otp};
