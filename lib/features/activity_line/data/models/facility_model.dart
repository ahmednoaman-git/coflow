import 'package:coflow_users_v2/features/home/data/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

import 'tag_model.dart';

part 'facility_model.g.dart';

/// Data model for facility from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityModel {
  const FacilityModel({
    required this.id,
    required this.name,
    this.logo,
    this.cover,
    required this.title,
    required this.views,
    this.rate,
    this.tags,
    this.facilityType,
    required this.activityLineId,
    required this.status,
    this.statusMsg,
    required this.subscription,
    required this.paymentType,
    this.activitiesCount,
    this.flowsCount,
    this.coursesCount,
    this.reviewsCount,
    this.promotionsCount,
    this.slotsCount,
    required this.activityLine,
    this.city,
    this.area,
  });

  final int id;
  final String name;
  final String? logo;
  final String? cover;
  final String title;
  final int views;
  final String? rate;
  final List<TagModel>? tags;
  final String? facilityType;
  final int activityLineId;
  final String status;
  final String? statusMsg;
  final String subscription;
  final String paymentType;
  final int? activitiesCount;
  final int? flowsCount;
  final int? coursesCount;
  final int? reviewsCount;
  final int? promotionsCount;
  final int? slotsCount;
  final ActivityLineModel activityLine;
  final CityModel? city;
  final AreaModel? area;

  factory FacilityModel.fromJson(Map<String, dynamic> json) => _$FacilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityModelToJson(this);
}
