import 'package:coflow_users_v2/features/purchase/domain/entities/entities.dart';

import '../entities/entities.dart';

/// The "Purchase Invoice" of an owned purchase, in the same breakdown checkout
/// shows ([PurchaseInvoiceEntity]): the items, the add-ons, the coupon, the
/// total — all from the row's own amounts, never recomputed.
abstract final class UserPurchaseInvoice {
  /// [addOnLabel] names one add-on line; [addOnsLabel] names a single line for
  /// all of them, used when the per-add-on amounts don't add up to the row's
  /// add-ons price.
  static PurchaseInvoiceEntity of(
    UserPurchaseEntity purchase, {
    required String Function(String name) addOnLabel,
    required String addOnsLabel,
  }) {
    final addOnLines = [
      for (final addOn in purchase.addOns)
        PurchaseInvoiceLineEntity(
          label: addOnLabel(addOn.name),
          quantity: addOn.quantity,
          amount: addOn.price,
        ),
    ];
    final splitTotal = addOnLines.fold<double>(0, (sum, line) => sum + line.amount);
    final splitAddsUp = addOnLines.isNotEmpty && (splitTotal - purchase.addOnsPrice).abs() < 0.005;

    return PurchaseInvoiceEntity(
      currency: purchase.currency,
      lines: [
        PurchaseInvoiceLineEntity(
          label: itemLabel(purchase),
          quantity: purchase.quantity,
          amount: purchase.price,
        ),
        if (purchase.addOnsPrice > 0)
          ...splitAddsUp
              ? addOnLines
              : [
                  PurchaseInvoiceLineEntity(
                    label: addOnsLabel,
                    quantity: 1,
                    amount: purchase.addOnsPrice,
                  ),
                ],
      ],
      subtotal: purchase.totalPrice,
      couponDiscount: purchase.couponDiscount,
      total: purchase.finalPrice,
    );
  }

  /// What was bought: the promotion for a promotion row, otherwise its ticket.
  static String itemLabel(UserPurchaseEntity purchase) {
    if (purchase.kind.isPromotion) return purchase.promotionName;
    return purchase.tickets.firstOrNull?.name ?? purchase.name;
  }
}
