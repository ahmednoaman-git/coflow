import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/dtos/dtos.dart';
import 'package:coflow_users_v2/features/facility/domain/use_cases/use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'saved_profiles_state.dart';

/// Drives the Profiles screen: the saved list, the activity-line filter, and
/// the two per-card verbs (tracking and unsaving).
///
/// Both verbs are the facility's own toggles — the same call flips the flag
/// either way — so neither may be fired again while one is in flight: a
/// second tap would quietly undo the first on the server.
@injectable
class SavedProfilesCubit extends Cubit<SavedProfilesState> {
  SavedProfilesCubit(this._getSavedProfiles, this._toggleFacilitySave, this._toggleFacilityTracking)
    : super(const SavedProfilesState()) {
    profilesManager = .new(
      accessor: (
        getPartialState: (state) => state.profilesRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(profilesRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      defaultRequest: _getSavedProfiles(),
    );

    unsaveManager = .new(
      accessor: (
        getPartialState: (state) => state.unsaveRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(unsaveRequest: partial),
      ),
      emit: emit,
    );

    trackingManager = .new(
      accessor: (
        getPartialState: (state) => state.trackingRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(trackingRequest: partial),
      ),
      emit: emit,
    );
  }

  final GetSavedProfilesUseCase _getSavedProfiles;
  final ToggleFacilitySaveUseCase _toggleFacilitySave;
  final ToggleFacilityTrackingUseCase _toggleFacilityTracking;

  late final AsyncRequestManager<SavedProfilesState, List<SavedProfileEntity>> profilesManager;
  late final AsyncRequestManager<SavedProfilesState, void> unsaveManager;
  late final AsyncRequestManager<SavedProfilesState, void> trackingManager;

  Future<void> refresh() => profilesManager.refresh();

  /// Re-reads the list in place, without dropping back to the shimmer.
  ///
  /// Used on return from a facility's profile, where the user may have unsaved
  /// it. A failure keeps the list already on screen: it was right a moment ago,
  /// and pull-to-refresh is there if it has drifted.
  Future<void> resync() async {
    if (!profilesManager.isSuccess) return;

    final result = await _getSavedProfiles().run();
    if (isClosed) return;

    result.match((_) {}, _emitProfiles);
  }

  /// Picks a line to filter on. Tapping the selected one clears back to "All",
  /// which is also where the screen starts.
  void selectLine(ActivityLineEntity line) {
    emit(state.copyWith(selectedLine: state.selectedLine == line ? null : line));
  }

  /// Flips update-tracking for one card, restoring the old value if the request
  /// fails so the button never claims a state the server did not take.
  Future<void> toggleTracking(SavedProfileEntity profile) async {
    if (trackingManager.isLoading) return;

    _replaceProfile(profile.copyWith(isTracked: !profile.isTracked));

    await trackingManager.execute(
      _toggleFacilityTracking(ToggleFacilityTrackingDto(facilityId: profile.id)),
    );

    if (trackingManager.isError) _replaceProfile(profile);
  }

  /// Unsaves a swiped card, reporting whether it should leave the list.
  ///
  /// Unlike tracking this is not optimistic: the row is still on screen under
  /// the user's finger, so a failure can simply put it back rather than having
  /// to explain a card that vanished and returned.
  Future<bool> unsave(SavedProfileEntity profile) async {
    if (unsaveManager.isLoading) return false;

    await unsaveManager.execute(
      _toggleFacilitySave(ToggleFacilitySaveDto(facilityId: profile.id)),
    );

    return !unsaveManager.isError;
  }

  /// Drops a row once its dismiss animation has played.
  void removeUnsaved(SavedProfileEntity profile) {
    _emitProfiles([
      for (final saved in state.profiles)
        if (saved.id != profile.id) saved,
    ]);
  }

  void _replaceProfile(SavedProfileEntity profile) {
    _emitProfiles([
      for (final saved in state.profiles)
        if (saved.id == profile.id) profile else saved,
    ]);
  }

  /// Writes a new list straight into the request's success state, which is the
  /// only place the list lives.
  void _emitProfiles(List<SavedProfileEntity> profiles) {
    emit(state.copyWith(profilesRequest: AsyncState.success(profiles)));
  }
}
