import 'package:json_annotation/json_annotation.dart';

import 'facility_tag_model.dart';

part 'facility_profile_model.g.dart';

/// Facility profile model from API.
///
/// Note: The Dio client in v2 already extracts the top-level `data` field.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityProfileModel {
  const FacilityProfileModel({
    required this.id,
    required this.name,
    this.title,
    this.year,
    this.bio,
    this.likesCount,
    this.logo,
    this.cover,
    this.tags,
  });

  final int id;
  final String name;
  final String? title;
  final String? year;
  final String? bio;

  @JsonKey(name: 'likes_count')
  final int? likesCount;

  final String? logo;
  final String? cover;

  @JsonKey(defaultValue: <FacilityTagModel>[], disallowNullValue: true)
  final List<FacilityTagModel>? tags;

  factory FacilityProfileModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityProfileModelToJson(this);
}
