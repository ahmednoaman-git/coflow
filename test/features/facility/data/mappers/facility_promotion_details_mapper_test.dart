import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FacilityPromotionDetailsMapper', () {
    test('maps package promotion details and reuses package summary fields', () {
      final entity = FacilityPromotionDetailsMapper.toEntity(
        FacilityPromotionDetailsModel(
          promotion: FacilityPromotionModel(
            id: 1,
            name: 'Monthly Package 1',
            price: 500,
            discountPrice: 450,
            type: 'package',
            unlimited: false,
            validityDays: 30,
            paymentUnlimited: false,
            paymentRemain: 8,
            endDate: DateTime(2026, 5, 31),
            description: 'Package description',
            requirements: 'Package requirements',
            conditions: 'Package conditions',
            currency: 'EGP',
            tickets: const [
              FacilityPromotionTicketLineModel(
                count: 3,
                ticket: FacilityPromotionTicketSnapshotModel(name: 'Class Pass'),
              ),
            ],
          ),
        ),
      );

      expect(entity.title, 'Monthly Package 1');
      expect(entity.priceText, 'EGP 450');
      expect(entity.description, 'Package description');
      expect(entity.requirements, 'Package requirements');
      expect(entity.conditions, 'Package conditions');
      expect(entity.validityDays, 30);
      expect(entity.unlimited, isFalse);
      expect(entity.promotion, isA<FacilityPromotionPackageEntity>());

      final promotion = entity.promotion as FacilityPromotionPackageEntity;
      expect(promotion.tickets, hasLength(1));
      expect(promotion.tickets.first.name, 'Class Pass');
      expect(promotion.remainingCount, 8);
    });

    test('maps buy & get coupon promotion details and preserves coupon rewards', () {
      final entity = FacilityPromotionDetailsMapper.toEntity(
        FacilityPromotionDetailsModel(
          promotion: FacilityPromotionModel(
            id: 2,
            name: 'Buy & Get Coupon',
            price: 1500,
            discountPrice: 1000,
            type: 'buy_get',
            paymentUnlimited: false,
            paymentRemain: 1000,
            endDate: DateTime(2026, 5, 31),
            description: 'Coupon promo description',
            currency: 'EGP',
            tickets: const [
              FacilityPromotionTicketLineModel(
                unlimited: true,
                ticket: FacilityPromotionTicketSnapshotModel(name: 'Workshop Pass'),
              ),
            ],
            coupons: const [
              FacilityPromotionCouponModel(discountRatio: 20, appliesOn: 'tickets'),
              FacilityPromotionCouponModel(discountRatio: 30, appliesOn: 'tickets'),
            ],
          ),
        ),
      );

      expect(entity.promotion, isA<FacilityPromotionBuyGetEntity>());

      final promotion = entity.promotion as FacilityPromotionBuyGetEntity;
      expect(promotion.reward, isA<FacilityPromotionCouponRewardEntity>());
      expect(promotion.buyTickets, hasLength(1));
      expect(promotion.buyTickets.first.unlimited, isTrue);

      final reward = promotion.reward as FacilityPromotionCouponRewardEntity;
      expect(reward.coupons, hasLength(2));
      expect(reward.coupons.first.discountRatio, 20);
      expect(reward.coupons.last.discountRatio, 30);
    });
  });
}
