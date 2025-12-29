// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityLineModel _$ActivityLineModelFromJson(Map<String, dynamic> json) =>
    ActivityLineModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String?,
      color: json['color'] as String?,
      facilities: (json['facilities'] as num).toInt(),
    );

Map<String, dynamic> _$ActivityLineModelToJson(ActivityLineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'color': instance.color,
      'facilities': instance.facilities,
    };
