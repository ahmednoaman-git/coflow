import 'package:json_annotation/json_annotation.dart';

part 'app_faq_model.g.dart';

/// An entry of `GET admin-faq`: Coflow's own FAQs for every app it runs.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class AppFaqModel {
  const AppFaqModel({
    required this.id,
    required this.question,
    required this.answer,
    this.type,
    this.sort,
    this.status,
  });

  final int id;
  final String question;
  final String answer;

  /// Which app the entry is for: `customers` (this app), or `go`, `flow` and
  /// `pro` (the facility dashboards).
  final String? type;

  /// Display order the admin chose.
  final int? sort;

  /// `active` for entries being published.
  final String? status;

  factory AppFaqModel.fromJson(Map<String, dynamic> json) => _$AppFaqModelFromJson(json);
}
