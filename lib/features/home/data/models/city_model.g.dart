// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CityModel', json, ($checkedConvert) {
      final val = CityModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        countryId: $checkedConvert('country_id', (v) => (v as num?)?.toInt()),
      );
      return val;
    }, fieldKeyMap: const {'countryId': 'country_id'});

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'country_id': instance.countryId,
};
