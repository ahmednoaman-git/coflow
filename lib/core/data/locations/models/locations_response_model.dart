import 'package:json_annotation/json_annotation.dart';

part 'locations_response_model.g.dart';

/// Response model for locations API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class LocationsResponseModel {
  const LocationsResponseModel({
    required this.cities,
    required this.remote,
  });

  final List<LocationCityModel> cities;
  final int remote;

  factory LocationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LocationsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsResponseModelToJson(this);
}

/// City model from API (for locations endpoint).
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class LocationCityModel {
  const LocationCityModel({
    required this.id,
    required this.name,
    this.countryId,
    this.count,
    this.areas,
  });

  final int id;
  final String name;
  final int? countryId;
  final int? count;
  final List<LocationAreaModel>? areas;

  factory LocationCityModel.fromJson(Map<String, dynamic> json) =>
      _$LocationCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationCityModelToJson(this);
}

/// Area model from API (for locations endpoint).
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class LocationAreaModel {
  const LocationAreaModel({
    required this.id,
    required this.name,
    this.countryId,
    this.cityId,
    this.count,
  });

  final int id;
  final String name;
  final int? countryId;
  final int? cityId;
  final int? count;

  factory LocationAreaModel.fromJson(Map<String, dynamic> json) =>
      _$LocationAreaModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationAreaModelToJson(this);
}
