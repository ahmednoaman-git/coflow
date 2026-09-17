// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationsResponseModel _$LocationsResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('LocationsResponseModel', json, ($checkedConvert) {
  final val = LocationsResponseModel(
    cities: $checkedConvert(
      'cities',
      (v) => (v as List<dynamic>)
          .map((e) => LocationCityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    remote: $checkedConvert('remote', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$LocationsResponseModelToJson(
  LocationsResponseModel instance,
) => <String, dynamic>{'cities': instance.cities, 'remote': instance.remote};

LocationCityModel _$LocationCityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LocationCityModel', json, ($checkedConvert) {
      final val = LocationCityModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        countryId: $checkedConvert('country_id', (v) => (v as num?)?.toInt()),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
        areas: $checkedConvert(
          'areas',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => LocationAreaModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'countryId': 'country_id'});

Map<String, dynamic> _$LocationCityModelToJson(LocationCityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'count': instance.count,
      'areas': instance.areas,
    };

LocationAreaModel _$LocationAreaModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LocationAreaModel',
      json,
      ($checkedConvert) {
        final val = LocationAreaModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          countryId: $checkedConvert('country_id', (v) => (v as num?)?.toInt()),
          cityId: $checkedConvert('city_id', (v) => (v as num?)?.toInt()),
          count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'countryId': 'country_id', 'cityId': 'city_id'},
    );

Map<String, dynamic> _$LocationAreaModelToJson(LocationAreaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'city_id': instance.cityId,
      'count': instance.count,
    };
