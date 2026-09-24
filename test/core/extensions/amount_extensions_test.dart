import 'package:coflow_users_v2/core/extensions/amount_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AmountText', () {
    test('drops the decimals of whole amounts', () {
      expect(1000.0.amountText, '1000');
      expect(0.0.amountText, '0');
      expect(225.amountText, '225');
    });

    test('keeps at most two decimals and no trailing zeros', () {
      expect(499.99.amountText, '499.99');
      expect(12.5.amountText, '12.5');
      expect(89.1.amountText, '89.1');
      expect(10.004.amountText, '10');
    });

    test('puts the currency before the amount', () {
      expect(9000.0.priceText('EGP'), 'EGP 9000');
      expect(90.0.priceText(r'$'), r'$ 90');
      expect(12.5.priceText('  '), '12.5');
    });
  });
}
