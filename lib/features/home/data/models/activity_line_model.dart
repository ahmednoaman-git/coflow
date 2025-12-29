import 'package:json_annotation/json_annotation.dart';

part 'activity_line_model.g.dart';

/// Data model for activity line from API.
@JsonSerializable()
class ActivityLineModel {
  const ActivityLineModel({
    required this.id,
    required this.name,
    this.image,
    this.color,
    required this.facilities,
  });

  final int id;
  final String name;
  final String? image;
  final String? color;
  final int facilities;

  factory ActivityLineModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityLineModelToJson(this);
}
