// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityTagModel _$FacilityTagModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FacilityTagModel', json, ($checkedConvert) {
      final val = FacilityTagModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$FacilityTagModelToJson(FacilityTagModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
