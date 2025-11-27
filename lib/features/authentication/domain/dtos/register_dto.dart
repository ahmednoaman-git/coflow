import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/user_entity.dart';

part 'register_dto.freezed.dart';

/// Data Transfer Object for user registration.
@freezed
abstract class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    required String name,
    required String email,
    required String password,
    required DateTime birthdate,
    required Gender gender,
    required String nationality,
    required String phone,
    required String otpCode,
    File? image,
  }) = _RegisterDto;
}
