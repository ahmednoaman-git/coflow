import 'package:json_annotation/json_annotation.dart';

part 'coupon_facility_model.g.dart';

/// The nested `facility` object on a [CouponModel] response entry.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class CouponFacilityModel {
  const CouponFacilityModel({required this.id, required this.name});

  final int id;
  final String name;

  factory CouponFacilityModel.fromJson(Map<String, dynamic> json) =>
      _$CouponFacilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponFacilityModelToJson(this);
}
