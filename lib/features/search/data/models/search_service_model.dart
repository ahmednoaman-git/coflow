import 'package:coflow_users_v2/features/activity_line/data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_service_model.g.dart';

/// A service entry from `search?type=service`.
///
/// The payload embeds the offering facility in full, which is what lets a
/// result open the facility's service details screen directly.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SearchServiceModel {
  const SearchServiceModel({
    required this.id,
    required this.name,
    required this.facility,
    this.type,
    this.image,
    this.duration,
    this.reservations,
  });

  final int id;
  final String name;

  /// `activity`, `flow` or `course`.
  final String? type;

  final String? image;
  final String? duration;
  final int? reservations;

  final FacilityModel facility;

  factory SearchServiceModel.fromJson(Map<String, dynamic> json) =>
      _$SearchServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchServiceModelToJson(this);
}
