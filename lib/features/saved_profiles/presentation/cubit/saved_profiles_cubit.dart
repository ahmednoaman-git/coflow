import 'dart:async';

import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/dtos/dtos.dart';
import 'package:coflow_users_v2/features/facility/domain/events/events.dart';
import 'package:coflow_users_v2/features/facility/domain/use_cases/use_cases.dart';
import 'package:flutter/widgets.dart' show Key, ValueKey, visibleForTesting;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' show Right, TaskEither;
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'saved_profiles_state.dart';

/// Drives the Profiles screen: the saved list, the activity-line filter, and
/// the two per-card verbs (tracking and unsaving).
///
/// The list refreshes in the background once loaded, and both verbs are
/// optimistic edits on it (see [AsyncRequestManager.mutate] and
/// [OptimisticToggleManager.optimisticToggle]): the card changes at once, is
/// put back if the server refuses — the failure is reported beside the list —
/// and keeps the change through any refresh that lands meanwhile. Tracking
/// merges a card's taps ([ConsolidatedToggle]) so spamming the bell sends at
/// most one call at a time, and none when the taps cancel out; a card is
/// unsaved once, however it is swiped.
@injectable
class SavedProfilesCubit extends Cubit<SavedProfilesState> {
  SavedProfilesCubit(
    this._getSavedProfiles,
    this._toggleFacilitySave,
    this._toggleFacilityTracking,
    this._saveEvents,
  ) : super(const SavedProfilesState()) {
    _saveChanges = _saveEvents.changes.listen(_onSaveChange);
    profilesManager = .new(
      accessor: (
        getPartialState: (state) => state.profilesRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(profilesRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _getSavedProfiles(),
      refreshInBackground: true,
    );
  }

  final GetSavedProfilesUseCase _getSavedProfiles;
  final ToggleFacilitySaveUseCase _toggleFacilitySave;
  final ToggleFacilityTrackingUseCase _toggleFacilityTracking;
  final FacilitySaveEvents _saveEvents;
  late final StreamSubscription<FacilitySaveChange> _saveChanges;

  late final AsyncRequestManager<SavedProfilesState, List<SavedProfileEntity>> profilesManager;

  /// How long a card's bell must be left alone before its taps are sent.
  @visibleForTesting
  static Duration trackingSettle = const Duration(milliseconds: 400);

  /// Each card's tracking toggle, by facility id, made on its first tap.
  final _tracking = <int, ConsolidatedToggle>{};

  /// Facilities swiped away whose unsave the server hasn't confirmed yet.
  final _unsaving = <int>{};

  /// How many times each card has come back after a refused unsave.
  final _restores = <int, int>{};

  /// Identifies [profile]'s card for its swipe. A card put back after a refused
  /// unsave gets a new one: the old swipe ended dismissed, and a card coming
  /// back under its key — before the frame that removed it, if the server
  /// answered that fast — would stay collapsed.
  Key dismissKeyOf(SavedProfileEntity profile) =>
      ValueKey((profile.id, _restores[profile.id] ?? 0));

  /// Re-reads the list in place, without dropping back to the shimmer — on
  /// pull-to-refresh, and on return from a facility's profile, where the user
  /// may have unsaved it. Changes the server hasn't caught up with yet are
  /// kept; a failure keeps the list already on screen.
  Future<void> refresh() => profilesManager.refresh();

  /// Picks a line to filter on. Tapping the selected one clears back to "All",
  /// which is also where the screen starts.
  void selectLine(ActivityLineEntity line) {
    emit(state.copyWith(selectedLine: state.selectedLine == line ? null : line));
  }

  /// Flips update-tracking for one card at once. Its taps are merged before
  /// anything is sent; a failure puts the bell back to what the server holds.
  ///
  /// A card's toggle lives while it has taps to send. The next tap after that
  /// starts a new one from the card as shown, so a refresh that brought news
  /// from elsewhere is taken as the starting point.
  void toggleTracking(SavedProfileEntity profile) {
    if (isClosed || _unsaving.contains(profile.id)) return;

    final current = _tracking[profile.id];
    final toggle = current != null && current.isPending
        ? current
        : _tracking[profile.id] = profilesManager.optimisticToggle(
            value: profile.isTracked,
            settle: trackingSettle,
            send: () => _toggleFacilityTracking(ToggleFacilityTrackingDto(facilityId: profile.id)),
            show: (profiles, tracked) => [
              for (final saved in profiles)
                if (saved.id == profile.id) saved.copyWith(isTracked: tracked) else saved,
            ],
            onSettled: (tracked) => _report(profile.id, isSaved: true, isTracked: tracked),
            // A step may have landed before the one that failed.
            onFailed: (_, tracked) => _report(profile.id, isSaved: true, isTracked: tracked),
          );
    toggle.flip();
  }

  /// Whether a swiped card may go: once per card, however often it is swiped.
  /// The unsave itself is sent once the card is gone ([removeUnsaved]).
  bool unsave(SavedProfileEntity profile) => !_unsaving.contains(profile.id);

  /// Drops a swiped card once its dismiss animation has played, then unsaves
  /// it — optimistically: if the server refuses, the card comes back where it
  /// was and the failure is reported beside the list.
  Future<void> removeUnsaved(SavedProfileEntity profile) async {
    if (!_unsaving.add(profile.id)) return;

    final result = await profilesManager.mutate(
      // Bell taps still waiting would race the unsave — tracking an unsaved
      // facility saves it again — so they are dropped first, and one already
      // out is let back.
      TaskEither<Failure, void>(() async {
        await _tracking.remove(profile.id)?.discard();
        return const Right(null);
      }).flatMap((_) => _toggleFacilitySave(ToggleFacilitySaveDto(facilityId: profile.id))),
      apply: (profiles) => [
        for (final saved in profiles)
          if (saved.id != profile.id) saved,
      ],
    );
    _unsaving.remove(profile.id);

    if (result.isLeft()) {
      _restores.update(profile.id, (count) => count + 1, ifAbsent: () => 1);
    } else {
      _report(profile.id, isSaved: false, isTracked: false);
    }
  }

  /// Tells the other screens showing [facilityId] what the server now holds.
  void _report(int facilityId, {required bool isSaved, required bool isTracked}) =>
      _saveEvents.report(
        FacilitySaveChange(
          facilityId: facilityId,
          isSaved: isSaved,
          isTracked: isTracked,
          source: this,
        ),
      );

  /// Another screen changed a facility's flags — e.g. its profile's bookmark.
  /// An unsave drops the card and a tracking change relights its bell, at
  /// once; a facility newly saved is read in with the list, as only the server
  /// has its card. Bell taps not yet sent for it are dropped: the news wins.
  void _onSaveChange(FacilitySaveChange change) {
    if (isClosed || change.source == this) return;
    final profiles = profilesManager.data;
    // Not loaded yet: the first load will have it.
    if (profiles == null) return;

    final id = change.facilityId;
    final listed = profiles.any((profile) => profile.id == id);
    if (listed) unawaited(_tracking.remove(id)?.discard());

    if (!change.isSaved) {
      if (!listed) return;
      profilesManager.update(
        (profiles) => [
          for (final saved in profiles)
            if (saved.id != id) saved,
        ],
      );
    } else if (listed) {
      profilesManager.update(
        (profiles) => [
          for (final saved in profiles)
            if (saved.id == id) saved.copyWith(isTracked: change.isTracked) else saved,
        ],
      );
    } else {
      unawaited(refresh());
    }
  }

  void _emitIfOpen(SavedProfilesState next) {
    if (!isClosed) emit(next);
  }

  @override
  Future<void> close() {
    unawaited(_saveChanges.cancel());
    // Bell taps made just before leaving still reach the server.
    for (final toggle in _tracking.values) {
      unawaited(toggle.close());
    }
    return super.close();
  }
}
