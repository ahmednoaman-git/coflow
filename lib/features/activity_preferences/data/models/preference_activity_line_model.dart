import 'package:json_annotation/json_annotation.dart';

part 'preference_activity_line_model.g.dart';

/// A row of `GET account-tags`: an activity line with its tags.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class PreferenceActivityLineModel {
  const PreferenceActivityLineModel({required this.id, this.name, this.tags = const []});

  final int id;
  final String? name;
  final List<PreferenceTagModel> tags;

  factory PreferenceActivityLineModel.fromJson(Map<String, dynamic> json) =>
      _$PreferenceActivityLineModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class PreferenceTagModel {
  const PreferenceTagModel({required this.id, required this.name});

  final int id;
  final String name;

  factory PreferenceTagModel.fromJson(Map<String, dynamic> json) =>
      _$PreferenceTagModelFromJson(json);
}
