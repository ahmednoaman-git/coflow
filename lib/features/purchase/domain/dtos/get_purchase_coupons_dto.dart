/// The kind of item a coupon lookup applies to.
enum PurchaseSubjectType { ticket, promotion }

/// Request DTO for getting coupons applicable to a ticket/promotion purchase.
class GetPurchaseCouponsDto {
  const GetPurchaseCouponsDto({
    required this.facilityId,
    required this.subjectType,
    required this.subjectId,
  });

  /// The facility selling the ticket or promotion. `GET coupons` ignores it —
  /// it lists the customer's coupons from every facility — so the use case
  /// filters by it.
  final int facilityId;
  final PurchaseSubjectType subjectType;
  final int subjectId;
}
