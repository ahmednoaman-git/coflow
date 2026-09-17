// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilitySchedulePageModel _$FacilitySchedulePageModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilitySchedulePageModel',
  json,
  ($checkedConvert) {
    final val = FacilitySchedulePageModel(
      currentPage: $checkedConvert(
        'current_page',
        (v) => (v as num?)?.toInt() ?? 1,
      ),
      lastPage: $checkedConvert('last_page', (v) => (v as num?)?.toInt() ?? 1),
      slots: $checkedConvert(
        'data',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilityScheduleSlotModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
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
    'slots': 'data',
  },
);

Map<String, dynamic> _$FacilitySchedulePageModelToJson(
  FacilitySchedulePageModel instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
  'data': instance.slots,
};

FacilityScheduleSlotModel _$FacilityScheduleSlotModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilityScheduleSlotModel',
  json,
  ($checkedConvert) {
    final val = FacilityScheduleSlotModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      day: $checkedConvert('day', (v) => v as String),
      from: $checkedConvert('from', (v) => v as String),
      to: $checkedConvert('to', (v) => v as String),
      dayInt: $checkedConvert('day_int', (v) => (v as num?)?.toInt()),
      ladiesOnly: $checkedConvert('ladies_only', (v) => v as bool?),
      status: $checkedConvert('status', (v) => v as String?),
      serviceId: $checkedConvert('service_id', (v) => (v as num?)?.toInt()),
      instructors: $checkedConvert(
        'instructors',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilitySessionInstructorModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      service: $checkedConvert(
        'service',
        (v) => v == null
            ? null
            : FacilityScheduleServiceModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'dayInt': 'day_int',
    'ladiesOnly': 'ladies_only',
    'serviceId': 'service_id',
  },
);

Map<String, dynamic> _$FacilityScheduleSlotModelToJson(
  FacilityScheduleSlotModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'day': instance.day,
  'day_int': instance.dayInt,
  'from': instance.from,
  'to': instance.to,
  'instructors': instance.instructors,
  'ladies_only': instance.ladiesOnly,
  'status': instance.status,
  'service_id': instance.serviceId,
  'service': instance.service,
};

FacilityScheduleServiceModel _$FacilityScheduleServiceModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilityScheduleServiceModel', json, ($checkedConvert) {
  final val = FacilityScheduleServiceModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    type: $checkedConvert('type', (v) => v as String?),
    image: $checkedConvert('image', (v) => v as String?),
    level: $checkedConvert(
      'level',
      (v) => v == null
          ? null
          : FacilityServiceLevelModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$FacilityScheduleServiceModelToJson(
  FacilityScheduleServiceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'image': instance.image,
  'level': instance.level,
};
