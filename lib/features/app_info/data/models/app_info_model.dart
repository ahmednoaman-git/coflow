import 'package:json_annotation/json_annotation.dart';

part 'app_info_model.g.dart';

/// `GET info`: legal texts, contact details and app settings. Only the fields
/// the app shows are read.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class AppInfoModel {
  const AppInfoModel({this.terms, this.policy, this.email, this.phone});

  final String? terms;
  final String? policy;
  final String? email;
  final String? phone;

  factory AppInfoModel.fromJson(Map<String, dynamic> json) => _$AppInfoModelFromJson(json);
}
