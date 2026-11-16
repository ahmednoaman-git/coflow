import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

PurchaseInvoiceEntity _invoice(
  PurchaseQuoteEntity quote, {
  int quantity = 1,
  List<PurchaseAddOnSelection> addOns = const [],
}) => PurchaseInvoiceCalculator.fromQuote(
  quote: quote,
  currency: 'EGP',
  itemLabel: 'Bungee Ticket',
  quantity: quantity,
  addOns: addOns,
  addOnLabel: (name) => 'Add-On: $name',
  addOnsLabel: 'Add-ons',
);

void main() {
  group('PurchaseInvoiceCalculator.fromQuote', () {
    test('shows only the item when nothing else is priced', () {
      // Bungee Ticket at Flying Yoga: 250 with a 10% offer.
      final invoice = _invoice(
        const PurchaseQuoteEntity(totalPrice: 225, finalPrice: 225, couponDiscount: 0),
      );

      expect(invoice.lines, [
        const PurchaseInvoiceLineEntity(label: 'Bungee Ticket', quantity: 1, amount: 225),
      ]);
      expect(invoice.total, 225);
      expect(invoice.hasCouponDiscount, isFalse);
    });

    test('gives each add-on its own line, charged per unit', () {
      // Live quote: 2 tickets with one 100 add-on → total 650, add-ons 200.
      final invoice = _invoice(
        const PurchaseQuoteEntity(
          totalPrice: 650,
          finalPrice: 650,
          couponDiscount: 0,
          addOnsPrice: 200,
        ),
        quantity: 2,
        addOns: const [(name: 'Photography', unitPrice: 100)],
      );

      expect(invoice.lines, [
        const PurchaseInvoiceLineEntity(label: 'Bungee Ticket', quantity: 2, amount: 450),
        const PurchaseInvoiceLineEntity(label: 'Add-On: Photography', quantity: 2, amount: 200),
      ]);
      expect(invoice.subtotal, 650);
    });

    test('keeps add-ons as one line when the split does not add up', () {
      final invoice = _invoice(
        const PurchaseQuoteEntity(
          totalPrice: 60,
          finalPrice: 60,
          couponDiscount: 0,
          addOnsPrice: 15,
        ),
        quantity: 5,
        addOns: const [(name: 'Photography', unitPrice: 5), (name: 'Video', unitPrice: 10)],
      );

      expect(
        invoice.lines.last,
        const PurchaseInvoiceLineEntity(
          label: 'Add-ons',
          quantity: 1,
          amount: 15,
        ),
      );
      expect(invoice.lines.map((line) => line.amount), [45, 15]);
    });

    test('takes the coupon discount and total from the quote', () {
      // Live quote: Indoor Skydiving with CLYMB's 100% ticket coupon.
      final invoice = _invoice(
        const PurchaseQuoteEntity(totalPrice: 90, finalPrice: 0, couponDiscount: 90),
      );

      expect(invoice.hasCouponDiscount, isTrue);
      expect(invoice.couponDiscount, 90);
      expect(invoice.total, 0);
    });

    test('prefers the currency the quote names', () {
      final invoice = _invoice(
        const PurchaseQuoteEntity(
          totalPrice: 90,
          finalPrice: 90,
          couponDiscount: 0,
          currency: r'$',
        ),
      );

      expect(invoice.currency, r'$');
    });
  });
}
