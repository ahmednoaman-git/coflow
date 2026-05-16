import 'package:json_annotation/json_annotation.dart';

import 'facility_promotion_coupon_model.dart';
import 'facility_promotion_ticket_line_model.dart';

part 'facility_promotion_model.g.dart';

bool _promotionBoolFromJson(Object? value) => switch (value) {
  null => false,
  final bool boolValue => boolValue,
  final num numberValue => numberValue != 0,
  final String stringValue => switch (stringValue.trim().toLowerCase()) {
    '1' || 'true' || 'yes' => true,
    '0' || 'false' || 'no' || '' => false,
    _ => false,
  },
  _ => false,
};

Object _promotionBoolToJson(bool? value) => value ?? false;

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityPromotionModel {
  const FacilityPromotionModel({
    required this.id,
    required this.name,
    this.price,
    this.discountPrice,
    this.discountRatio,
    required this.type,
    this.startDate,
    this.unlimited,
    this.validityDays,
    this.paymentUnlimited,
    this.paymentLimit,
    this.paymentRemain,
    this.discountFor,
    required this.endDate,
    this.description,
    this.requirements,
    this.conditions,
    this.hasDiscount,
    this.gift,
    this.currency,
    this.buyGetType,
    this.hasLike,
    this.tickets,
    this.getTickets,
    this.coupons,
    this.offer,
    this.editable,
  });

  final int id;
  final String name;
  final double? price;

  @JsonKey(name: 'discount_price')
  final double? discountPrice;

  @JsonKey(name: 'discount_ratio')
  final double? discountRatio;

  final String type;

  @JsonKey(name: 'start_date')
  final DateTime? startDate;

  @JsonKey(
    fromJson: _promotionBoolFromJson,
    toJson: _promotionBoolToJson,
    defaultValue: false,
  )
  final bool? unlimited;

  @JsonKey(name: 'validity_days')
  final int? validityDays;

  @JsonKey(
    name: 'payment_unlimited',
    fromJson: _promotionBoolFromJson,
    toJson: _promotionBoolToJson,
    defaultValue: false,
  )
  final bool? paymentUnlimited;

  @JsonKey(name: 'payment_limit')
  final int? paymentLimit;

  @JsonKey(name: 'payment_remain')
  final int? paymentRemain;

  @JsonKey(name: 'discount_for')
  final String? discountFor;

  @JsonKey(name: 'end_date')
  final DateTime endDate;

  final String? description;
  final String? requirements;
  final String? conditions;

  @JsonKey(
    name: 'has_discount',
    fromJson: _promotionBoolFromJson,
    toJson: _promotionBoolToJson,
    defaultValue: false,
  )
  final bool? hasDiscount;

  final Object? gift;
  final String? currency;

  @JsonKey(name: 'buy_get_type')
  final String? buyGetType;

  @JsonKey(name: 'has_like')
  final bool? hasLike;

  @JsonKey(defaultValue: <FacilityPromotionTicketLineModel>[], disallowNullValue: true)
  final List<FacilityPromotionTicketLineModel>? tickets;

  @JsonKey(
    name: 'get_tickets',
    defaultValue: <FacilityPromotionTicketLineModel>[],
    disallowNullValue: true,
  )
  final List<FacilityPromotionTicketLineModel>? getTickets;

  @JsonKey(defaultValue: <FacilityPromotionCouponModel>[], disallowNullValue: true)
  final List<FacilityPromotionCouponModel>? coupons;

  final int? offer;
  final bool? editable;

  factory FacilityPromotionModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityPromotionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityPromotionModelToJson(this);
}
