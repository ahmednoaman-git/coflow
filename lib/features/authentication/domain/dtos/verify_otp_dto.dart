import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_dto.freezed.dart';

/// Data Transfer Object for OTP verification.
@freezed
abstract class VerifyOtpDto with _$VerifyOtpDto {
  const factory VerifyOtpDto({required String email, required String otp}) =
      _VerifyOtpDto;
}
