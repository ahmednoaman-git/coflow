import 'package:json_annotation/json_annotation.dart';

import 'coupon_details_model.dart';
import 'coupon_facility_model.dart';

part 'coupon_model.g.dart';

/// Data model for a purchase coupon entry, as returned by `GET coupons`.
///
/// This mirrors the full backend payload (a redeemable-item record with an
/// embedded coupon definition), not just the fields the app currently
/// displays, so future features can draw on it without another round trip
/// through the API contract.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class CouponModel {
  const CouponModel({
    required this.id,
    required this.name,
    required this.type,
    this.promoGift,
    this.price,
    this.discountOffer,
    this.discountCoupon,
    this.quantity,
    this.used,
    this.totalPrice,
    this.addonsPrice,
    this.finalPrice,
    this.paid,
    this.remain,
    this.refund,
    this.gift,
    this.expireDate,
    this.status,
    this.action,
    this.userId,
    this.adminId,
    this.createdById,
    this.facilityId,
    this.promotionId,
    this.paymentMethodId,
    this.createdAt,
    this.relatedPurchaseId,
    required this.coupon,
    this.facility,
  });

  final int id;
  final String name;
  final String type;

  @JsonKey(name: 'promo_gift')
  final Object? promoGift;

  final double? price;

  @JsonKey(name: 'discount_offer')
  final Object? discountOffer;

  @JsonKey(name: 'discount_coupon')
  final Object? discountCoupon;

  final int? quantity;
  final int? used;

  @JsonKey(name: 'total_price')
  final double? totalPrice;

  @JsonKey(name: 'addons_price')
  final double? addonsPrice;

  @JsonKey(name: 'final_price')
  final double? finalPrice;

  final double? paid;
  final double? remain;
  final double? refund;
  final bool? gift;

  @JsonKey(name: 'expire_date')
  final DateTime? expireDate;

  final String? status;
  final String? action;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'admin_id')
  final int? adminId;

  @JsonKey(name: 'created_by_id')
  final int? createdById;

  @JsonKey(name: 'facility_id')
  final int? facilityId;

  @JsonKey(name: 'promotion_id')
  final int? promotionId;

  @JsonKey(name: 'payment_method_id')
  final int? paymentMethodId;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'related_purchase_id')
  final int? relatedPurchaseId;

  /// The coupon definition itself (discount ratio, scope, validity).
  final CouponDetailsModel coupon;

  final CouponFacilityModel? facility;

  factory CouponModel.fromJson(Map<String, dynamic> json) => _$CouponModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponModelToJson(this);
}
