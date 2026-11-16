import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Every expectation below is the price `purchase-ticket/validate` quoted on
  // the test API (2026-09-23), so the pricing screens show what checkout
  // charges.
  group('TicketPriceMapper.reducedPrice', () {
    test('an active offer comes off the full price', () {
      // Flying Yoga's Bungee Ticket: 250, no discount, 10% offer → 225.
      expect(TicketPriceMapper.reducedPrice(price: 250, discountPrice: 0, offerPercent: 10), 225);
    });

    test("an active offer replaces the ticket's own discount", () {
      // CLYMB's L2 Course: 10000 → 9999, 10% offer → 9000.
      expect(
        TicketPriceMapper.reducedPrice(price: 10000, discountPrice: 9999, offerPercent: 10),
        9000,
      );
      // CLYMB's L3 Course: 15000 → 12222, 10% offer → 13500, above the
      // discount price, but that is what the quote charges.
      expect(
        TicketPriceMapper.reducedPrice(price: 15000, discountPrice: 12222, offerPercent: 10),
        13500,
      );
    });

    test('without an offer the discount price applies', () {
      // Asar Academy's "test": 2000 → 300.
      expect(TicketPriceMapper.reducedPrice(price: 2000, discountPrice: 300), 300);
    });

    test('a zero discount price is no discount', () {
      expect(TicketPriceMapper.reducedPrice(price: 250, discountPrice: 0), isNull);
      expect(TicketPriceMapper.reducedPrice(price: 250), isNull);
    });

    test('has_discount false overrides a stale discount price', () {
      expect(
        TicketPriceMapper.reducedPrice(price: 500, discountPrice: 400, hasDiscount: false),
        isNull,
      );
    });
  });

  group('ticket mappers', () {
    test('a Pricing-tab ticket is shown at its offer price', () {
      final entity = FacilityTicketMapper.toEntity(
        FacilityTicketModel.fromJson({
          'id': 77,
          'name': 'Bungee Ticket',
          'price': 250,
          'discount_price': 0,
          'currency': 'EGP',
          'facility_id': 157,
          'services_count': 1,
          'type': 'flow',
          'offer': 10,
          'editable': false,
          'get_gift': null,
        }),
      );

      expect(entity.originalPrice, 250);
      expect(entity.discountPrice, 225);
    });

    test('a ticket without a discount or offer sells at full price', () {
      final entity = FacilityTicketMapper.toEntity(
        FacilityTicketModel.fromJson({
          'id': 111,
          'name': 'L4 Course',
          'price': 20000,
          'discount_price': 0,
          'currency': 'EGP',
          'facility_id': 194,
          'services_count': 1,
          'offer': null,
        }),
      );

      expect(entity.discountPrice, isNull);
    });

    test('ticket details carry the same price', () {
      final entity = FacilityTicketDetailsMapper.toEntity(
        FacilityTicketDetailsModel.fromJson({
          'ticket': {
            'id': 107,
            'name': 'Indoor Skydiving',
            'unlimited': false,
            'validity_days': 15,
            'price': 100,
            'has_discount': true,
            'discount_price': 99,
            'currency': r'$',
            'offer': 10,
            'services': [],
            'addons': [
              {'id': 73, 'name': 'Video', 'price': 10, 'ticket_id': 107},
            ],
          },
          'coupons': [],
        }),
      );

      expect(entity.price, 100);
      expect(entity.discountPrice, 90);
      expect(entity.priceText(), r'$ 90');
      expect(entity.addOns.single.price, 10);
    });
  });
}
