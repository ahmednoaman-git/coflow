import 'package:json_annotation/json_annotation.dart';

part 'facility_faq_model.g.dart';

/// A facility FAQ entry from the `faq/{facilityId}` endpoint.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityFaqModel {
  const FacilityFaqModel({
    required this.id,
    required this.question,
    required this.answer,
    this.sort,
    this.status,
  });

  final int id;
  final String question;
  final String answer;

  /// Display order the facility chose. Not unique — several entries share a
  /// sort value — so it is only used as a stable tiebreaker.
  final int? sort;

  /// `active` for entries the facility is publishing.
  final String? status;

  factory FacilityFaqModel.fromJson(Map<String, dynamic> json) => _$FacilityFaqModelFromJson(json);
}
