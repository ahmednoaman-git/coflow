import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_promotion_applies_on.dart';

part 'facility_promotion_coupon_entity.freezed.dart';

@freezed
abstract class FacilityPromotionCouponEntity with _$FacilityPromotionCouponEntity {
  const FacilityPromotionCouponEntity._();

  const factory FacilityPromotionCouponEntity({
    required double discountRatio,
    required FacilityPromotionAppliesOn appliesOn,
  }) = _FacilityPromotionCouponEntity;

  String get percentageText => '${_formatPromotionNumber(discountRatio)}%';
}

String _formatPromotionNumber(double value) {
  if (value == value.roundToDouble()) {
    return value.toStringAsFixed(0);
  }

  return value.toStringAsFixed(2).replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
}
