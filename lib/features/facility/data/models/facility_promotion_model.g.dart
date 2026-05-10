// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_promotion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityPromotionModel _$FacilityPromotionModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilityPromotionModel',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      disallowNullValues: const ['tickets', 'get_tickets', 'coupons'],
    );
    final val = FacilityPromotionModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      price: $checkedConvert('price', (v) => (v as num?)?.toDouble()),
      discountPrice: $checkedConvert(
        'discount_price',
        (v) => (v as num?)?.toDouble(),
      ),
      discountRatio: $checkedConvert(
        'discount_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      type: $checkedConvert('type', (v) => v as String),
      endDate: $checkedConvert('end_date', (v) => DateTime.parse(v as String)),
      gift: $checkedConvert('gift', (v) => v),
      currency: $checkedConvert('currency', (v) => v as String?),
      hasLike: $checkedConvert('has_like', (v) => v as bool?),
      tickets: $checkedConvert(
        'tickets',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilityPromotionTicketLineModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      getTickets: $checkedConvert(
        'get_tickets',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilityPromotionTicketLineModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      coupons: $checkedConvert(
        'coupons',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilityPromotionCouponModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      offer: $checkedConvert('offer', (v) => v as Map<String, dynamic>?),
      editable: $checkedConvert('editable', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'discountPrice': 'discount_price',
    'discountRatio': 'discount_ratio',
    'endDate': 'end_date',
    'hasLike': 'has_like',
    'getTickets': 'get_tickets',
  },
);

Map<String, dynamic> _$FacilityPromotionModelToJson(
  FacilityPromotionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'discount_price': instance.discountPrice,
  'discount_ratio': instance.discountRatio,
  'type': instance.type,
  'end_date': instance.endDate.toIso8601String(),
  'gift': instance.gift,
  'currency': instance.currency,
  'has_like': instance.hasLike,
  'tickets': ?instance.tickets,
  'get_tickets': ?instance.getTickets,
  'coupons': ?instance.coupons,
  'offer': instance.offer,
  'editable': instance.editable,
};
