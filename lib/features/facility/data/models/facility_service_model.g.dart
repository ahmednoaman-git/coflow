// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityServicesResponseModel _$FacilityServicesResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilityServicesResponseModel', json, ($checkedConvert) {
  final val = FacilityServicesResponseModel(
    folders: $checkedConvert(
      'folders',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => FacilityServiceFolderModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    ),
    services: $checkedConvert(
      'services',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => CollapsedFacilityServiceModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    ),
  );
  return val;
});

Map<String, dynamic> _$FacilityServicesResponseModelToJson(
  FacilityServicesResponseModel instance,
) => <String, dynamic>{
  'folders': instance.folders,
  'services': instance.services,
};

FacilityServiceFolderModel _$FacilityServiceFolderModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilityServiceFolderModel', json, ($checkedConvert) {
  final val = FacilityServiceFolderModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    services: $checkedConvert(
      'services',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => CollapsedFacilityServiceModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    ),
  );
  return val;
});

Map<String, dynamic> _$FacilityServiceFolderModelToJson(
  FacilityServiceFolderModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'services': instance.services,
};

CollapsedFacilityServiceModel _$CollapsedFacilityServiceModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CollapsedFacilityServiceModel',
  json,
  ($checkedConvert) {
    final val = CollapsedFacilityServiceModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      duration: $checkedConvert('duration', (v) => v as String?),
      durationListId: $checkedConvert(
        'duration_list_id',
        (v) => (v as num?)?.toInt(),
      ),
      image: $checkedConvert('image', (v) => v as String?),
      reservations: $checkedConvert(
        'reservations',
        (v) => (v as num?)?.toInt(),
      ),
      durationList: $checkedConvert(
        'duration_list',
        (v) => v == null
            ? null
            : FacilityServiceDurationListModel.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      level: $checkedConvert(
        'level',
        (v) => v == null
            ? null
            : FacilityServiceLevelModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'durationListId': 'duration_list_id',
    'durationList': 'duration_list',
  },
);

Map<String, dynamic> _$CollapsedFacilityServiceModelToJson(
  CollapsedFacilityServiceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'duration': instance.duration,
  'duration_list_id': instance.durationListId,
  'image': instance.image,
  'reservations': instance.reservations,
  'duration_list': instance.durationList,
  'level': instance.level,
};

FacilityServiceDurationListModel _$FacilityServiceDurationListModelFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('FacilityServiceDurationListModel', json, ($checkedConvert) {
      final val = FacilityServiceDurationListModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$FacilityServiceDurationListModelToJson(
  FacilityServiceDurationListModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

FacilityServiceLevelModel _$FacilityServiceLevelModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilityServiceLevelModel', json, ($checkedConvert) {
  final val = FacilityServiceLevelModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    color: $checkedConvert('color', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$FacilityServiceLevelModelToJson(
  FacilityServiceLevelModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'color': instance.color,
};
