// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedProfilesPageModel _$SavedProfilesPageModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SavedProfilesPageModel',
  json,
  ($checkedConvert) {
    final val = SavedProfilesPageModel(
      currentPage: $checkedConvert(
        'current_page',
        (v) => (v as num?)?.toInt() ?? 1,
      ),
      lastPage: $checkedConvert('last_page', (v) => (v as num?)?.toInt() ?? 1),
      profiles: $checkedConvert(
        'data',
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
  },
  fieldKeyMap: const {
    'currentPage': 'current_page',
    'lastPage': 'last_page',
    'profiles': 'data',
  },
);

Map<String, dynamic> _$SavedProfilesPageModelToJson(
  SavedProfilesPageModel instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
  'data': instance.profiles,
};

SavedProfileModel _$SavedProfileModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SavedProfileModel', json, ($checkedConvert) {
      final val = SavedProfileModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        facilityId: $checkedConvert('facility_id', (v) => (v as num?)?.toInt()),
        type: $checkedConvert('type', (v) => v as String?),
        facility: $checkedConvert(
          'facility',
          (v) => v == null ? null : FacilityModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'facilityId': 'facility_id'});

Map<String, dynamic> _$SavedProfileModelToJson(SavedProfileModel instance) => <String, dynamic>{
  'id': instance.id,
  'facility_id': instance.facilityId,
  'type': instance.type,
  'facility': instance.facility,
};
