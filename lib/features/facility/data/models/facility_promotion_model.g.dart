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
      startDate: $checkedConvert(
        'start_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      unlimited: $checkedConvert(
        'unlimited',
        (v) => v == null ? false : _promotionBoolFromJson(v),
      ),
      validityDays: $checkedConvert(
        'validity_days',
        (v) => (v as num?)?.toInt(),
      ),
      paymentUnlimited: $checkedConvert(
        'payment_unlimited',
        (v) => v == null ? false : _promotionBoolFromJson(v),
      ),
      paymentLimit: $checkedConvert(
        'payment_limit',
        (v) => (v as num?)?.toInt(),
      ),
      paymentRemain: $checkedConvert(
        'payment_remain',
        (v) => (v as num?)?.toInt(),
      ),
      discountFor: $checkedConvert('discount_for', (v) => v as String?),
      endDate: $checkedConvert('end_date', (v) => DateTime.parse(v as String)),
      description: $checkedConvert('description', (v) => v as String?),
      requirements: $checkedConvert('requirements', (v) => v as String?),
      conditions: $checkedConvert('conditions', (v) => v as String?),
      hasDiscount: $checkedConvert(
        'has_discount',
        (v) => v == null ? false : _promotionBoolFromJson(v),
      ),
      gift: $checkedConvert('gift', (v) => v),
      currency: $checkedConvert('currency', (v) => v as String?),
      buyGetType: $checkedConvert('buy_get_type', (v) => v as String?),
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
      offer: $checkedConvert('offer', (v) => (v as num?)?.toInt()),
      editable: $checkedConvert('editable', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'discountPrice': 'discount_price',
    'discountRatio': 'discount_ratio',
    'startDate': 'start_date',
    'validityDays': 'validity_days',
    'paymentUnlimited': 'payment_unlimited',
    'paymentLimit': 'payment_limit',
    'paymentRemain': 'payment_remain',
    'discountFor': 'discount_for',
    'endDate': 'end_date',
    'hasDiscount': 'has_discount',
    'buyGetType': 'buy_get_type',
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
  'start_date': instance.startDate?.toIso8601String(),
  'unlimited': _promotionBoolToJson(instance.unlimited),
  'validity_days': instance.validityDays,
  'payment_unlimited': _promotionBoolToJson(instance.paymentUnlimited),
  'payment_limit': instance.paymentLimit,
  'payment_remain': instance.paymentRemain,
  'discount_for': instance.discountFor,
  'end_date': instance.endDate.toIso8601String(),
  'description': instance.description,
  'requirements': instance.requirements,
  'conditions': instance.conditions,
  'has_discount': _promotionBoolToJson(instance.hasDiscount),
  'gift': instance.gift,
  'currency': instance.currency,
  'buy_get_type': instance.buyGetType,
  'has_like': instance.hasLike,
  'tickets': ?instance.tickets,
  'get_tickets': ?instance.getTickets,
  'coupons': ?instance.coupons,
  'offer': instance.offer,
  'editable': instance.editable,
};
