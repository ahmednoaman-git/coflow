// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_ticket_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityTicketDetailsModel _$FacilityTicketDetailsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilityTicketDetailsModel', json, ($checkedConvert) {
  final val = FacilityTicketDetailsModel(
    ticket: $checkedConvert(
      'ticket',
      (v) => TicketDetailModel.fromJson(v as Map<String, dynamic>),
    ),
    coupons: $checkedConvert(
      'coupons',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => CouponPlaceholderModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$FacilityTicketDetailsModelToJson(
  FacilityTicketDetailsModel instance,
) => <String, dynamic>{'ticket': instance.ticket, 'coupons': instance.coupons};

TicketDetailModel _$TicketDetailModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketDetailModel',
      json,
      ($checkedConvert) {
        $checkKeys(json, disallowNullValues: const ['services', 'addons']);
        final val = TicketDetailModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          unlimited: $checkedConvert('unlimited', (v) => v as bool),
          validityDays: $checkedConvert(
            'validity_days',
            (v) => (v as num?)?.toInt(),
          ),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
          discountPrice: $checkedConvert(
            'discount_price',
            (v) => (v as num?)?.toDouble(),
          ),
          currency: $checkedConvert('currency', (v) => v as String),
          conditions: $checkedConvert('conditions', (v) => v as String?),
          requirements: $checkedConvert('requirements', (v) => v as String?),
          services: $checkedConvert(
            'services',
            (v) =>
                (v as List<dynamic>?)
                    ?.map(
                      (e) => ServiceModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList() ??
                [],
          ),
          addons: $checkedConvert(
            'addons',
            (v) =>
                (v as List<dynamic>?)
                    ?.map((e) => AddonModel.fromJson(e as Map<String, dynamic>))
                    .toList() ??
                [],
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'validityDays': 'validity_days',
        'discountPrice': 'discount_price',
      },
    );

Map<String, dynamic> _$TicketDetailModelToJson(TicketDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unlimited': instance.unlimited,
      'validity_days': instance.validityDays,
      'price': instance.price,
      'discount_price': instance.discountPrice,
      'currency': instance.currency,
      'conditions': instance.conditions,
      'requirements': instance.requirements,
      'services': ?instance.services,
      'addons': ?instance.addons,
    };

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ServiceModel', json, ($checkedConvert) {
      final val = ServiceModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        image: $checkedConvert('image', (v) => v as String?),
        pivot: $checkedConvert(
          'pivot',
          (v) =>
              v == null ? null : PivotModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'pivot': instance.pivot,
    };

PivotModel _$PivotModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PivotModel',
  json,
  ($checkedConvert) {
    final val = PivotModel(
      ticketId: $checkedConvert('ticket_id', (v) => (v as num?)?.toInt()),
      serviceId: $checkedConvert('service_id', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'ticketId': 'ticket_id', 'serviceId': 'service_id'},
);

Map<String, dynamic> _$PivotModelToJson(PivotModel instance) =>
    <String, dynamic>{
      'ticket_id': instance.ticketId,
      'service_id': instance.serviceId,
    };

AddonModel _$AddonModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddonModel', json, ($checkedConvert) {
      final val = AddonModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        price: $checkedConvert('price', (v) => (v as num).toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$AddonModelToJson(AddonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };

CouponPlaceholderModel _$CouponPlaceholderModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CouponPlaceholderModel', json, ($checkedConvert) {
  final val = CouponPlaceholderModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$CouponPlaceholderModelToJson(
  CouponPlaceholderModel instance,
) => <String, dynamic>{'id': instance.id};
