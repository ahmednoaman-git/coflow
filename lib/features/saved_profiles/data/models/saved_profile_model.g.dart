// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedProfilesResponseModel _$SavedProfilesResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SavedProfilesResponseModel', json, ($checkedConvert) {
  final val = SavedProfilesResponseModel(
    profiles: $checkedConvert(
      'profiles',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => SavedProfileModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    ),
  );
  return val;
});

Map<String, dynamic> _$SavedProfilesResponseModelToJson(
  SavedProfilesResponseModel instance,
) => <String, dynamic>{'profiles': instance.profiles};

SavedProfileModel _$SavedProfileModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SavedProfileModel',
      json,
      ($checkedConvert) {
        final val = SavedProfileModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          activityLineId: $checkedConvert(
            'activity_line_id',
            (v) => (v as num).toInt(),
          ),
          status: $checkedConvert('status', (v) => v as String?),
          logo: $checkedConvert('logo', (v) => v as String?),
          likesCount: $checkedConvert(
            'likes_count',
            (v) => (v as num?)?.toInt(),
          ),
          branch: $checkedConvert(
            'branch',
            (v) => v == null
                ? null
                : SavedProfileBranchModel.fromJson(v as Map<String, dynamic>),
          ),
          isTracked: $checkedConvert('is_tracked', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {
        'activityLineId': 'activity_line_id',
        'likesCount': 'likes_count',
        'isTracked': 'is_tracked',
      },
    );

Map<String, dynamic> _$SavedProfileModelToJson(SavedProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'activity_line_id': instance.activityLineId,
      'status': instance.status,
      'logo': instance.logo,
      'likes_count': instance.likesCount,
      'branch': instance.branch,
      'is_tracked': instance.isTracked,
    };

SavedProfileBranchModel _$SavedProfileBranchModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SavedProfileBranchModel', json, ($checkedConvert) {
  final val = SavedProfileBranchModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    area: $checkedConvert('area', (v) => v as String?),
    city: $checkedConvert('city', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$SavedProfileBranchModelToJson(
  SavedProfileBranchModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'area': instance.area,
  'city': instance.city,
};
