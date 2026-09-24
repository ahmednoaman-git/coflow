import 'package:json_annotation/json_annotation.dart';

import 'coupon_target_model.dart';

part 'coupon_details_model.g.dart';

/// The nested `coupon` object on a [CouponModel] response entry — the coupon
/// definition itself, as opposed to the user's redeemable record of it.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class CouponDetailsModel {
  const CouponDetailsModel({
    required this.id,
    required this.discountRatio,
    required this.unlimited,
    this.validityDays,
    this.appliesOn,
    this.status,
    required this.facilityId,
    this.deletedAt,
    this.purchasesCount,
    this.laravelThroughKey,
    this.tickets = const [],
    this.promotions = const [],
  });

  final int id;

  @JsonKey(name: 'discount_ratio')
  final double discountRatio;

  final bool unlimited;

  @JsonKey(name: 'validity_days')
  final int? validityDays;

  /// `purchases`, `tickets` or `promotions`; null when the coupon only covers
  /// the [tickets] and [promotions] it lists.
  @JsonKey(name: 'applies_on')
  final String? appliesOn;

  final String? status;

  @JsonKey(name: 'facility_id')
  final int facilityId;

  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;

  @JsonKey(name: 'purchases_count')
  final int? purchasesCount;

  @JsonKey(name: 'laravel_through_key')
  final int? laravelThroughKey;

  /// The tickets the coupon is limited to.
  @JsonKey(defaultValue: <CouponTargetModel>[])
  final List<CouponTargetModel> tickets;

  /// The promotions the coupon is limited to.
  @JsonKey(defaultValue: <CouponTargetModel>[])
  final List<CouponTargetModel> promotions;

  factory CouponDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CouponDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponDetailsModelToJson(this);
}
