// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaModel _$AreaModelFromJson(Map<String, dynamic> json) => AreaModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  countryId: (json['country_id'] as num).toInt(),
  cityId: (json['city_id'] as num).toInt(),
);

Map<String, dynamic> _$AreaModelToJson(AreaModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'country_id': instance.countryId,
  'city_id': instance.cityId,
};
