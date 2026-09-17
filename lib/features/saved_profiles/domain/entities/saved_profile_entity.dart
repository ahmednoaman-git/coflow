import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_profile_entity.freezed.dart';

/// A facility the user has saved, as shown on the Profiles screen.
///
/// Deliberately card-shaped: it carries only what a saved row renders, not the
/// full facility payload.
@freezed
abstract class SavedProfileEntity with _$SavedProfileEntity {
  const factory SavedProfileEntity({
    required int id,
    required String name,

    /// Short headline under the name, e.g. `Aerial Silks & Flexibility`.
    required String description,
    required ActivityLineEntity activityLine,
    required FacilityStatus status,
    String? logoUrl,
    @Default(0) int likeCount,

    /// The branch shown on the card, e.g. `New Cairo, Cairo`.
    ///
    /// TODO(backend): confirm which branch this is meant to be — a facility can
    /// have several. The design highlights exactly one per card; is it the main
    /// branch, the nearest one to the user, or the branch the user saved from?
    /// Until the endpoint says, the stub serves the main branch.
    String? branchLabel,

    /// Whether the user is tracking this facility's updates.
    ///
    /// TODO(backend): confirm what tracking actually subscribes the user to
    /// (push notifications on new services? schedule changes? offers?) and
    /// whether it is the same flag as the "Track Updates" action on the
    /// facility profile screen — the two should not diverge.
    @Default(false) bool isTracked,
  }) = _SavedProfileEntity;

  const SavedProfileEntity._();

  bool get isTemporarilyClosed => status == FacilityStatus.temporarilyClosed;
}
