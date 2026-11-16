import 'package:coflow_users_v2/features/activity_line/data/models/facility_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saved_profile_model.g.dart';

/// One page of the user's saved facilities — the paginator `GET wishlist`
/// returns under `profiles`.
///
/// The envelope's other key, `activity_lines`, lists every line with its
/// *global* facility count rather than how many the user saved on it, so it is
/// left unread: the Profiles filter is the four fixed lines.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SavedProfilesPageModel {
  const SavedProfilesPageModel({
    this.currentPage = 1,
    this.lastPage = 1,
    this.profiles = const <SavedProfileModel>[],
  });

  @JsonKey(defaultValue: 1)
  final int currentPage;

  @JsonKey(defaultValue: 1)
  final int lastPage;

  @JsonKey(name: 'data', defaultValue: <SavedProfileModel>[])
  final List<SavedProfileModel> profiles;

  factory SavedProfilesPageModel.fromJson(Map<String, dynamic> json) =>
      _$SavedProfilesPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SavedProfilesPageModelToJson(this);
}

/// One wishlist row: a single flag the user set, wrapping the facility it is
/// set on.
///
/// The wishlist keeps one row per flag rather than one per facility — saving
/// adds a `save` row and tracking adds a `track` row beside it — so a tracked
/// facility arrives twice.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SavedProfileModel {
  const SavedProfileModel({
    required this.id,
    this.facilityId,
    this.type,
    this.facility,
  });

  /// The row's own id — not the facility's.
  final int id;

  /// Null on a row about a promotion instead — rows carry a `promotion_id` too.
  final int? facilityId;

  /// `save` or `track`.
  final String? type;

  /// The facility's record, with `city`, `area` and `likes_count`.
  ///
  /// Null if the facility has been deleted since it was saved.
  final FacilityModel? facility;

  factory SavedProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SavedProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$SavedProfileModelToJson(this);
}
