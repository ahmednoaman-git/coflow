// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityTicketModel _$FacilityTicketModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FacilityTicketModel',
      json,
      ($checkedConvert) {
        final val = FacilityTicketModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
          discountPrice: $checkedConvert(
            'discount_price',
            (v) => (v as num?)?.toDouble(),
          ),
          currency: $checkedConvert('currency', (v) => v as String),
          facilityId: $checkedConvert('facility_id', (v) => (v as num).toInt()),
          servicesCount: $checkedConvert(
            'services_count',
            (v) => (v as num).toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'discountPrice': 'discount_price',
        'facilityId': 'facility_id',
        'servicesCount': 'services_count',
      },
    );

Map<String, dynamic> _$FacilityTicketModelToJson(
  FacilityTicketModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'discount_price': instance.discountPrice,
  'currency': instance.currency,
  'facility_id': instance.facilityId,
  'services_count': instance.servicesCount,
};
