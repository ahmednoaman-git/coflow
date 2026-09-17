import 'package:json_annotation/json_annotation.dart';

part 'search_instructor_model.g.dart';

/// An instructor entry from `search?type=instructor`.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SearchInstructorModel {
  const SearchInstructorModel({
    required this.id,
    required this.fullName,
    this.title,
    this.image,
    this.centerName,
    this.experienceYears,
  });

  final int id;
  final String fullName;
  final String? title;
  final String? image;
  final String? centerName;
  final String? experienceYears;

  factory SearchInstructorModel.fromJson(Map<String, dynamic> json) =>
      _$SearchInstructorModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchInstructorModelToJson(this);
}
