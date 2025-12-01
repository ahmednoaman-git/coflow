import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_dto.freezed.dart';
part 'verify_otp_dto.g.dart';

/// Data Transfer Object for OTP verification.
@freezed
abstract class VerifyOtpDto with _$VerifyOtpDto {
  const factory VerifyOtpDto({
    required String email,

    /// The OTP code. Serializes as 'code' in JSON.
    // ignore: invalid_annotation_target
    @JsonKey(name: 'code') required String otp,
  }) = _VerifyOtpDto;

  factory VerifyOtpDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpDtoFromJson(json);
}
