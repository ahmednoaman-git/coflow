import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../dtos/dtos.dart';

part 'purchase_coupon_entity.freezed.dart';

/// One of the facility's tickets or promotions that a coupon is limited to.
typedef PurchaseCouponTarget = ({int id, String name});

/// A coupon the customer holds, good for some of one facility's purchases.
@freezed
abstract class PurchaseCouponEntity with _$PurchaseCouponEntity {
  const PurchaseCouponEntity._();

  const factory PurchaseCouponEntity({
    /// The coupon's own id — what quotes and purchases take as `coupon_id`.
    /// The customer can hold the same coupon more than once; the copies share
    /// this id.
    required int id,
    required int facilityId,
    required double discountRatio,

    /// Whether it discounts every ticket of the facility.
    @Default(false) bool coversAllTickets,

    /// Whether it discounts every promotion of the facility.
    @Default(false) bool coversAllPromotions,

    /// The tickets it is limited to, when it does not cover them all.
    @Default(<PurchaseCouponTarget>[]) List<PurchaseCouponTarget> tickets,

    /// The promotions it is limited to, when it does not cover them all.
    @Default(<PurchaseCouponTarget>[]) List<PurchaseCouponTarget> promotions,
  }) = _PurchaseCouponEntity;

  String get percentText => '${discountRatio.amountText}%';

  /// Whether it can discount [subjectId], one of [facilityId]'s tickets or
  /// promotions.
  bool appliesTo({
    required int facilityId,
    required PurchaseSubjectType subjectType,
    required int subjectId,
  }) {
    if (facilityId != this.facilityId) return false;

    return switch (subjectType) {
      PurchaseSubjectType.ticket =>
        coversAllTickets || tickets.any((ticket) => ticket.id == subjectId),
      PurchaseSubjectType.promotion =>
        coversAllPromotions || promotions.any((promotion) => promotion.id == subjectId),
    };
  }
}
