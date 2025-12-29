import 'package:json_annotation/json_annotation.dart';

import 'activity_line_model.dart';
import 'area_model.dart';
import 'city_model.dart';

part 'profile_model.g.dart';

/// Data model for business/facility profile from API.
@JsonSerializable()
class ProfileModel {
  const ProfileModel({
    required this.id,
    required this.name,
    this.logo,
    this.cover,
    required this.title,
    required this.activityLine,
    this.city,
    this.area,
  });

  final int id;
  final String name;
  final String? logo;
  final String? cover;
  final String title;
  @JsonKey(name: 'activity_line')
  final ActivityLineModel activityLine;
  final CityModel? city;
  final AreaModel? area;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
