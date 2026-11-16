// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationDetailsModel _$ReservationDetailsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ReservationDetailsModel',
  json,
  ($checkedConvert) {
    final val = ReservationDetailsModel(
      facilityId: $checkedConvert('facility_id', (v) => (v as num).toInt()),
      facilityName: $checkedConvert('facility_name', (v) => v as String),
      slot: $checkedConvert(
        'slot',
        (v) => FacilitySessionDetailsModel.fromJson(v as Map<String, dynamic>),
      ),
      facilityLogo: $checkedConvert('facility_logo', (v) => v as String?),
      facility: $checkedConvert(
        'facility',
        (v) => v == null
            ? null
            : FacilityModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'facilityId': 'facility_id',
    'facilityName': 'facility_name',
    'facilityLogo': 'facility_logo',
  },
);

Map<String, dynamic> _$ReservationDetailsModelToJson(
  ReservationDetailsModel instance,
) => <String, dynamic>{
  'facility_id': instance.facilityId,
  'facility_name': instance.facilityName,
  'facility_logo': instance.facilityLogo,
  'slot': instance.slot,
  'facility': instance.facility,
};
