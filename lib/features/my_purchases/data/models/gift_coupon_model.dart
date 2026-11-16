import 'package:json_annotation/json_annotation.dart';

part 'gift_coupon_model.g.dart';

/// The coupon a gifted coupon row grants (`coupon` on a gift row).
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class GiftCouponModel {
  const GiftCouponModel({
    this.discountRatio,
    this.unlimited,
    this.validityDays,
    this.appliesOn,
    this.tickets = const [],
    this.promotions = const [],
  });

  /// The discount, in percent.
  final num? discountRatio;
  final bool? unlimited;
  final int? validityDays;

  /// `tickets`, `promotions` or `purchases`; null on older coupons.
  final String? appliesOn;

  /// The tickets it is limited to, when [appliesOn] is `tickets`.
  @JsonKey(defaultValue: <NamedItemModel>[])
  final List<NamedItemModel> tickets;

  /// The promotions it is limited to, when [appliesOn] is `promotions`.
  @JsonKey(defaultValue: <NamedItemModel>[])
  final List<NamedItemModel> promotions;

  factory GiftCouponModel.fromJson(Map<String, dynamic> json) => _$GiftCouponModelFromJson(json);
}

/// Anything the API nests only to be named.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class NamedItemModel {
  const NamedItemModel({this.name});

  final String? name;

  factory NamedItemModel.fromJson(Map<String, dynamic> json) => _$NamedItemModelFromJson(json);
}
