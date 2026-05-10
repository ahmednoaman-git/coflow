import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FacilityPromotionModel JSON parsing', () {
    test('parses promotion ticket lines when unlimited is sent as 0 or 1', () {
      final model = FacilityPromotionModel.fromJson({
        'id': 127,
        'name': 'No3manTest Package 1',
        'price': 1600,
        'discount_price': 1300,
        'discount_ratio': null,
        'type': 'package',
        'end_date': '2026-05-31',
        'gift': null,
        'currency': 'EGP',
        'has_like': false,
        'tickets': [
          {
            'count': 3,
            'unlimited': 0,
            'ticket_id': 56,
            'ticket': {'id': 56, 'name': 'GO TICKET'},
          },
          {
            'count': null,
            'unlimited': 1,
            'ticket_id': 57,
            'ticket': {'id': 57, 'name': 'GO TICKET 2'},
          },
        ],
        'get_tickets': [],
        'coupons': [],
        'offer': null,
        'editable': true,
      });

      expect(model.tickets, hasLength(2));
      expect(model.tickets!.first.unlimited, isFalse);
      expect(model.tickets!.last.unlimited, isTrue);
    });

    test('parses coupon unlimited values sent as bool or int', () {
      final model = FacilityPromotionModel.fromJson({
        'id': 134,
        'name': 'No3manTest Buy & Get Coupon 1',
        'price': 1500,
        'discount_price': 1000,
        'discount_ratio': null,
        'type': 'buy_get',
        'end_date': '2026-05-31',
        'gift': null,
        'currency': 'EGP',
        'has_like': false,
        'tickets': [],
        'get_tickets': [],
        'coupons': [
          {
            'discount_ratio': 20,
            'unlimited': true,
            'applies_on': 'tickets',
          },
          {
            'discount_ratio': 30,
            'unlimited': 1,
            'applies_on': 'tickets',
          },
        ],
        'offer': null,
        'editable': true,
      });

      expect(model.coupons, hasLength(2));
      expect(model.coupons!.first.unlimited, isTrue);
      expect(model.coupons!.last.unlimited, isTrue);
    });
  });
}
