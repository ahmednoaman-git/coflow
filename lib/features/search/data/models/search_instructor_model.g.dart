// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_instructor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchInstructorModel _$SearchInstructorModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SearchInstructorModel',
  json,
  ($checkedConvert) {
    final val = SearchInstructorModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      fullName: $checkedConvert('full_name', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String?),
      image: $checkedConvert('image', (v) => v as String?),
      centerName: $checkedConvert('center_name', (v) => v as String?),
      experienceYears: $checkedConvert('experience_years', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'fullName': 'full_name',
    'centerName': 'center_name',
    'experienceYears': 'experience_years',
  },
);

Map<String, dynamic> _$SearchInstructorModelToJson(
  SearchInstructorModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'title': instance.title,
  'image': instance.image,
  'center_name': instance.centerName,
  'experience_years': instance.experienceYears,
};
