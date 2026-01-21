// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaModel _$AreaModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AreaModel', json, ($checkedConvert) {
      final val = AreaModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        countryId: $checkedConvert('country_id', (v) => (v as num?)?.toInt()),
        cityId: $checkedConvert('city_id', (v) => (v as num?)?.toInt()),
      );
      return val;
    }, fieldKeyMap: const {'countryId': 'country_id', 'cityId': 'city_id'});

Map<String, dynamic> _$AreaModelToJson(AreaModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'country_id': instance.countryId,
  'city_id': instance.cityId,
};
