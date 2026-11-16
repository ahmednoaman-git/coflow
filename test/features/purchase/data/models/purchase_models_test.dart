import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/data/data.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:dio/dio.dart';
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
      quantity: 5,
      addOnLabel: (name) => 'Add-On: $name',
      addOnsLabel: 'Add-ons',
    );
    expect(invoice.currency, '€');
    expect(invoice.total, 54);
    expect(invoice.couponDiscount, 6);
    expect(invoice.lines.map((line) => line.amount), [45, 15]);
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

  group('PurchaseMapper.quoteFailure', () {
    SubmitPurchaseDto selection({int? couponId}) => SubmitPurchaseDto(
      subjectType: PurchaseSubjectType.ticket,
      subjectId: 107,
      quantity: 1,
      couponId: couponId,
    );

    ValidationFailure unprocessable(Map<String, dynamic> errors) {
      final request = RequestOptions(path: 'purchase-ticket/validate');
      return ValidationFailure(
        'The given data was invalid.',
        exception: DioException(
          requestOptions: request,
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: request,
            statusCode: 422,
            data: {'message': 'The given data was invalid.', 'errors': errors},
          ),
        ),
      );
    }

    test('a coupon_id validation error is a refused coupon', () {
      // Live: a coupon that does not cover the ticket.
      final failure = PurchaseMapper.quoteFailure(
        unprocessable({
          'coupon_id': ['The selected coupon id is invalid.'],
        }),
        selection(couponId: 750),
      );

      expect(failure, isA<CouponRejectedFailure>());
      expect(failure.message, 'The given data was invalid.');
    });

    test("a 404 with a coupon sent is a refused coupon (another facility's)", () {
      expect(
        PurchaseMapper.quoteFailure(const NotFoundFailure('Not found'), selection(couponId: 71)),
        isA<CouponRejectedFailure>(),
      );
    });

    test('other failures pass through untouched', () {
      final quantity = unprocessable({
        'quantity': ['The quantity may not be greater than 5.'],
      });
      const offline = NetworkFailure('offline');
      const missing = NotFoundFailure('Not found');

      expect(PurchaseMapper.quoteFailure(quantity, selection(couponId: 76)), same(quantity));
      expect(PurchaseMapper.quoteFailure(offline, selection(couponId: 76)), same(offline));
      expect(PurchaseMapper.quoteFailure(missing, selection()), same(missing));
    });
  });
}
