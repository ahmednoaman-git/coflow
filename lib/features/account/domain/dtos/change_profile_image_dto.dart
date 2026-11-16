import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_profile_image_dto.freezed.dart';

/// Input of `POST change-image`: the picked photo, sent as multipart `image`.
@freezed
abstract class ChangeProfileImageDto with _$ChangeProfileImageDto {
  const factory ChangeProfileImageDto({required File image}) = _ChangeProfileImageDto;
}
