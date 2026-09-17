import 'package:json_annotation/json_annotation.dart';

part 'saved_profile_model.g.dart';

/// Response model for the user's saved facilities endpoint.
///
/// TODO(backend): shape is provisional — served by
/// `SavedProfilesStubDataSource` until the real endpoint ships. Field names
/// follow the collapsed-facility payload the activity-line list already gets,
/// on the assumption the saved list reuses it.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SavedProfilesResponseModel {
  const SavedProfilesResponseModel({this.profiles = const <SavedProfileModel>[]});

  @JsonKey(defaultValue: <SavedProfileModel>[])
  final List<SavedProfileModel> profiles;

  factory SavedProfilesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SavedProfilesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SavedProfilesResponseModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SavedProfileModel {
  const SavedProfileModel({
    required this.id,
    required this.name,
    required this.description,
    required this.activityLineId,
    this.status,
    this.logo,
    this.likesCount,
    this.branch,
    this.isTracked = false,
  });

  final int id;
  final String name;
  final String description;

  /// 1 sky · 2 sea · 3 earth · 4 energy.
  final int activityLineId;

  /// `visible`, `invisible` or `temp_closed`.
  final String? status;

  final String? logo;
  final int? likesCount;

  /// The branch highlighted on the card — see `SavedProfileEntity.branchLabel`.
  final SavedProfileBranchModel? branch;

  @JsonKey(defaultValue: false)
  final bool isTracked;

  factory SavedProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SavedProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$SavedProfileModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SavedProfileBranchModel {
  const SavedProfileBranchModel({required this.id, this.area, this.city});

  final int id;

  /// e.g. `New Cairo`.
  final String? area;

  /// e.g. `Cairo`.
  final String? city;

  factory SavedProfileBranchModel.fromJson(Map<String, dynamic> json) =>
      _$SavedProfileBranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SavedProfileBranchModelToJson(this);
}
