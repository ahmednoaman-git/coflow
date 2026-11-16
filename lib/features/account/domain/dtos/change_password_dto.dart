import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_dto.freezed.dart';
part 'change_password_dto.g.dart';

/// Body of `POST change-password`.
@Freezed(toJson: true, fromJson: false)
abstract class ChangePasswordDto with _$ChangePasswordDto {
  const factory ChangePasswordDto({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'new_password') required String newPassword,
  }) = _ChangePasswordDto;
}
