import 'package:coflow_users_v2/features/purchase/data/data.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ticket quote parses numeric strings and preserves authoritative amounts', () {
    final quote = PurchaseMapper.quote(
      PurchaseQuoteModel.fromJson({
        'total_price': '60',
        'final_price': 54,
        'discount_coupon': '6',
        'addons_price': 15,
        'currency': '€',
      }),
    );
    final invoice = PurchaseInvoiceCalculator.fromQuote(
      quote: quote,
      currency: 'EGP',
      itemLabel: 'Ticket',
      addOnsLabel: 'Add-ons',
      quantity: 5,
    );
    expect(invoice.currency, '€');
    expect(invoice.total, 54);
    expect(invoice.couponDiscount, 6);
    expect(invoice.lines.map((line) => line.amount), [45, 15]);
    expect(invoice.hasDeposit, isFalse);
  });

  test('promotion quote permits omitted addons and currency', () {
    final model = PurchaseQuoteModel.fromJson({
      'total_price': 1250,
      'final_price': 1250,
      'discount_coupon': 0,
    });
    expect(model.addonsPrice, 0);
    expect(model.currency, isNull);
  });

  test('invalid or missing quoted totals fail instead of displaying zero', () {
    for (final amount in [null, 'invalid', '-1', 'NaN']) {
      expect(
        () => PurchaseQuoteModel.fromJson({
          'total_price': 9,
          'final_price': amount,
          'discount_coupon': 0,
        }),
        throwsA(isA<Exception>()),
      );
    }
  });

  test('success requires a persisted purchase ID and accepts string IDs', () {
    expect(PurchaseMapper.receipt(PurchaseReceiptModel.fromJson({'id': '761'})).id, 761);
    for (final id in [null, 0, -1, 'unknown']) {
      expect(() => PurchaseReceiptModel.fromJson({'id': id}), throwsA(isA<Exception>()));
    }
  });

  test('request sends selected ticket additions and omits absent coupon', () {
    final selectedIds = [99, 100];
    final dto = SubmitPurchaseDto(
      subjectType: PurchaseSubjectType.ticket,
      subjectId: 103,
      quantity: 5,
      addOnIds: selectedIds,
    );
    selectedIds.clear();
    expect(dto.toJson(), {
      'ticket_id': 103,
      'quantity': 5,
      'addons': [99, 100],
    });
    expect(
      SubmitPurchaseDto(
        subjectType: PurchaseSubjectType.promotion,
        subjectId: 204,
        quantity: 1,
        couponId: 4,
      ).toJson(),
      {'promotion_id': 204, 'quantity': 1, 'coupon_id': 4},
    );
  });
}
