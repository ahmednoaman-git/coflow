import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';

import '../entities/entities.dart';

/// An add-on line to price into the invoice (name + per-unit price).
typedef PurchaseAddOnSelection = ({String name, double unitPrice});

/// Pure pricing calculator for the purchase invoice breakdown.
///
/// Kept free of Cubit/DI dependencies so it can be unit-tested directly.
abstract final class PurchaseInvoiceCalculator {
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
