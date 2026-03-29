import 'package:json_annotation/json_annotation.dart';

part 'facility_tag_model.g.dart';

int _intFromJson(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  final asString = value?.toString();
  return asString == null ? 0 : int.tryParse(asString) ?? 0;
}

String _stringFromJson(Object? value) => value?.toString() ?? '';

/// Facility tag model.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityTagModel {
  const FacilityTagModel({
    required this.id,
    required this.name,
  });

  @JsonKey(fromJson: _intFromJson)
  final int id;

  @JsonKey(fromJson: _stringFromJson)
  final String name;

  factory FacilityTagModel.fromJson(Map<String, dynamic> json) => _$FacilityTagModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityTagModelToJson(this);
}
