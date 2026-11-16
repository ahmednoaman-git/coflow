import 'package:freezed_annotation/freezed_annotation.dart';

part 'preference_activity_line_entity.freezed.dart';

/// An activity line (Sky, Sea, Earth, Energy) and the tags a customer can pick
/// under it, from `GET account-tags`.
@freezed
abstract class PreferenceActivityLineEntity with _$PreferenceActivityLineEntity {
  const factory PreferenceActivityLineEntity({
    required int id,

    /// The server's name, shown only for lines the app has no name for.
    required String name,
    required List<PreferenceTagEntity> tags,
  }) = _PreferenceActivityLineEntity;
}

@freezed
abstract class PreferenceTagEntity with _$PreferenceTagEntity {
  const factory PreferenceTagEntity({required int id, required String name}) = _PreferenceTagEntity;
}
