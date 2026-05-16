import 'package:json_annotation/json_annotation.dart';

import 'facility_promotion_coupon_model.dart';
import 'facility_promotion_model.dart';

part 'facility_promotion_details_model.g.dart';

/// Promotion details response model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityPromotionDetailsModel {
  const FacilityPromotionDetailsModel({
    required this.promotion,
    this.coupons = const <FacilityPromotionCouponModel>[],
  });

  final FacilityPromotionModel promotion;

  @JsonKey(defaultValue: <FacilityPromotionCouponModel>[], disallowNullValue: true)
  final List<FacilityPromotionCouponModel> coupons;

  factory FacilityPromotionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityPromotionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityPromotionDetailsModelToJson(this);
}
