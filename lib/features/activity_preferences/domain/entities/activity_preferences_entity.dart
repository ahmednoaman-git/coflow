import 'package:freezed_annotation/freezed_annotation.dart';

import 'preference_activity_line_entity.dart';

part 'activity_preferences_entity.freezed.dart';

/// Everything the Preferences screen opens with: the tags on offer and the ones
/// the customer already picked.
@freezed
abstract class ActivityPreferencesEntity with _$ActivityPreferencesEntity {
  const factory ActivityPreferencesEntity({
    required List<PreferenceActivityLineEntity> lines,
    required Set<int> selectedTagIds,
  }) = _ActivityPreferencesEntity;
}
