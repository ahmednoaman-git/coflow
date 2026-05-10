import 'package:json_annotation/json_annotation.dart';

import 'facility_promotion_coupon_model.dart';
import 'facility_promotion_ticket_line_model.dart';

part 'facility_promotion_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityPromotionModel {
  const FacilityPromotionModel({
    required this.id,
    required this.name,
    this.price,
    this.discountPrice,
    this.discountRatio,
    required this.type,
    required this.endDate,
    this.gift,
    this.currency,
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

  @JsonKey(name: 'end_date')
  final DateTime endDate;

  final Object? gift;
  final String? currency;

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

  final Map<String, dynamic>? offer;
  final bool? editable;

  factory FacilityPromotionModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityPromotionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityPromotionModelToJson(this);
}
