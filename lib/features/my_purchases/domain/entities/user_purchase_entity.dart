import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'gift_coupon_entity.dart';
import 'purchase_status.dart';
import 'purchased_ticket_entity.dart';

part 'user_purchase_entity.freezed.dart';

/// An add-on bought with a purchase.
@freezed
abstract class PurchasedAddOnEntity with _$PurchasedAddOnEntity {
  const factory PurchasedAddOnEntity({
    required String name,
    @Default(1) int quantity,

    /// What it came to across [quantity].
    @Default(0) double price,
  }) = _PurchasedAddOnEntity;
}

/// A purchase or gift the user owns — a row of Account › Purchases or Gifts.
///
/// Rows are flat, each carrying its facility, so the screens can group them
/// however the API ends up paging them (see `PurchaseGrouping`).
@freezed
abstract class UserPurchaseEntity with _$UserPurchaseEntity {
  const factory UserPurchaseEntity({
    required int id,
    required String name,
    required PurchaseKind kind,
    required PurchaseStatus status,
    @Default(false) bool isGift,

    required int facilityId,
    required String facilityName,

    /// The facility's profile, for its logo and to open it; null when the row
    /// didn't carry a usable record.
    CollapsedFacilityEntity? facility,

    /// Whether [facility] is only a preview — id, name and activity line —
    /// because the row carried no facility record (gift rows don't).
    @Default(false) bool isFacilityPreview,

    @Default('') String currency,
    DateTime? createdAt,
    DateTime? expireDate,
    @Default(1) int quantity,

    /// The items' price after any promotion offer, add-ons excluded.
    @Default(0) double price,
    @Default(0) double addOnsPrice,
    @Default(0) double couponDiscount,

    /// [price] plus [addOnsPrice].
    @Default(0) double totalPrice,

    /// What the user owes: [totalPrice] less [couponDiscount].
    @Default(0) double finalPrice,
    @Default(0) double refundAmount,

    /// The sum of the ledger's `paid` entries.
    @Default(0) double paidAmount,

    /// When the latest refund was recorded.
    DateTime? refundedAt,

    @Default(<PurchasedTicketEntity>[]) List<PurchasedTicketEntity> tickets,
    @Default(<PurchasedAddOnEntity>[]) List<PurchasedAddOnEntity> addOns,

    /// The promotion it was bought as, for package and Buy & Get rows.
    FacilityPromotionEntity? promotion,

    /// The promotion's own validity, when it has one.
    int? promotionValidityDays,

    /// The coupon a gifted coupon grants.
    GiftCouponEntity? coupon,

    /// The purchase a gift came from — "From Promotion".
    UserPurchaseEntity? sourcePurchase,

    /// The purchase a used coupon was applied to — "Applied" and its invoice.
    UserPurchaseEntity? appliedPurchase,
  }) = _UserPurchaseEntity;

  const UserPurchaseEntity._();

  /// Whether money is still owed, from the status and the ledger only.
  ///
  /// `paid` / `completed_paid` / `expiration_paid` say so outright; otherwise
  /// the ledger's `paid` entries must cover [finalPrice] (several rows are
  /// part-paid). A row that costs nothing — a gift — owes nothing.
  PurchasePaymentState get paymentState {
    if (finalPrice <= 0) return PurchasePaymentState.free;

    return switch (status) {
      PurchaseStatus.paid ||
      PurchaseStatus.completedPaid ||
      PurchaseStatus.expiredPaid => PurchasePaymentState.paid,
      PurchaseStatus.expiredDue || PurchaseStatus.completedDue => PurchasePaymentState.due,
      _ when paidAmount + 0.005 >= finalPrice => PurchasePaymentState.paid,
      _ => PurchasePaymentState.due,
    };
  }

  /// The chip on the card: the end of the purchase's life when it has ended,
  /// otherwise whether it is paid. Unknown statuses — and gifts in use — get
  /// none (brief F5).
  PurchaseBadge? get badge {
    switch (status) {
      case PurchaseStatus.refunded:
        return PurchaseBadge.refunded;
      case PurchaseStatus.expired || PurchaseStatus.expiredDue || PurchaseStatus.expiredPaid:
        return PurchaseBadge.expired;
      case PurchaseStatus.gift:
        return PurchaseBadge.gift;
      case PurchaseStatus.due ||
          PurchaseStatus.paid ||
          PurchaseStatus.completedPaid ||
          PurchaseStatus.completedDue:
        if (isGift) return null;
        return switch (paymentState) {
          PurchasePaymentState.due => PurchaseBadge.due,
          PurchasePaymentState.paid => PurchaseBadge.paid,
          PurchasePaymentState.free => null,
        };
      case PurchaseStatus.used || PurchaseStatus.unknown:
        return null;
    }
  }

  /// Whether the refund covered the whole amount; null when nothing was
  /// refunded.
  PurchaseRefundExtent? get refundExtent {
    if (refundAmount <= 0) return null;
    return refundAmount + 0.005 >= finalPrice
        ? PurchaseRefundExtent.full
        : PurchaseRefundExtent.partial;
  }

  /// Whether the user may cancel it: still due with nothing paid, and none of
  /// its tickets reserved (business rule, backend brief F1).
  ///
  /// A row without its tickets can't show it was never reserved, so it can't
  /// be cancelled either.
  bool get canCancel =>
      !isGift &&
      status == PurchaseStatus.due &&
      paidAmount <= 0 &&
      tickets.isNotEmpty &&
      tickets.every((ticket) => ticket.isUntouched);

  /// The activity line of its facility, when known.
  ActivityLineEntity? get activityLine => facility?.activityLine;

  /// The name the promotion goes by, falling back to the row's own.
  String get promotionName => promotion?.name ?? name;

  /// How many days [ticket] lasts: its own validity, else the promotion's.
  int? validityDaysOf(PurchasedTicketEntity? ticket) =>
      ticket?.validityDays ?? promotionValidityDays ?? coupon?.validityDays;
}
