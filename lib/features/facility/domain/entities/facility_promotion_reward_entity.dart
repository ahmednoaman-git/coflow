import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_promotion_coupon_entity.dart';
import 'facility_promotion_ticket_line_entity.dart';

part 'facility_promotion_reward_entity.freezed.dart';

@freezed
sealed class FacilityPromotionRewardEntity with _$FacilityPromotionRewardEntity {
  FacilityPromotionRewardEntity._();

  factory FacilityPromotionRewardEntity.gift({required String giftName}) =
      FacilityPromotionGiftRewardEntity;

  factory FacilityPromotionRewardEntity.tickets({
    @Default(<FacilityPromotionTicketLineEntity>[]) List<FacilityPromotionTicketLineEntity> tickets,
  }) = FacilityPromotionTicketRewardEntity;

  factory FacilityPromotionRewardEntity.coupons({
    @Default(<FacilityPromotionCouponEntity>[]) List<FacilityPromotionCouponEntity> coupons,
  }) = FacilityPromotionCouponRewardEntity;
}

@freezed
class FacilityPromotionGiftRewardEntity extends FacilityPromotionRewardEntity
    with _$FacilityPromotionGiftRewardEntity {
  FacilityPromotionGiftRewardEntity({required this.giftName}) : super._();

  @override
  final String giftName;
}

@freezed
class FacilityPromotionTicketRewardEntity extends FacilityPromotionRewardEntity
    with _$FacilityPromotionTicketRewardEntity {
  FacilityPromotionTicketRewardEntity({
    this.tickets = const <FacilityPromotionTicketLineEntity>[],
  }) : super._();

  @override
  final List<FacilityPromotionTicketLineEntity> tickets;
}

@freezed
class FacilityPromotionCouponRewardEntity extends FacilityPromotionRewardEntity
    with _$FacilityPromotionCouponRewardEntity {
  FacilityPromotionCouponRewardEntity({
    this.coupons = const <FacilityPromotionCouponEntity>[],
  }) : super._();

  @override
  final List<FacilityPromotionCouponEntity> coupons;
}
