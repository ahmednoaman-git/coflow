// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_facilities_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFacilitiesDto _$GetFacilitiesDtoFromJson(Map<String, dynamic> json) =>
    GetFacilitiesDto(
      locationType: json['location_type'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
      areaId: (json['area_id'] as num?)?.toInt(),
      activityLineId: (json['activity_line_id'] as num).toInt(),
      tagId: (json['tag_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetFacilitiesDtoToJson(GetFacilitiesDto instance) =>
    <String, dynamic>{
      'location_type': ?instance.locationType,
      'city_id': ?instance.cityId,
      'area_id': ?instance.areaId,
      'activity_line_id': instance.activityLineId,
      'tag_id': ?instance.tagId,
    };
