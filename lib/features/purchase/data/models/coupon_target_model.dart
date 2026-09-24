import 'package:json_annotation/json_annotation.dart';

part 'coupon_target_model.g.dart';

/// A ticket or promotion listed on a coupon definition. The API embeds the
/// whole record; only what the checkout needs is kept.
@JsonSerializable(checked: true)
class CouponTargetModel {
  const CouponTargetModel({required this.id, this.name});

  final int id;
  final String? name;

  factory CouponTargetModel.fromJson(Map<String, dynamic> json) =>
      _$CouponTargetModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponTargetModelToJson(this);
}
