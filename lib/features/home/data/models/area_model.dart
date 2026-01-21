import 'package:json_annotation/json_annotation.dart';

part 'area_model.g.dart';

/// Data model for area from API.
@JsonSerializable(checked: true)
class AreaModel {
  const AreaModel({
    required this.id,
    required this.name,
    this.countryId,
    this.cityId,
  });

  final int id;
  final String name;
  @JsonKey(name: 'country_id')
  final int? countryId;
  @JsonKey(name: 'city_id')
  final int? cityId;

  factory AreaModel.fromJson(Map<String, dynamic> json) => _$AreaModelFromJson(json);

  Map<String, dynamic> toJson() => _$AreaModelToJson(this);
}
