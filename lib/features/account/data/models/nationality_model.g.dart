// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nationality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NationalityModel _$NationalityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('NationalityModel', json, ($checkedConvert) {
      final val = NationalityModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$NationalityModelToJson(NationalityModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
