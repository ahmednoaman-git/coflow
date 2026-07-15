import 'package:coflow_users_v2/features/purchase/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CouponModel JSON parsing', () {
    test('parses every field of a coupon list entry as returned by GET coupons', () {
      final model = CouponModel.fromJson({
        'id': 386,
        'name': '10%',
        'type': 'coupon',
        'promo_gift': null,
        'price': 0,
        'discount_offer': null,
        'discount_coupon': null,
        'quantity': 1,
        'used': 1,
        'total_price': 0,
        'addons_price': 0,
        'final_price': 0,
        'paid': 0,
        'remain': 0,
        'refund': 0,
        'gift': true,
        'expire_date': '2026-07-27',
        'status': 'due',
        'action': 'gift',
        'user_id': 1,
        'admin_id': null,
        'created_by_id': 187,
        'facility_id': 173,
        'promotion_id': null,
        'payment_method_id': null,
        'created_at': '2026-06-27',
        'related_purchase_id': null,
        'coupon': {
          'id': 69,
          'discount_ratio': 10,
          'unlimited': false,
          'validity_days': 30,
          'applies_on': 'purchases',
          'status': 'active',
          'facility_id': 173,
          'deleted_at': null,
          'purchases_count': 10,
          'laravel_through_key': 386,
          'tickets': [],
          'promotions': [],
        },
        'facility': {'id': 173, 'name': 'skywings'},
      });

      expect(model.id, 386);
      expect(model.name, '10%');
      expect(model.type, 'coupon');
      expect(model.promoGift, isNull);
      expect(model.price, 0);
      expect(model.discountOffer, isNull);
      expect(model.discountCoupon, isNull);
      expect(model.quantity, 1);
      expect(model.used, 1);
      expect(model.totalPrice, 0);
      expect(model.addonsPrice, 0);
      expect(model.finalPrice, 0);
      expect(model.paid, 0);
      expect(model.remain, 0);
      expect(model.refund, 0);
      expect(model.gift, isTrue);
      expect(model.expireDate, DateTime.parse('2026-07-27'));
      expect(model.status, 'due');
      expect(model.action, 'gift');
      expect(model.userId, 1);
      expect(model.adminId, isNull);
      expect(model.createdById, 187);
      expect(model.facilityId, 173);
      expect(model.promotionId, isNull);
      expect(model.paymentMethodId, isNull);
      expect(model.createdAt, DateTime.parse('2026-06-27'));
      expect(model.relatedPurchaseId, isNull);

      expect(model.coupon.id, 69);
      expect(model.coupon.discountRatio, 10);
      expect(model.coupon.unlimited, isFalse);
      expect(model.coupon.validityDays, 30);
      expect(model.coupon.appliesOn, 'purchases');
      expect(model.coupon.status, 'active');
      expect(model.coupon.facilityId, 173);
      expect(model.coupon.deletedAt, isNull);
      expect(model.coupon.purchasesCount, 10);
      expect(model.coupon.laravelThroughKey, 386);
      expect(model.coupon.tickets, isEmpty);
      expect(model.coupon.promotions, isEmpty);

      expect(model.facility?.id, 173);
      expect(model.facility?.name, 'skywings');
    });

    test('parses a coupon looked up by promotion_id, where facility-scoped ids are absent', () {
      final model = CouponModel.fromJson({
        'id': 386,
        'name': '10%',
        'type': 'coupon',
        'promotion_id': null,
        'coupon': {
          'id': 69,
          'discount_ratio': 10,
          'unlimited': false,
          'applies_on': 'purchases',
          'status': 'active',
          'facility_id': 173,
          'laravel_through_key': 386,
        },
      });

      expect(model.facility, isNull);
      expect(model.promotionId, isNull);
      expect(model.coupon.validityDays, isNull);
      expect(model.coupon.purchasesCount, isNull);
      expect(model.coupon.deletedAt, isNull);
      expect(model.coupon.tickets, isEmpty);
      expect(model.coupon.promotions, isEmpty);
    });
  });
}
