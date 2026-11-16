import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'activity_preferences_state.freezed.dart';

@freezed
abstract class ActivityPreferencesState with _$ActivityPreferencesState {
  const ActivityPreferencesState._();

  const factory ActivityPreferencesState({
    @Default(AsyncState.idle()) AsyncState<ActivityPreferencesEntity> preferencesRequest,
    @Default(AsyncState.idle()) AsyncState<void> saveRequest,

    /// The picks being edited, or null while they still match the saved ones.
    Set<int>? draft,
  }) = _ActivityPreferencesState;

  Set<int> get savedTagIds => preferencesRequest.dataOrNull?.selectedTagIds ?? const {};

  /// What the chips show: the draft, else what's saved.
  Set<int> get selectedTagIds => draft ?? savedTagIds;

  bool get hasChanges => draft != null && !setEquals(draft, savedTagIds);

  /// The server refuses an empty selection (`tags` is required), so the picks
  /// can be changed but never cleared.
  bool get canSave => hasChanges && selectedTagIds.isNotEmpty;

  /// Whether to explain why Save is off: saved picks were all unpicked.
  bool get needsAPick => hasChanges && selectedTagIds.isEmpty;
}
