import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_support_request_dto.freezed.dart';

/// `POST supports`: the issue text and an optional screenshot.
@freezed
abstract class CreateSupportRequestDto with _$CreateSupportRequestDto {
  const factory CreateSupportRequestDto({required String issue, File? image}) =
      _CreateSupportRequestDto;
}
