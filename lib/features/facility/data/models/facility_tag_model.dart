import 'package:json_annotation/json_annotation.dart';

part 'facility_tag_model.g.dart';

/// Facility tag model.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityTagModel {
  const FacilityTagModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory FacilityTagModel.fromJson(Map<String, dynamic> json) => _$FacilityTagModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityTagModelToJson(this);
}
