import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

CollapsedFacilityEntity _facility(AccountType accountType, SubscriptionStatus subscription) {
  return CollapsedFacilityEntity(
    id: 1,
    name: 'Flying Yoga',
    description: 'Aerial & Yoga Studio',
    activityLine: ActivityLineEntity.sky,
    accountType: accountType,
    status: FacilityStatus.visible,
    subscriptionStatus: subscription,
    paymentType: PaymentType.directPurchase,
    views: 0,
  );
}

void main() {
  group('FacilityScheduleConfig.forFacility', () {
    test('Flow basic gets the Schedule variant: no month navigator, no capacity', () {
      final config = FacilityScheduleConfig.forFacility(
        _facility(const FlowAccount(), SubscriptionStatus.basic),
      );

      expect(config.showsMonthNavigator, isFalse);
      expect(config.showsCapacity, isFalse);
      expect(config.showsTypeToggle, isFalse);
      expect(config.serviceTypes, [FacilityServiceType.flow]);
    });

    test('Flow premium gets the Calendar variant over the same flows', () {
      final config = FacilityScheduleConfig.forFacility(
        _facility(const FlowAccount(), SubscriptionStatus.active),
      );

      expect(config.showsMonthNavigator, isTrue);
      expect(config.showsCapacity, isTrue);
      expect(config.showsTypeToggle, isFalse);
      expect(config.serviceTypes, [FacilityServiceType.flow]);
    });

    test('Pro premium gets the Calendar variant with an activities/courses toggle', () {
      final config = FacilityScheduleConfig.forFacility(
        _facility(const ProAccount(), SubscriptionStatus.active),
      );

      expect(config.showsMonthNavigator, isTrue);
      expect(config.showsCapacity, isTrue);
      expect(config.showsTypeToggle, isTrue);
      expect(config.serviceTypes, [FacilityServiceType.activity, FacilityServiceType.course]);
      expect(config.initialType, FacilityServiceType.activity);
    });

    test('an inactive subscription drops to the basic Schedule variant', () {
      final config = FacilityScheduleConfig.forFacility(
        _facility(const FlowAccount(), SubscriptionStatus.inactive),
      );

      // A lapsed Flow account keeps Schedule and never gets Calendar.
      expect(config.isCalendar, isFalse);
      expect(config.showsMonthNavigator, isFalse);
      expect(config.showsCapacity, isFalse);
      expect(config.serviceTypes, [FacilityServiceType.flow]);
      expect(config.showsTypeToggle, isFalse);
    });
  });
}
