// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftCouponModel _$GiftCouponModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GiftCouponModel',
  json,
  ($checkedConvert) {
    final val = GiftCouponModel(
      discountRatio: $checkedConvert('discount_ratio', (v) => v as num?),
      unlimited: $checkedConvert('unlimited', (v) => v as bool?),
      validityDays: $checkedConvert(
        'validity_days',
        (v) => (v as num?)?.toInt(),
      ),
      appliesOn: $checkedConvert('applies_on', (v) => v as String?),
      tickets: $checkedConvert(
        'tickets',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => NamedItemModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      ),
      promotions: $checkedConvert(
        'promotions',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => NamedItemModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'discountRatio': 'discount_ratio',
    'validityDays': 'validity_days',
    'appliesOn': 'applies_on',
  },
);

NamedItemModel _$NamedItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('NamedItemModel', json, ($checkedConvert) {
      final val = NamedItemModel(
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    });
