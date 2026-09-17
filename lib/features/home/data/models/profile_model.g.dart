// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  logo: json['logo'] as String?,
  cover: json['cover'] as String?,
  title: json['title'] as String,
  activityLine: ActivityLineModel.fromJson(
    json['activity_line'] as Map<String, dynamic>,
  ),
  city: json['city'] == null
      ? null
      : CityModel.fromJson(json['city'] as Map<String, dynamic>),
  area: json['area'] == null
      ? null
      : AreaModel.fromJson(json['area'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'cover': instance.cover,
      'title': instance.title,
      'activity_line': instance.activityLine,
      'city': instance.city,
      'area': instance.area,
    };
