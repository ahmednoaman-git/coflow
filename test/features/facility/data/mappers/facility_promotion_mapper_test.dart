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
          paymentUnlimited: false,
          paymentRemain: 8,
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
      expect(packagePromotion.remainingUnlimited, isFalse);
      expect(packagePromotion.remainingCount, 8);
    });

    test('maps coupon rewards for buy & get promotions and preserves all coupons', () {
      final entity = FacilityPromotionMapper.toEntity(
        FacilityPromotionModel(
          id: 2,
          name: 'Buy & Get Promo',
          price: 300,
          type: 'buy_get',
          paymentUnlimited: true,
          paymentRemain: 0,
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
      expect(buyGetPromotion.remainingUnlimited, isTrue);
      expect(buyGetPromotion.remainingCount, isNull);

      final couponReward = buyGetPromotion.reward as FacilityPromotionCouponRewardEntity;
      expect(couponReward.coupons, hasLength(2));
      expect(couponReward.coupons.first.appliesOn, FacilityPromotionAppliesOn.tickets);
      expect(couponReward.coupons.last.appliesOn, FacilityPromotionAppliesOn.packages);
    });

    test('maps discount_for purchases to all purchases text', () {
      final entity = FacilityPromotionMapper.toEntity(
        FacilityPromotionModel(
          id: 4,
          name: 'Discount Promo',
          discountRatio: 10,
          type: 'discount',
          discountFor: 'purchases',
          endDate: DateTime(2026, 5, 12),
        ),
      );

      expect(entity, isA<FacilityPromotionDiscountEntity>());

      final discountPromotion = entity as FacilityPromotionDiscountEntity;
      expect(discountPromotion.discountFor, FacilityPromotionAppliesOn.allPurchases);
    });

    test('maps discount_for promotions to all promotions enum', () {
      final entity = FacilityPromotionMapper.toEntity(
        FacilityPromotionModel(
          id: 5,
          name: 'Discount Promo',
          discountRatio: 15,
          type: 'discount',
          discountFor: 'promotions',
          endDate: DateTime(2026, 5, 13),
        ),
      );

      expect(entity, isA<FacilityPromotionDiscountEntity>());

      final discountPromotion = entity as FacilityPromotionDiscountEntity;
      expect(discountPromotion.discountFor, FacilityPromotionAppliesOn.allPromotions);
    });

    test('throws when discount promotion is missing discount_for', () {
      final model = FacilityPromotionModel(
        id: 6,
        name: 'Broken Discount Promo',
        discountRatio: 20,
        type: 'discount',
        endDate: DateTime(2026, 5, 14),
      );

      expect(
        () => FacilityPromotionMapper.toEntity(model),
        throwsA(isA<FormatException>()),
      );
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
