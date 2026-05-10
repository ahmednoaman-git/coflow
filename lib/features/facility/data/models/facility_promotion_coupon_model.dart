import 'package:json_annotation/json_annotation.dart';

part 'facility_promotion_coupon_model.g.dart';

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
class FacilityPromotionCouponModel {
  const FacilityPromotionCouponModel({
    this.discountRatio,
    this.appliesOn,
    this.unlimited,
  });

  @JsonKey(name: 'discount_ratio')
  final double? discountRatio;

  @JsonKey(name: 'applies_on')
  final String? appliesOn;

  @JsonKey(
    fromJson: _promotionBoolFromJson,
    toJson: _promotionBoolToJson,
    defaultValue: false,
  )
  final bool? unlimited;

  factory FacilityPromotionCouponModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityPromotionCouponModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityPromotionCouponModelToJson(this);
}
