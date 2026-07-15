import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PurchaseInvoiceCalculator', () {
    test('computes a base-only invoice with no add-ons, coupon, or deposit', () {
      final invoice = PurchaseInvoiceCalculator.compute(
        currency: 'EGP',
        itemLabel: 'GripFit Adult',
        unitPrice: 1000,
        quantity: 1,
        selectedAddOns: const [],
        coupon: null,
        paymentType: PaymentType.fullOnline,
        depositRatio: 0.10,
      );

      expect(invoice.lines, hasLength(1));
      expect(invoice.lines.single.amount, 1000);
      expect(invoice.subtotal, 1000);
      expect(invoice.couponDiscount, 0);
      expect(invoice.total, 1000);
      expect(invoice.hasCouponDiscount, isFalse);
      expect(invoice.hasDeposit, isFalse);
    });

    test('multiplies base price and add-ons by quantity', () {
      final invoice = PurchaseInvoiceCalculator.compute(
        currency: 'EGP',
        itemLabel: 'GripFit Adult',
        unitPrice: 1000,
        quantity: 2,
        selectedAddOns: const [
          (name: 'Photography', unitPrice: 100),
          (name: 'Video', unitPrice: 200),
        ],
        coupon: null,
        paymentType: PaymentType.fullOnline,
        depositRatio: 0.10,
      );

      expect(invoice.lines, hasLength(3));
      expect(invoice.lines[0].amount, 2000); // 2x base
      expect(invoice.lines[1].amount, 200); // 2x photography
      expect(invoice.lines[2].amount, 400); // 2x video
      expect(invoice.subtotal, 2600);
      expect(invoice.total, 2600);
    });

    test('applies the coupon discount ratio to the subtotal', () {
      const coupon = PurchaseCouponEntity(id: 1, name: '10% Discount', discountRatio: 10);

      final invoice = PurchaseInvoiceCalculator.compute(
        currency: 'EGP',
        itemLabel: 'GripFit Adult',
        unitPrice: 1000,
        quantity: 2,
        selectedAddOns: const [
          (name: 'Photography', unitPrice: 100),
          (name: 'Video', unitPrice: 200),
        ],
        coupon: coupon,
        paymentType: PaymentType.fullOnline,
        depositRatio: 0.10,
      );

      expect(invoice.subtotal, 2600);
      expect(invoice.couponDiscount, closeTo(260, 0.001));
      expect(invoice.total, closeTo(2340, 0.001));
      expect(invoice.hasCouponDiscount, isTrue);
    });

    test('adds a deposit amount only for deposit-online payment types', () {
      final depositInvoice = PurchaseInvoiceCalculator.compute(
        currency: 'EGP',
        itemLabel: 'GripFit Adult',
        unitPrice: 1000,
        quantity: 1,
        selectedAddOns: const [],
        coupon: null,
        paymentType: PaymentType.depositOnline,
        depositRatio: 0.10,
      );
      expect(depositInvoice.hasDeposit, isTrue);
      expect(depositInvoice.depositAmount, closeTo(100, 0.001));

      final directInvoice = PurchaseInvoiceCalculator.compute(
        currency: 'EGP',
        itemLabel: 'GripFit Adult',
        unitPrice: 1000,
        quantity: 1,
        selectedAddOns: const [],
        coupon: null,
        paymentType: PaymentType.directPurchase,
        depositRatio: 0.10,
      );
      expect(directInvoice.hasDeposit, isFalse);
    });
  });
}
