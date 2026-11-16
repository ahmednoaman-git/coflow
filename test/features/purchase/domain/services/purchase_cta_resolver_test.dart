import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

CollapsedFacilityEntity _facility({
  required SubscriptionStatus subscription,
  required String paymentType,
}) => CollapsedFacilityEntity(
  id: 1,
  name: 'Facility',
  description: '',
  activityLine: ActivityLineEntity.sky,
  accountType: const ProAccount(),
  status: FacilityStatus.visible,
  subscriptionStatus: subscription,
  paymentType: PaymentType.fromString(paymentType),
  views: 0,
);

void main() {
  group('PurchaseCtaResolver.allowsInAppPurchase', () {
    test('premium facilities sell in the app, online payment types included', () {
      // Online and deposit payment are out of scope: they buy the same
      // cash-on-arrival way as a direct purchase.
      for (final paymentType in ['direct purchase', 'full online', 'deposit online']) {
        for (final subscription in [SubscriptionStatus.active, SubscriptionStatus.trial]) {
          expect(
            PurchaseCtaResolver.allowsInAppPurchase(
              _facility(subscription: subscription, paymentType: paymentType),
            ),
            isTrue,
            reason: '$subscription / $paymentType',
          );
        }
      }
    });

    test('a premium facility set to contact is contact-only', () {
      // CLYMB Abu Dhabi: active, `payment_type: contact`.
      expect(
        PurchaseCtaResolver.allowsInAppPurchase(
          _facility(subscription: SubscriptionStatus.active, paymentType: 'contact'),
        ),
        isFalse,
      );
    });

    test('basic and inactive facilities are contact-only whatever their payment type', () {
      for (final subscription in [SubscriptionStatus.basic, SubscriptionStatus.inactive]) {
        expect(
          PurchaseCtaResolver.allowsInAppPurchase(
            _facility(subscription: subscription, paymentType: 'deposit online'),
          ),
          isFalse,
        );
      }
    });
  });

  test('PaymentType reads contact', () {
    expect(PaymentType.fromString('contact'), PaymentType.contact);
    expect(PaymentType.fromString('Direct Purchase'), PaymentType.directPurchase);
    expect(PaymentType.fromString('something new'), PaymentType.none);
  });
}
