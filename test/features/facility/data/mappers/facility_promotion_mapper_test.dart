import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FacilityPromotionMapper', () {
    test('maps package promotions without deduplicating repeated ticket lines', () {
      final entity = FacilityPromotionMapper.toEntity(
        FacilityPromotionModel(
          id: 1,
          name: 'Package Promo',
          price: 500,
          discountPrice: 450,
          type: 'package',
          endDate: DateTime(2026, 5, 9),
          currency: 'EGP',
          tickets: const [
            FacilityPromotionTicketLineModel(
              count: 2,
              ticket: FacilityPromotionTicketSnapshotModel(name: 'Class Pass'),
            ),
            FacilityPromotionTicketLineModel(
              count: 2,
              ticket: FacilityPromotionTicketSnapshotModel(name: 'Class Pass'),
            ),
          ],
        ),
      );

      expect(entity, isA<FacilityPromotionPackageEntity>());

      final packagePromotion = entity as FacilityPromotionPackageEntity;
      expect(packagePromotion.displayPrice, 450);
      expect(packagePromotion.tickets, hasLength(2));
      expect(packagePromotion.tickets.first.name, 'Class Pass');
      expect(packagePromotion.tickets.last.name, 'Class Pass');
      expect(packagePromotion.remainingCount, facilityPromotionDefaultRemainingCount);
    });

    test('maps coupon rewards for buy & get promotions and preserves all coupons', () {
      final entity = FacilityPromotionMapper.toEntity(
        FacilityPromotionModel(
          id: 2,
          name: 'Buy & Get Promo',
          price: 300,
          type: 'buy_get',
          endDate: DateTime(2026, 5, 10),
          currency: 'EGP',
          tickets: const [
            FacilityPromotionTicketLineModel(
              count: 1,
              ticket: FacilityPromotionTicketSnapshotModel(name: 'Open Gym'),
            ),
          ],
          coupons: const [
            FacilityPromotionCouponModel(discountRatio: 10, appliesOn: 'tickets'),
            FacilityPromotionCouponModel(discountRatio: 15, appliesOn: 'packages'),
          ],
        ),
      );

      expect(entity, isA<FacilityPromotionBuyGetEntity>());

      final buyGetPromotion = entity as FacilityPromotionBuyGetEntity;
      expect(buyGetPromotion.reward, isA<FacilityPromotionCouponRewardEntity>());

      final couponReward = buyGetPromotion.reward as FacilityPromotionCouponRewardEntity;
      expect(couponReward.coupons, hasLength(2));
      expect(couponReward.coupons.first.appliesOnText, 'Tickets');
      expect(couponReward.coupons.last.appliesOnText, 'Packages');
    });

    test('throws when buy & get promotions contain multiple reward sources', () {
      final model = FacilityPromotionModel(
        id: 3,
        name: 'Broken Promo',
        price: 250,
        type: 'buy_get',
        endDate: DateTime(2026, 5, 11),
        currency: 'EGP',
        gift: 'Free Bottle',
        getTickets: const [
          FacilityPromotionTicketLineModel(
            count: 1,
            ticket: FacilityPromotionTicketSnapshotModel(name: 'Spin Class'),
          ),
        ],
      );

      expect(
        () => FacilityPromotionMapper.toEntity(model),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
