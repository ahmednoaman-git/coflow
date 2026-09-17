import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'saved_profiles_state.freezed.dart';

/// State for [SavedProfilesCubit].
///
/// The saved list lives inside [profilesRequest] rather than beside it, so the
/// optimistic edits made by tracking and unsaving cannot drift out of step with
/// what the last fetch returned.
@freezed
abstract class SavedProfilesState with _$SavedProfilesState {
  const factory SavedProfilesState({
    @Default(AsyncState.idle()) AsyncState<List<SavedProfileEntity>> profilesRequest,
    @Default(AsyncState.idle()) AsyncState<void> unsaveRequest,
    @Default(AsyncState.idle()) AsyncState<void> trackingRequest,

    /// The activity line being filtered on, or null for "All" — the default.
    ActivityLineEntity? selectedLine,
  }) = _SavedProfilesState;

  const SavedProfilesState._();

  /// Everything saved, regardless of the filter.
  List<SavedProfileEntity> get profiles => switch (profilesRequest) {
    AsyncSuccess<List<SavedProfileEntity>>(:final data) => data,
    _ => const [],
  };

  /// What the list actually renders: the saved profiles on the selected line,
  /// or all of them when no line is selected.
  List<SavedProfileEntity> get visibleProfiles {
    final line = selectedLine;
    if (line == null) return profiles;

    return profiles.where((profile) => profile.activityLine == line).toList(growable: false);
  }

  /// Whether the filter is hiding profiles the user does have saved — an empty
  /// list then means "none on this line", not "none at all".
  bool get isFiltered => selectedLine != null;
}
