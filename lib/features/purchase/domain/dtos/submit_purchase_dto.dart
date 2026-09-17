import 'get_purchase_coupons_dto.dart';

/// The same immutable selection is used for a quote and its purchase.
class SubmitPurchaseDto {
  SubmitPurchaseDto({
    required this.subjectType,
    required this.subjectId,
    required this.quantity,
    List<int> addOnIds = const [],
    this.couponId,
  }) : addOnIds = List.unmodifiable(addOnIds);

  final PurchaseSubjectType subjectType;
  final int subjectId;
  final int quantity;
  final List<int> addOnIds;
  final int? couponId;

  Map<String, dynamic> toJson() => {
    if (subjectType == PurchaseSubjectType.ticket) 'ticket_id': subjectId,
    if (subjectType == PurchaseSubjectType.promotion) 'promotion_id': subjectId,
    'quantity': quantity,
    if (subjectType == PurchaseSubjectType.ticket) 'addons': addOnIds,
    if (couponId != null) 'coupon_id': couponId,
  };
}
