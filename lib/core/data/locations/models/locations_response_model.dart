import 'package:freezed_annotation/freezed_annotation.dart';

part 'locations_response_model.freezed.dart';
part 'locations_response_model.g.dart';

/// Response model for locations API.
@freezed
abstract class LocationsResponseModel with _$LocationsResponseModel {
  const factory LocationsResponseModel({
    required List<CityModel> cities,
    required int remote,
  }) = _LocationsResponseModel;

  factory LocationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LocationsResponseModelFromJson(json);
}

/// City model from API.
@freezed
abstract class CityModel with _$CityModel {
  const factory CityModel({
    required int id,
    required String name,
    @JsonKey(name: 'country_id') int? countryId,
    int? count,
    List<AreaModel>? areas,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}

/// Area model from API.
@freezed
abstract class AreaModel with _$AreaModel {
  const factory AreaModel({
    required int id,
    required String name,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'city_id') int? cityId,
    int? count,
  }) = _AreaModel;

  factory AreaModel.fromJson(Map<String, dynamic> json) =>
      _$AreaModelFromJson(json);
}
