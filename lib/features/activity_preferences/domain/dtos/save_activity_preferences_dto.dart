import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_activity_preferences_dto.freezed.dart';

/// `POST account-preferences`: the full set of picked tags (it replaces the
/// previous set).
@freezed
abstract class SaveActivityPreferencesDto with _$SaveActivityPreferencesDto {
  const SaveActivityPreferencesDto._();

  const factory SaveActivityPreferencesDto({required List<int> tagIds}) =
      _SaveActivityPreferencesDto;

  Map<String, dynamic> toJson() => {'tags': tagIds};
}
