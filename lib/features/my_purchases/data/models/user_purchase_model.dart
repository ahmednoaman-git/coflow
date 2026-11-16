import 'package:coflow_users_v2/features/activity_line/data/models/facility_model.dart';
import 'package:coflow_users_v2/features/facility/data/models/facility_promotion_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'gift_coupon_model.dart';
import 'purchase_payment_model.dart';
import 'purchased_add_on_model.dart';
import 'purchased_ticket_model.dart';

part 'user_purchase_model.g.dart';

/// One purchase (or gift) the user owns, as the account endpoints return it:
/// `purchases`, `purchases-history`, `gifts`, `gifts-history` and
/// `purchases/{id}` all share this row.
///
/// Every field but the id is optional, and the nested facility and promotion
/// are read leniently (see [_facilityFromJson]): the rows carry a lot of
/// half-filled test data, and one odd row must not take the whole list down.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class UserPurchaseModel {
  const UserPurchaseModel({
    required this.id,
    this.name,
    this.type,
    this.price,
    this.discountOffer,
    this.discountCoupon,
    this.quantity,
    this.totalPrice,
    this.addonsPrice,
    this.finalPrice,
    this.refund,
    this.gift,
    this.expireDate,
    this.status,
    this.action,
    this.createdAt,
    this.currency,
    this.facilityId,
    this.facility,
    this.tickets = const [],
    this.addons = const [],
    this.promotion,
    this.payments = const [],
    this.coupon,
    this.relatedPurchase,
    this.couponPurchase,
  });

  final int id;
  final String? name;

  /// `ticket`, `package`, `buy_get` or `coupon`.
  final String? type;

  /// What the items cost after the promotion's own offer, add-ons excluded.
  final num? price;
  final num? discountOffer;
  final num? discountCoupon;
  final int? quantity;

  /// [price] plus [addonsPrice].
  final num? totalPrice;
  final num? addonsPrice;

  /// [totalPrice] less [discountCoupon]: what the user owes.
  final num? finalPrice;
  final num? refund;
  final bool? gift;
  final DateTime? expireDate;
  final String? status;
  final String? action;
  final DateTime? createdAt;
  final String? currency;
  final int? facilityId;

  @JsonKey(fromJson: _facilityFromJson)
  final FacilityModel? facility;

  @JsonKey(defaultValue: <PurchasedTicketModel>[])
  final List<PurchasedTicketModel> tickets;

  @JsonKey(defaultValue: <PurchasedAddOnModel>[])
  final List<PurchasedAddOnModel> addons;

  @JsonKey(fromJson: _promotionFromJson)
  final FacilityPromotionModel? promotion;

  @JsonKey(defaultValue: <PurchasePaymentModel>[])
  final List<PurchasePaymentModel> payments;

  /// The coupon a gifted coupon row grants.
  final GiftCouponModel? coupon;

  /// The purchase a gift came from (a Buy & Get reward): "From Promotion".
  final UserPurchaseModel? relatedPurchase;

  /// The purchase a used coupon was applied to: "Applied" date and invoice.
  final UserPurchaseModel? couponPurchase;

  factory UserPurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$UserPurchaseModelFromJson(json);
}

/// The facility rides along on every row as its full record; it only feeds the
/// group's logo and the button that opens the profile, so a record that
/// doesn't parse is dropped rather than failing the row.
FacilityModel? _facilityFromJson(Object? json) {
  if (json is! Map<String, dynamic>) return null;
  try {
    return FacilityModel.fromJson(json);
  } catch (_) {
    return null;
  }
}

/// The promotion only feeds "Promotion Information"; one that doesn't parse
/// hides that section instead of failing the row.
FacilityPromotionModel? _promotionFromJson(Object? json) {
  if (json is! Map<String, dynamic>) return null;
  try {
    return FacilityPromotionModel.fromJson(json);
  } catch (_) {
    return null;
  }
}
