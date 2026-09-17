import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountType.features', () {
    test('Flow basic gets flows, schedule and purchasing — no calendar', () {
      expect(const FlowAccount().features(SubscriptionStatus.basic), {
        FacilityFeature.flows,
        FacilityFeature.schedule,
        FacilityFeature.purchasing,
      });
    });

    test('Flow premium swaps schedule for calendar and adds online payment', () {
      expect(const FlowAccount().features(SubscriptionStatus.active), {
        FacilityFeature.flows,
        FacilityFeature.calendar,
        FacilityFeature.purchasing,
        FacilityFeature.onlinePayment,
      });
    });

    group('an inactive subscription resolves to the basic tier', () {
      test('Flow inactive matches Flow basic — schedule, never calendar', () {
        final inactive = const FlowAccount().features(SubscriptionStatus.inactive);

        expect(inactive, const FlowAccount().features(SubscriptionStatus.basic));
        expect(inactive, contains(FacilityFeature.schedule));
        expect(inactive, isNot(contains(FacilityFeature.calendar)));
      });

      test('Go inactive matches Go basic', () {
        expect(
          const GoAccount().features(SubscriptionStatus.inactive),
          const GoAccount().features(SubscriptionStatus.basic),
        );
      });

      test('Pro inactive matches Pro basic', () {
        expect(
          const ProAccount().features(SubscriptionStatus.inactive),
          const ProAccount().features(SubscriptionStatus.basic),
        );
      });

      test('pricing stays reachable but online payment does not', () {
        for (final account in const [GoAccount(), FlowAccount(), ProAccount()]) {
          final features = account.features(SubscriptionStatus.inactive);

          expect(features, contains(FacilityFeature.purchasing), reason: account.label);
          expect(
            features,
            isNot(contains(FacilityFeature.onlinePayment)),
            reason: account.label,
          );
        }
      });
    });
  });
}
