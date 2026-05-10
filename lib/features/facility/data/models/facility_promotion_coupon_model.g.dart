// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_promotion_coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityPromotionCouponModel _$FacilityPromotionCouponModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilityPromotionCouponModel',
  json,
  ($checkedConvert) {
    final val = FacilityPromotionCouponModel(
      discountRatio: $checkedConvert(
        'discount_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      appliesOn: $checkedConvert('applies_on', (v) => v as String?),
      unlimited: $checkedConvert(
        'unlimited',
        (v) => v == null ? false : _promotionBoolFromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'discountRatio': 'discount_ratio',
    'appliesOn': 'applies_on',
  },
);

Map<String, dynamic> _$FacilityPromotionCouponModelToJson(
  FacilityPromotionCouponModel instance,
) => <String, dynamic>{
  'discount_ratio': instance.discountRatio,
  'applies_on': instance.appliesOn,
  'unlimited': _promotionBoolToJson(instance.unlimited),
};
