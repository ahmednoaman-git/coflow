import 'package:coflow_users_v2/features/purchase/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

/// `GET coupons` rows as the test API returned them on 2026-09-23 (trimmed of
/// the fields nothing reads).
Map<String, dynamic> _couponRow({
  required int id,
  required Object? coupon,
  int facilityId = 194,
}) => {
  'id': id,
  'name': '100%',
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
  'expire_date': '2026-10-08',
  'status': 'due',
  'action': 'gift',
  'user_id': 1,
  'admin_id': null,
  'created_by_id': null,
  'facility_id': facilityId,
  'promotion_id': null,
  'payment_method_id': null,
  'created_at': '2026-09-08T17:37:07.000000Z',
  'related_purchase_id': 749,
  'purchase_coupon_id': null,
  'currency': null,
  'coupon': coupon,
  'facility': {'id': facilityId, 'name': 'CLYMB Abu Dhabi', 'is_branch': false, 'tags': []},
};

void main() {
  group('CouponModel JSON parsing', () {
    test('parses a held coupon and its definition', () {
      final model = CouponModel.fromJson(
        _couponRow(
          id: 750,
          coupon: {
            'id': 76,
            'discount_ratio': 100,
            'unlimited': false,
            'validity_days': 30,
            'applies_on': 'tickets',
            'status': 'active',
            'facility_id': 194,
            'deleted_at': null,
            'purchases_count': 3,
            'laravel_through_key': 750,
            'tickets': [],
            'promotions': [],
          },
        ),
      );

      expect(model.id, 750);
      expect(model.facilityId, 194);
      expect(model.expireDate, DateTime.parse('2026-10-08'));
      expect(model.relatedPurchaseId, 749);
      expect(model.facility?.name, 'CLYMB Abu Dhabi');

      final coupon = model.coupon!;
      expect(coupon.id, 76);
      expect(coupon.discountRatio, 100);
      expect(coupon.appliesOn, 'tickets');
      expect(coupon.facilityId, 194);
      expect(coupon.laravelThroughKey, 750);
      expect(coupon.tickets, isEmpty);
      expect(coupon.promotions, isEmpty);
    });

    test('keeps the tickets a coupon is limited to', () {
      final model = CouponModel.fromJson(
        _couponRow(
          id: 178,
          facilityId: 157,
          coupon: {
            'id': 39,
            'discount_ratio': 25,
            'unlimited': false,
            'validity_days': 90,
            'applies_on': null,
            'status': 'active',
            'facility_id': 157,
            'deleted_at': null,
            'purchases_count': 40,
            'laravel_through_key': 178,
            'tickets': [
              {
                'id': 77,
                'name': 'Bungee Ticket',
                'price': 250,
                'pivot': {'coupon_id': 39, 'ticket_id': 77},
              },
            ],
            'promotions': [],
          },
        ),
      );

      final coupon = model.coupon!;
      expect(coupon.appliesOn, isNull);
      expect(coupon.tickets.single.id, 77);
      expect(coupon.tickets.single.name, 'Bungee Ticket');
    });

    test('parses a held coupon whose definition is gone', () {
      final model = CouponModel.fromJson(_couponRow(id: 166, facilityId: 157, coupon: null));

      expect(model.id, 166);
      expect(model.coupon, isNull);
    });

    test('tolerates missing optional definition fields', () {
      final model = CouponModel.fromJson({
        'id': 386,
        'name': '10%',
        'type': 'coupon',
        'coupon': {
          'id': 69,
          'discount_ratio': 10,
          'unlimited': false,
          'facility_id': 173,
          'tickets': null,
        },
      });

      final coupon = model.coupon!;
      expect(coupon.appliesOn, isNull);
      expect(coupon.status, isNull);
      expect(coupon.validityDays, isNull);
      expect(coupon.laravelThroughKey, isNull);
      expect(coupon.tickets, isEmpty);
      expect(coupon.promotions, isEmpty);
    });
  });
}
