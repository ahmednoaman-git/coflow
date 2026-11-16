import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/my_purchases/data/mappers/user_purchase_mapper.dart';
import 'package:coflow_users_v2/features/my_purchases/data/models/models.dart';
import 'package:coflow_users_v2/features/my_purchases/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

/// Rows trimmed from real `apiApp` responses (test API, Nov 2026).
Map<String, dynamic> _facility({int id = 83, String name = 'Asar Academy'}) => {
  'id': id,
  'name': name,
  'title': 'Equestrian Academy',
  'logo': 'https://example.test/logo.png',
  'views': 85,
  'facility_type': 'PRO',
  'status': 'visible',
  'subscription': 'active',
  'payment_type': 'full online',
  'activity_line_id': 3,
  'tags': <Object>[],
};

Map<String, dynamic> _ticket({
  int id = 674,
  String name = 'test',
  int? quantity = 1,
  int used = 0,
  bool unlimited = false,
  int? validityDays = 15,
  String status = 'valid',
  List<String> services = const ['Horse Riding Level 1', 'Free Ride'],
}) => {
  'id': id,
  'name': name,
  'quantity': quantity,
  'unlimited': unlimited,
  'used': used,
  'final_price': 2000,
  'expire_date': '2026-11-14',
  'status': status,
  'ticket': {'validity_days': validityDays, 'unlimited': unlimited},
  'services': [
    for (final service in services) {'id': 1, 'name': service},
  ],
};

Map<String, dynamic> _row({
  int id = 775,
  String type = 'ticket',
  String status = 'due',
  bool gift = false,
  num price = 300,
  num addonsPrice = 0,
  num discountCoupon = 0,
  num? finalPrice,
  num refund = 0,
  List<Map<String, dynamic>>? tickets,
  List<Map<String, dynamic>> addons = const [],
  List<Map<String, dynamic>>? payments,
  Object? facility,
  Map<String, dynamic>? promotion,
  Map<String, dynamic>? coupon,
  Map<String, dynamic>? relatedPurchase,
  Map<String, dynamic>? couponPurchase,
}) {
  final total = price + addonsPrice;
  final owed = finalPrice ?? total - discountCoupon;
  return {
    'id': id,
    'name': 'test',
    'type': type,
    'price': price,
    'discount_offer': 0,
    'discount_coupon': discountCoupon,
    'quantity': 1,
    'used': 1,
    'total_price': total,
    'addons_price': addonsPrice,
    'final_price': owed,
    'paid': 0,
    'remain': owed,
    'refund': refund,
    'gift': gift,
    'expire_date': null,
    'status': status,
    'action': 'purchase',
    'facility_id': 83,
    'created_at': '2026-09-23T20:36:21.000000Z',
    'currency': 'EGP',
    'facility': facility ?? _facility(),
    'tickets': tickets ?? [_ticket()],
    'addons': addons,
    'promotion': promotion,
    'payments':
        payments ??
        [
          {'amount': owed, 'status': 'due', 'created_at': '2026-09-23T20:36:21.000000Z'},
        ],
    'coupon': coupon,
    'related_purchase': relatedPurchase,
    'coupon_purchase': couponPurchase,
  };
}

UserPurchaseEntity _map(Map<String, dynamic> json) =>
    UserPurchaseMapper.toEntity(UserPurchaseModel.fromJson(json));

