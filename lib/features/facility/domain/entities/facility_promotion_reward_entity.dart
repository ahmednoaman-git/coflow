import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_promotion_coupon_entity.dart';
import 'facility_promotion_ticket_line_entity.dart';

part 'facility_promotion_reward_entity.freezed.dart';

@freezed
sealed class FacilityPromotionRewardEntity with _$FacilityPromotionRewardEntity {
  const FacilityPromotionRewardEntity._();

  const factory FacilityPromotionRewardEntity.gift({required String giftName}) =
      FacilityPromotionGiftRewardEntity;

  const factory FacilityPromotionRewardEntity.tickets({
    @Default(<FacilityPromotionTicketLineEntity>[]) List<FacilityPromotionTicketLineEntity> tickets,
  }) = FacilityPromotionTicketRewardEntity;

  const factory FacilityPromotionRewardEntity.coupons({
    @Default(<FacilityPromotionCouponEntity>[]) List<FacilityPromotionCouponEntity> coupons,
  }) = FacilityPromotionCouponRewardEntity;
}
