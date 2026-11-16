import 'package:coflow_users_v2/core/core.dart';
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

  String get percentageText => '${discountRatio.amountText}%';
}
