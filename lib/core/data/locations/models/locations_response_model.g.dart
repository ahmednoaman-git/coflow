// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationsResponseModel _$LocationsResponseModelFromJson(
  Map<String, dynamic> json,
) => _LocationsResponseModel(
  cities: (json['cities'] as List<dynamic>)
      .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  remote: (json['remote'] as num).toInt(),
);

Map<String, dynamic> _$LocationsResponseModelToJson(
  _LocationsResponseModel instance,
) => <String, dynamic>{'cities': instance.cities, 'remote': instance.remote};

_CityModel _$CityModelFromJson(Map<String, dynamic> json) => _CityModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  countryId: (json['country_id'] as num?)?.toInt(),
  count: (json['count'] as num?)?.toInt(),
  areas: (json['areas'] as List<dynamic>?)
      ?.map((e) => AreaModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CityModelToJson(_CityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'count': instance.count,
      'areas': instance.areas,
    };

_AreaModel _$AreaModelFromJson(Map<String, dynamic> json) => _AreaModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  countryId: (json['country_id'] as num?)?.toInt(),
  cityId: (json['city_id'] as num?)?.toInt(),
  count: (json['count'] as num?)?.toInt(),
);

Map<String, dynamic> _$AreaModelToJson(_AreaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'city_id': instance.cityId,
      'count': instance.count,
    };
