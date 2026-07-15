// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponDetailsModel _$CouponDetailsModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  'CouponDetailsModel',
  json,
  ($checkedConvert) {
    $checkKeys(json, disallowNullValues: const ['tickets', 'promotions']);
    final val = CouponDetailsModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      discountRatio: $checkedConvert(
        'discount_ratio',
        (v) => (v as num).toDouble(),
      ),
      unlimited: $checkedConvert('unlimited', (v) => v as bool),
      validityDays: $checkedConvert(
        'validity_days',
        (v) => (v as num?)?.toInt(),
      ),
      appliesOn: $checkedConvert('applies_on', (v) => v as String),
      status: $checkedConvert('status', (v) => v as String),
      facilityId: $checkedConvert('facility_id', (v) => (v as num).toInt()),
      deletedAt: $checkedConvert(
        'deleted_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      purchasesCount: $checkedConvert(
        'purchases_count',
        (v) => (v as num?)?.toInt(),
      ),
      laravelThroughKey: $checkedConvert(
        'laravel_through_key',
        (v) => (v as num).toInt(),
      ),
      tickets: $checkedConvert('tickets', (v) => v as List<dynamic>? ?? []),
      promotions: $checkedConvert(
        'promotions',
        (v) => v as List<dynamic>? ?? [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'discountRatio': 'discount_ratio',
    'validityDays': 'validity_days',
    'appliesOn': 'applies_on',
    'facilityId': 'facility_id',
    'deletedAt': 'deleted_at',
    'purchasesCount': 'purchases_count',
    'laravelThroughKey': 'laravel_through_key',
  },
);

Map<String, dynamic> _$CouponDetailsModelToJson(CouponDetailsModel instance) => <String, dynamic>{
  'id': instance.id,
  'discount_ratio': instance.discountRatio,
  'unlimited': instance.unlimited,
  'validity_days': instance.validityDays,
  'applies_on': instance.appliesOn,
  'status': instance.status,
  'facility_id': instance.facilityId,
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'purchases_count': instance.purchasesCount,
  'laravel_through_key': instance.laravelThroughKey,
  'tickets': ?instance.tickets,
  'promotions': ?instance.promotions,
};
