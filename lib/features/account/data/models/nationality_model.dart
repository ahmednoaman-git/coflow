import 'package:json_annotation/json_annotation.dart';

part 'nationality_model.g.dart';

/// One row of `GET nationalities`: the values the backend stores as a user's
/// nationality.
@JsonSerializable(checked: true)
class NationalityModel {
  const NationalityModel({required this.id, required this.name});

  final int id;
  final String name;

  factory NationalityModel.fromJson(Map<String, dynamic> json) => _$NationalityModelFromJson(json);

  Map<String, dynamic> toJson() => _$NationalityModelToJson(this);
}
