import 'package:coflow_users_v2/features/authentication/domain/dtos/dtos.dart';
import 'package:coflow_users_v2/features/authentication/domain/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_dto.freezed.dart';
part 'update_profile_dto.g.dart';

/// Body of `POST profile`. The endpoint requires every field, so the edit form
/// always sends the whole set, unchanged fields included.
@Freezed(toJson: true, fromJson: false)
abstract class UpdateProfileDto with _$UpdateProfileDto {
  const factory UpdateProfileDto({
    required String name,
    required String email,
    required String phone,
    @DateFormatConverter() required DateTime birthdate,
    @GenderConverter() required Gender gender,
    required String nationality,
  }) = _UpdateProfileDto;
}
