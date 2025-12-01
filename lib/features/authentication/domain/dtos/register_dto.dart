import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../entities/user_entity.dart';

part 'register_dto.freezed.dart';
part 'register_dto.g.dart';

/// Converts DateTime to 'yyyy-MM-dd' format string for JSON serialization.
class DateFormatConverter implements JsonConverter<DateTime, String> {
  const DateFormatConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => DateFormat('yyyy-MM-dd').format(object);
}

/// Converts Gender enum to/from string for JSON serialization.
class GenderConverter implements JsonConverter<Gender, String> {
  const GenderConverter();

  @override
  Gender fromJson(String json) =>
      Gender.values.firstWhere((e) => e.name == json);

  @override
  String toJson(Gender object) => object.name;
}

/// Data Transfer Object for user registration.
@Freezed(toJson: true, fromJson: true)
abstract class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    required String name,
    required String email,
    required String password,
    @DateFormatConverter() required DateTime birthdate,
    @GenderConverter() required Gender gender,
    required String nationality,
    required String phone,
    required String otpCode,

    /// Image file for user avatar. Excluded from JSON serialization.
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false, includeFromJson: false) File? image,
  }) = _RegisterDto;

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);
}