void main() {
  group('PurchaseStatus.fromApi', () {
    test('maps every status the API sends', () {
      expect(PurchaseStatus.fromApi('due'), PurchaseStatus.due);
      expect(PurchaseStatus.fromApi('paid'), PurchaseStatus.paid);
      expect(PurchaseStatus.fromApi('completed_paid'), PurchaseStatus.completedPaid);
      expect(PurchaseStatus.fromApi('completed_due'), PurchaseStatus.completedDue);
      expect(PurchaseStatus.fromApi('expiration'), PurchaseStatus.expired);
      expect(PurchaseStatus.fromApi('expiration_due'), PurchaseStatus.expiredDue);
      expect(PurchaseStatus.fromApi('expiration_paid'), PurchaseStatus.expiredPaid);
      expect(PurchaseStatus.fromApi('refund'), PurchaseStatus.refunded);
      expect(PurchaseStatus.fromApi('used'), PurchaseStatus.used);
      expect(PurchaseStatus.fromApi('gift'), PurchaseStatus.gift);
    });

    test('anything else is unknown', () {
      expect(PurchaseStatus.fromApi('fop'), PurchaseStatus.unknown);
      expect(PurchaseStatus.fromApi(null), PurchaseStatus.unknown);
    });
  });

  group('badge and payment state', () {
    test('a due row with nothing paid is DUE', () {
      final purchase = _map(_row());
      expect(purchase.paymentState, PurchasePaymentState.due);
      expect(purchase.badge, PurchaseBadge.due);
    });

    test('a paid status is PAID even though paid/remain were never updated (F3)', () {
      final purchase = _map(_row(status: 'paid'));
      expect(purchase.paymentState, PurchasePaymentState.paid);
      expect(purchase.badge, PurchaseBadge.paid);
    });

    test('a due status whose ledger covers the amount is PAID', () {
      final purchase = _map(
        _row(
          payments: [
            {'amount': 300, 'status': 'due'},
            {'amount': 300, 'status': 'paid'},
          ],
        ),
      );
      expect(purchase.paidAmount, 300);
      expect(purchase.badge, PurchaseBadge.paid);
    });

    test('a part-paid row is still DUE', () {
      final purchase = _map(
        _row(
          price: 225,
          addonsPrice: 50,
          payments: [
            {'amount': 275, 'status': 'due'},
            {'amount': 225, 'status': 'paid'},
          ],
        ),
      );
      expect(purchase.paymentState, PurchasePaymentState.due);
    });

    test('every expiration status is EXPIRED, keeping whether it was paid', () {
      expect(_map(_row(status: 'expiration')).badge, PurchaseBadge.expired);
      expect(_map(_row(status: 'expiration_due')).paymentState, PurchasePaymentState.due);
      final paid = _map(_row(status: 'expiration_paid'));
      expect(paid.badge, PurchaseBadge.expired);
      expect(paid.paymentState, PurchasePaymentState.paid);
    });

    test('refund is REFUNDED, full or partial against the final price', () {
      final full = _map(_row(status: 'refund', price: 1000, refund: 1000));
      expect(full.badge, PurchaseBadge.refunded);
      expect(full.refundExtent, PurchaseRefundExtent.full);

      final partial = _map(_row(status: 'refund', price: 27, refund: 15));
      expect(partial.refundExtent, PurchaseRefundExtent.partial);
    });

    test('a fully used but unpaid row (completed_due) is DUE', () {
      final purchase = _map(
        _row(status: 'completed_due', tickets: [_ticket(quantity: 0, used: 2)]),
      );
      expect(purchase.paymentState, PurchasePaymentState.due);
      expect(purchase.badge, PurchaseBadge.due);
      expect(purchase.canCancel, isFalse);
    });

    test('unknown and used statuses get no chip (F5)', () {
      expect(_map(_row(status: 'fop')).badge, isNull);
      expect(_map(_row(status: 'used', gift: true, price: 0)).badge, isNull);
    });

    test('a free gift owes nothing', () {
      final gift = _map(_row(type: 'coupon', gift: true, price: 0, tickets: []));
      expect(gift.paymentState, PurchasePaymentState.free);
      expect(gift.badge, isNull);
    });
  });

  group('canCancel', () {
    test('only while due, unpaid and no ticket reserved', () {
      expect(_map(_row()).canCancel, isTrue);
    });

    test('not once a ticket is reserved', () {
      expect(_map(_row(tickets: [_ticket(used: 1)])).canCancel, isFalse);
    });

    test('not once anything is paid', () {
      final partlyPaid = _row(
        payments: [
          {'amount': 300, 'status': 'due'},
          {'amount': 100, 'status': 'paid'},
        ],
      );
      expect(_map(partlyPaid).canCancel, isFalse);
      expect(_map(_row(status: 'paid')).canCancel, isFalse);
    });

    test('not when the row came without its tickets (F2)', () {
      expect(_map(_row(tickets: [])).canCancel, isFalse);
    });
  });

  group('tickets', () {
    test('reads quantity as what is left: bought = left + used (F4, verified live)', () {
      // Bought 12, 2 used: the API sends quantity 10, used 2.
      final ticket = _map(_row(tickets: [_ticket(quantity: 10, used: 2)])).tickets.single;
      expect(ticket.quantity, 10);
      expect(ticket.used, 2);
      expect(ticket.bought, 12);
      expect(ticket.iconCount, 12);
      expect(ticket.usedIconCount, 2);
      expect(ticket.remaining, 10);
      expect(ticket.isUsedUp, isFalse);
      expect(ticket.validityDays, 15);
      expect(ticket.accessNames, ['Horse Riding Level 1', 'Free Ride']);
    });

    test('is used up once nothing is left', () {
      final ticket = _map(_row(tickets: [_ticket(quantity: 0, used: 2)])).tickets.single;
      expect(ticket.bought, 2);
      expect(ticket.iconCount, 2);
      expect(ticket.usedIconCount, 2);
      expect(ticket.remaining, 0);
      expect(ticket.isUsedUp, isTrue);
    });

    test('an untouched ticket is neither used up nor reserved', () {
      final ticket = _map(_row(tickets: [_ticket(quantity: 3)])).tickets.single;
      expect(ticket.bought, 3);
      expect(ticket.isUsedUp, isFalse);
      expect(ticket.isUntouched, isTrue);
    });

    test('an unlimited ticket has one available glyph and no count', () {
      final ticket = _map(
        _row(tickets: [_ticket(quantity: null, unlimited: true, used: 1)]),
      ).tickets.single;
      expect(ticket.quantity, isNull);
      expect(ticket.iconCount, 1);
      expect(ticket.usedIconCount, 0);
      expect(ticket.remaining, isNull);
      expect(ticket.isUsedUp, isFalse);
    });

    test('flags a ticket the API marks expired', () {
      final ticket = _map(_row(tickets: [_ticket(status: 'expire')])).tickets.single;
      expect(ticket.isExpired, isTrue);
    });
  });

  group('money', () {
    test('reads amounts, add-ons and the refund date', () {
      final purchase = _map(
        _row(
          price: 600,
          addonsPrice: 200,
          discountCoupon: 80,
          status: 'refund',
          refund: 720,
          addons: [
            {'name': 'Add-On2', 'quantity': 2, 'final_price': 200},
          ],
          payments: [
            {'amount': 720, 'status': 'due', 'created_at': '2026-08-01T10:00:00.000000Z'},
            {'amount': 720, 'status': 'refund', 'created_at': '2026-08-05T10:00:00.000000Z'},
          ],
        ),
      );
      expect(purchase.price, 600);
      expect(purchase.totalPrice, 800);
      expect(purchase.couponDiscount, 80);
      expect(purchase.finalPrice, 720);
      expect(
        purchase.addOns.single,
        const PurchasedAddOnEntity(name: 'Add-On2', quantity: 2, price: 200),
      );
      expect(purchase.refundedAt, DateTime.utc(2026, 8, 5, 10).toLocal());
    });
  });

  group('promotion and facility', () {
    final buyGetPromotion = {
      'id': 211,
      'name': 'Buy & Get 2',
      'type': 'buy_get',
      'end_date': '2027-01-01',
      'validity_days': 30,
      'price': 100,
      'currency': 'EGP',
      'buy_get_type': 'coupon',
      'tickets': [
        {
          'count': 1,
          'unlimited': 0,
          'ticket_id': 108,
          'ticket': {'id': 108, 'name': 'Indoor Climbing'},
        },
      ],
      'get_tickets': <Object>[],
      'coupons': [
        {'discount_ratio': 20, 'applies_on': 'promotions', 'unlimited': false},
      ],
    };

    test('maps a Buy & Get promotion for "Promotion Information"', () {
      final purchase = _map(_row(type: 'buy_get', promotion: buyGetPromotion));
      expect(purchase.kind, PurchaseKind.buyGet);
      expect(purchase.promotionName, 'Buy & Get 2');
      expect(purchase.promotionValidityDays, 30);
      final promotion = purchase.promotion! as FacilityPromotionBuyGetEntity;
      expect(promotion.buyTickets.single.name, 'Indoor Climbing');
      expect(promotion.reward, isA<FacilityPromotionCouponRewardEntity>());
    });

    test('drops a promotion the facility mapper rejects instead of the row', () {
      final broken = {...buyGetPromotion, 'coupons': <Object>[]};
      final purchase = _map(_row(type: 'buy_get', promotion: broken));
      expect(purchase.promotion, isNull);
      expect(purchase.promotionName, 'test');
    });

    test('keeps the row when its facility record does not parse', () {
      final purchase = _map(_row(facility: {'id': 83}));
      expect(purchase.facility, isNull);
      expect(purchase.facilityId, 83);
    });

    test('maps the facility for its logo and profile', () {
      final purchase = _map(_row());
      expect(purchase.facility?.id, 83);
      expect(purchase.facility?.logoUrl, 'https://example.test/logo.png');
      expect(purchase.facilityName, 'Asar Academy');
    });
  });

  group('gifted coupons', () {
    test('reads the coupon, its source promotion and the purchase it was applied to', () {
      final purchase = _map(
        _row(
          id: 787,
          type: 'coupon',
          gift: true,
          price: 0,
          tickets: [],
          coupon: {
            'discount_ratio': 20,
            'unlimited': false,
            'validity_days': 30,
            'applies_on': 'promotions',
            'tickets': <Object>[],
            'promotions': [
              {'id': 211, 'name': 'Buy & Get 2'},
            ],
          },
          relatedPurchase: _row(id: 786, type: 'buy_get'),
          couponPurchase: _row(id: 565, price: 600, discountCoupon: 80),
        ),
      );

      expect(purchase.isGift, isTrue);
      expect(purchase.kind, PurchaseKind.coupon);
      expect(purchase.coupon?.discountRatio, 20);
      expect(purchase.coupon?.scope, CouponScope.promotions);
      expect(purchase.coupon?.targetNames, ['Buy & Get 2']);
      expect(purchase.coupon?.appliesToAll, isFalse);
      expect(purchase.sourcePurchase?.id, 786);
      expect(purchase.appliedPurchase?.finalPrice, 520);
      expect(purchase.canCancel, isFalse);
    });

    test('a scope with no targets applies to all (F6)', () {
      final coupon = _map(
        _row(
          type: 'coupon',
          gift: true,
          tickets: [],
          coupon: {'discount_ratio': 10, 'applies_on': 'purchases'},
        ),
      ).coupon!;
      expect(coupon.appliesToAll, isTrue);
      expect(coupon.hasScope, isTrue);
    });

    test('an older coupon with no scope shows nothing under "Applies on"', () {
      final coupon = _map(
        _row(type: 'coupon', gift: true, tickets: [], coupon: {'discount_ratio': 10}),
      ).coupon!;
      expect(coupon.scope, CouponScope.unknown);
      expect(coupon.hasScope, isFalse);
    });
  });

  group('fromGroups', () {
    test('flattens the per-facility groups, stamping each row with its facility', () {
      final groups = [
        PurchaseFacilityGroupModel.fromJson({
          'id': 191,
          'name': 'Flow Profile',
          'purchases': [_row(id: 1), _row(id: 2)],
        }),
        PurchaseFacilityGroupModel.fromJson({
          'id': 194,
          'name': 'CLYMB Abu Dhabi',
          'purchases': [_row(id: 3)],
        }),
      ];

      final rows = UserPurchaseMapper.fromGroups(groups);
      expect(rows.map((row) => row.id), [1, 2, 3]);
      expect(rows.map((row) => row.facilityId), [191, 191, 194]);
      expect(rows.last.facilityName, 'CLYMB Abu Dhabi');
      expect(rows.every((row) => !row.isFacilityPreview), isTrue);
    });

    test("previews the facility of a gift row, which carries no record, from the group's tags", () {
      final gift = {..._row(type: 'coupon', gift: true, tickets: []), 'facility': null};
      final rows = UserPurchaseMapper.fromGroups([
        PurchaseFacilityGroupModel.fromJson({
          'id': 194,
          'name': 'CLYMB Abu Dhabi',
          'tags': [
            {'id': 118, 'name': 'Rock Climbing', 'activity_line_id': 3},
          ],
          'purchases': [gift],
        }),
      ]);

      final row = rows.single;
      expect(row.isFacilityPreview, isTrue);
      expect(row.facility?.id, 194);
      expect(row.facility?.name, 'CLYMB Abu Dhabi');
      expect(row.facility?.activityLine.id, 3);
    });

    test('leaves the facility out when nothing says its activity line', () {
      final gift = {..._row(type: 'coupon', gift: true, tickets: []), 'facility': null};
      final rows = UserPurchaseMapper.fromGroups([
        PurchaseFacilityGroupModel.fromJson({
          'id': 194,
          'name': 'CLYMB',
          'purchases': [gift],
        }),
      ]);
      expect(rows.single.facility, isNull);
      expect(rows.single.isFacilityPreview, isFalse);
    });
  });
}
