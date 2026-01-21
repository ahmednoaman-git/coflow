import 'package:json_annotation/json_annotation.dart';

part 'tag_model.g.dart';

/// Data model for facility tag from API.
@JsonSerializable(checked: true)
class TagModel {
  const TagModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory TagModel.fromJson(Map<String, dynamic> json) => _$TagModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagModelToJson(this);
}

/// Data model for tag with count from API.
@JsonSerializable(checked: true)
class TagWithCountModel {
  const TagWithCountModel({
    required this.id,
    required this.name,
    required this.count,
  });

  final int id;
  final String name;
  final int count;

  factory TagWithCountModel.fromJson(Map<String, dynamic> json) =>
      _$TagWithCountModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagWithCountModelToJson(this);
}
