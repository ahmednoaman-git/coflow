import 'package:json_annotation/json_annotation.dart';

part 'support_request_model.g.dart';

/// A row of `GET supports`.
///
/// The server sends each text twice: `issue` and `description` are the same
/// value, as are `notes` and `admin_response`. Both of each are read so either
/// name can go away without the app losing the text.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class SupportRequestModel {
  const SupportRequestModel({
    required this.id,
    this.issue,
    this.description,
    this.notes,
    this.adminResponse,
    this.status,
    this.image,
    this.createdAt,
  });

  final int id;
  final String? issue;
  final String? description;
  final String? notes;
  final String? adminResponse;

  /// `new`, `pending` or `resolved`.
  final String? status;
  final String? image;

  /// `yyyy-MM-dd HH:mm:ss`, server time.
  final String? createdAt;

  factory SupportRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SupportRequestModelFromJson(json);
}
