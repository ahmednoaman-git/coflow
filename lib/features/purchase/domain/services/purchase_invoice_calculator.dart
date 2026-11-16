import '../entities/entities.dart';

/// An add-on the customer ticked (name + per-unit price).
typedef PurchaseAddOnSelection = ({String name, double unitPrice});

/// Builds the purchase invoice from a checkout quote.
///
/// Kept free of Cubit/DI dependencies so it can be unit-tested directly.
abstract final class PurchaseInvoiceCalculator {
  /// Checkout only displays backend amounts: it never invents a deposit or
  /// reapplies quantity/coupon calculations of its own.
  ///
  /// The quote prices add-ons as one sum. They are split into a line each —
  /// [addOnLabel] names one, charged per unit like the ticket — only while
  /// the split adds up to that sum; otherwise they stay one [addOnsLabel] line.
  static PurchaseInvoiceEntity fromQuote({
    required PurchaseQuoteEntity quote,
    required String currency,
    required String itemLabel,
    required int quantity,
    List<PurchaseAddOnSelection> addOns = const [],
    required String Function(String name) addOnLabel,
    required String addOnsLabel,
  }) {
    final addOnLines = [
      for (final addOn in addOns)
        PurchaseInvoiceLineEntity(
          label: addOnLabel(addOn.name),
          quantity: quantity,
          amount: addOn.unitPrice * quantity,
        ),
    ];
    final splitTotal = addOnLines.fold<double>(0, (sum, line) => sum + line.amount);
    final splitAddsUp = addOnLines.isNotEmpty && (splitTotal - quote.addOnsPrice).abs() < 0.005;

    return PurchaseInvoiceEntity(
      currency: quote.currency ?? currency,
      lines: [
        PurchaseInvoiceLineEntity(label: itemLabel, quantity: quantity, amount: quote.itemsPrice),
        if (quote.addOnsPrice > 0)
          ...splitAddsUp
              ? addOnLines
              : [
                  PurchaseInvoiceLineEntity(
                    label: addOnsLabel,
                    quantity: 1,
                    amount: quote.addOnsPrice,
                  ),
                ],
      ],
      subtotal: quote.totalPrice,
      couponDiscount: quote.couponDiscount,
      total: quote.finalPrice,
    );
  }
}
