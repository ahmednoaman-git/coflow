// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilitySessionsResponseModel _$FacilitySessionsResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilitySessionsResponseModel', json, ($checkedConvert) {
  final val = FacilitySessionsResponseModel(
    sessions: $checkedConvert(
      'sessions',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => FacilitySessionModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    ),
  );
  return val;
});

Map<String, dynamic> _$FacilitySessionsResponseModelToJson(
  FacilitySessionsResponseModel instance,
) => <String, dynamic>{'sessions': instance.sessions};

FacilitySessionModel _$FacilitySessionModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilitySessionModel',
  json,
  ($checkedConvert) {
    final val = FacilitySessionModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      serviceId: $checkedConvert('service_id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => DateTime.parse(v as String),
      ),
      endsAt: $checkedConvert('ends_at', (v) => DateTime.parse(v as String)),
      color: $checkedConvert('color', (v) => v as String?),
      ladiesOnly: $checkedConvert('ladies_only', (v) => v as bool?),
      level: $checkedConvert(
        'level',
        (v) => v == null
            ? null
            : FacilityServiceLevelModel.fromJson(v as Map<String, dynamic>),
      ),
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
      capacity: $checkedConvert(
        'capacity',
        (v) => v == null
            ? null
            : FacilitySessionCapacityModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'serviceId': 'service_id',
    'startsAt': 'starts_at',
    'endsAt': 'ends_at',
    'ladiesOnly': 'ladies_only',
  },
);

Map<String, dynamic> _$FacilitySessionModelToJson(
  FacilitySessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'service_id': instance.serviceId,
  'name': instance.name,
  'starts_at': instance.startsAt.toIso8601String(),
  'ends_at': instance.endsAt.toIso8601String(),
  'color': instance.color,
  'ladies_only': instance.ladiesOnly,
  'level': instance.level,
  'instructors': instance.instructors,
  'capacity': instance.capacity,
};

FacilitySessionInstructorModel _$FacilitySessionInstructorModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilitySessionInstructorModel',
  json,
  ($checkedConvert) {
    final val = FacilitySessionInstructorModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      firstName: $checkedConvert('first_name', (v) => v as String),
      lastName: $checkedConvert('last_name', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'firstName': 'first_name', 'lastName': 'last_name'},
);

Map<String, dynamic> _$FacilitySessionInstructorModelToJson(
  FacilitySessionInstructorModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
};

FacilitySessionCapacityModel _$FacilitySessionCapacityModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilitySessionCapacityModel', json, ($checkedConvert) {
  final val = FacilitySessionCapacityModel(
    booked: $checkedConvert('booked', (v) => (v as num).toInt()),
    total: $checkedConvert('total', (v) => (v as num).toInt()),
    waitlist: $checkedConvert('waitlist', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$FacilitySessionCapacityModelToJson(
  FacilitySessionCapacityModel instance,
) => <String, dynamic>{
  'booked': instance.booked,
  'total': instance.total,
  'waitlist': instance.waitlist,
};
