// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityLineModel _$ActivityLineModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ActivityLineModel', json, ($checkedConvert) {
      final val = ActivityLineModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        image: $checkedConvert('image', (v) => v as String?),
        color: $checkedConvert('color', (v) => v as String?),
        facilities: $checkedConvert('facilities', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$ActivityLineModelToJson(ActivityLineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'color': instance.color,
      'facilities': instance.facilities,
    };
