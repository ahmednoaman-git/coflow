import 'package:json_annotation/json_annotation.dart';

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
    required this.appliesOn,
    required this.status,
    required this.facilityId,
    this.deletedAt,
    this.purchasesCount,
    required this.laravelThroughKey,
    this.tickets,
    this.promotions,
  });

  final int id;

  @JsonKey(name: 'discount_ratio')
  final double discountRatio;

  final bool unlimited;

  @JsonKey(name: 'validity_days')
  final int? validityDays;

  @JsonKey(name: 'applies_on')
  final String appliesOn;

  final String status;

  @JsonKey(name: 'facility_id')
  final int facilityId;

  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;

  @JsonKey(name: 'purchases_count')
  final int? purchasesCount;

  @JsonKey(name: 'laravel_through_key')
  final int laravelThroughKey;

  @JsonKey(defaultValue: <dynamic>[], disallowNullValue: true)
  final List<dynamic>? tickets;

  @JsonKey(defaultValue: <dynamic>[], disallowNullValue: true)
  final List<dynamic>? promotions;

  factory CouponDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CouponDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponDetailsModelToJson(this);
}
