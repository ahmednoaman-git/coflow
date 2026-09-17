import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';

import '../entities/entities.dart';

/// An add-on line to price into the invoice (name + per-unit price).
typedef PurchaseAddOnSelection = ({String name, double unitPrice});

/// Pure pricing calculator for the purchase invoice breakdown.
///
/// Kept free of Cubit/DI dependencies so it can be unit-tested directly.
abstract final class PurchaseInvoiceCalculator {
  /// Checkout only displays backend amounts. In particular, it never invents
  /// a deposit or independently reapplies quantity/coupon calculations.
  static PurchaseInvoiceEntity fromQuote({
    required PurchaseQuoteEntity quote,
    required String currency,
    required String itemLabel,
    required String addOnsLabel,
    required int quantity,
  }) => PurchaseInvoiceEntity(
    currency: quote.currency ?? currency,
    lines: [
      PurchaseInvoiceLineEntity(
        label: itemLabel,
        quantity: quantity,
        amount: quote.totalPrice - quote.addOnsPrice,
      ),
      if (quote.addOnsPrice > 0)
        PurchaseInvoiceLineEntity(label: addOnsLabel, quantity: 1, amount: quote.addOnsPrice),
    ],
    subtotal: quote.totalPrice,
    couponDiscount: quote.couponDiscount,
    total: quote.finalPrice,
  );

  static PurchaseInvoiceEntity compute({
    required String currency,
    required String itemLabel,
    required double unitPrice,
    required int quantity,
    required List<PurchaseAddOnSelection> selectedAddOns,
    required PurchaseCouponEntity? coupon,
    required PaymentType paymentType,
    required double depositRatio,
  }) {
    final lines = <PurchaseInvoiceLineEntity>[
      PurchaseInvoiceLineEntity(
        label: itemLabel,
        quantity: quantity,
        amount: unitPrice * quantity,
      ),
      for (final addOn in selectedAddOns)
        PurchaseInvoiceLineEntity(
          label: addOn.name,
          quantity: quantity,
          amount: addOn.unitPrice * quantity,
        ),
    ];

    final subtotal = lines.fold<double>(0, (sum, line) => sum + line.amount);
    final couponDiscount = coupon == null ? 0.0 : subtotal * coupon.discountRatio / 100;
    final total = subtotal - couponDiscount;
    final depositAmount = paymentType == PaymentType.depositOnline ? total * depositRatio : null;

    return PurchaseInvoiceEntity(
      currency: currency,
      lines: lines,
      subtotal: subtotal,
      couponDiscount: couponDiscount,
      total: total,
      depositAmount: depositAmount,
    );
  }
}
