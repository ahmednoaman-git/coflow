// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityProfileModel _$FacilityProfileModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilityProfileModel', json, ($checkedConvert) {
  $checkKeys(json, disallowNullValues: const ['tags']);
  final val = FacilityProfileModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    title: $checkedConvert('title', (v) => v as String?),
    year: $checkedConvert('year', (v) => v as String?),
    bio: $checkedConvert('bio', (v) => v as String?),
    likesCount: $checkedConvert('likes_count', (v) => (v as num?)?.toInt()),
    logo: $checkedConvert('logo', (v) => v as String?),
    cover: $checkedConvert('cover', (v) => v as String?),
    tags: $checkedConvert(
      'tags',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => FacilityTagModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    ),
  );
  return val;
}, fieldKeyMap: const {'likesCount': 'likes_count'});

Map<String, dynamic> _$FacilityProfileModelToJson(
  FacilityProfileModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'title': instance.title,
  'year': instance.year,
  'bio': instance.bio,
  'likes_count': instance.likesCount,
  'logo': instance.logo,
  'cover': instance.cover,
  'tags': ?instance.tags,
};
