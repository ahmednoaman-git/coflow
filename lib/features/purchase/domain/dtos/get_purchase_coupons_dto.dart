import 'package:json_annotation/json_annotation.dart';

part 'get_purchase_coupons_dto.g.dart';

/// The kind of item a coupon lookup applies to.
enum PurchaseSubjectType {
  @JsonValue('ticket')
  ticket,
  @JsonValue('promotion')
  promotion,
}

/// Request DTO for getting coupons applicable to a ticket/promotion purchase.
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetPurchaseCouponsDto {
  const GetPurchaseCouponsDto({required this.subjectType, required this.subjectId});

  final PurchaseSubjectType subjectType;
  final int subjectId;

  factory GetPurchaseCouponsDto.fromJson(Map<String, dynamic> json) =>
      _$GetPurchaseCouponsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetPurchaseCouponsDtoToJson(this);
}
