import 'package:json_annotation/json_annotation.dart';

import 'facility_model.dart';
import 'tag_model.dart';

part 'facilities_response_model.g.dart';

/// API response model for facilities endpoint.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilitiesResponseModel {
  const FacilitiesResponseModel({
    required this.facilities,
    required this.tags,
  });

  final List<FacilityModel> facilities;
  final List<TagWithCountModel> tags;

  factory FacilitiesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FacilitiesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitiesResponseModelToJson(this);
}
