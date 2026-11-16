import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_profile_entity.freezed.dart';

/// A facility the user has saved, as shown on the Profiles screen.
@freezed
abstract class SavedProfileEntity with _$SavedProfileEntity {
  const factory SavedProfileEntity({
    /// The saved facility — also everything its profile screen needs to open.
    required CollapsedFacilityEntity facility,

    /// Where the facility is, e.g. `New Cairo, Cairo`. Null when the payload
    /// names neither the area nor the city.
    String? branchLabel,

    /// Whether the user is tracking this facility's updates.
    @Default(false) bool isTracked,
  }) = _SavedProfileEntity;

  const SavedProfileEntity._();

  /// The facility's id — the save and track toggles are keyed on it.
  int get id => facility.id;

  ActivityLineEntity get activityLine => facility.activityLine;

  bool get isTemporarilyClosed => facility.status == FacilityStatus.temporarilyClosed;
}
