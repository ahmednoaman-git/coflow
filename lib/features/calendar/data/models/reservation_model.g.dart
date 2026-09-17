// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationsResponseModel _$ReservationsResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReservationsResponseModel', json, ($checkedConvert) {
  final val = ReservationsResponseModel(
    reservations: $checkedConvert(
      'reservations',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => ReservationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    ),
  );
  return val;
});

Map<String, dynamic> _$ReservationsResponseModelToJson(
  ReservationsResponseModel instance,
) => <String, dynamic>{'reservations': instance.reservations};

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ReservationModel',
      json,
      ($checkedConvert) {
        final val = ReservationModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          facilityId: $checkedConvert('facility_id', (v) => (v as num).toInt()),
          facilityName: $checkedConvert('facility_name', (v) => v as String),
          serviceName: $checkedConvert('service_name', (v) => v as String),
          startsAt: $checkedConvert(
            'starts_at',
            (v) => DateTime.parse(v as String),
          ),
          endsAt: $checkedConvert(
            'ends_at',
            (v) => DateTime.parse(v as String),
          ),
          facilityLogo: $checkedConvert('facility_logo', (v) => v as String?),
          color: $checkedConvert('color', (v) => v as String?),
          level: $checkedConvert(
            'level',
            (v) => v == null
                ? null
                : ReservationLevelModel.fromJson(v as Map<String, dynamic>),
          ),
          instructors: $checkedConvert(
            'instructors',
            (v) =>
                (v as List<dynamic>?)
                    ?.map(
                      (e) => ReservationInstructorModel.fromJson(
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
        'facilityId': 'facility_id',
        'facilityName': 'facility_name',
        'serviceName': 'service_name',
        'startsAt': 'starts_at',
        'endsAt': 'ends_at',
        'facilityLogo': 'facility_logo',
      },
    );

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'facility_id': instance.facilityId,
      'facility_name': instance.facilityName,
      'facility_logo': instance.facilityLogo,
      'service_name': instance.serviceName,
      'starts_at': instance.startsAt.toIso8601String(),
      'ends_at': instance.endsAt.toIso8601String(),
      'color': instance.color,
      'level': instance.level,
      'instructors': instance.instructors,
    };

ReservationLevelModel _$ReservationLevelModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReservationLevelModel', json, ($checkedConvert) {
  final val = ReservationLevelModel(
    name: $checkedConvert('name', (v) => v as String),
    color: $checkedConvert('color', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ReservationLevelModelToJson(
  ReservationLevelModel instance,
) => <String, dynamic>{'name': instance.name, 'color': instance.color};

ReservationInstructorModel _$ReservationInstructorModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ReservationInstructorModel',
  json,
  ($checkedConvert) {
    final val = ReservationInstructorModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      firstName: $checkedConvert('first_name', (v) => v as String),
      lastName: $checkedConvert('last_name', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'firstName': 'first_name', 'lastName': 'last_name'},
);

Map<String, dynamic> _$ReservationInstructorModelToJson(
  ReservationInstructorModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
};
