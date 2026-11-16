import 'package:coflow_users_v2/features/purchase/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

CouponModel _held({
  int id = 750,
  String? appliesOn,
  List<CouponTargetModel> tickets = const [],
  List<CouponTargetModel> promotions = const [],
}) => CouponModel(
  id: id,
  name: '100%',
  type: 'coupon',
  coupon: CouponDetailsModel(
    id: 76,
    discountRatio: 100,
    unlimited: false,
    appliesOn: appliesOn,
    facilityId: 194,
    tickets: tickets,
    promotions: promotions,
  ),
);

void main() {
  group('CouponMapper', () {
    test('identifies the coupon by its own id, not the held copy', () {
      // Quotes answer 422 for the held copy's id (750) and accept 76.
      final entity = CouponMapper.toEntity(_held(appliesOn: 'tickets'))!;

      expect(entity.id, 76);
      expect(entity.facilityId, 194);
      expect(entity.discountRatio, 100);
      expect(entity.percentText, '100%');
    });

    test('purchases covers every ticket and promotion', () {
      final entity = CouponMapper.toEntity(_held(appliesOn: 'purchases'))!;

      expect(entity.coversAllTickets, isTrue);
      expect(entity.coversAllPromotions, isTrue);
    });

    test('tickets with nothing listed covers every ticket only', () {
      final entity = CouponMapper.toEntity(_held(appliesOn: 'tickets'))!;

      expect(entity.coversAllTickets, isTrue);
      expect(entity.coversAllPromotions, isFalse);
    });

    test('a listed scope covers only what it lists', () {
      final entity = CouponMapper.toEntity(
        _held(
          appliesOn: 'promotions',
          promotions: const [CouponTargetModel(id: 206, name: ' Package 1 ')],
        ),
      )!;

      expect(entity.coversAllPromotions, isFalse);
      expect(entity.promotions, [(id: 206, name: 'Package 1')]);
    });

    test('no scope covers only the listed tickets', () {
      final entity = CouponMapper.toEntity(
        _held(tickets: const [CouponTargetModel(id: 77, name: 'Bungee Ticket')]),
      )!;

      expect(entity.coversAllTickets, isFalse);
      expect(entity.coversAllPromotions, isFalse);
      expect(entity.tickets, [(id: 77, name: 'Bungee Ticket')]);
    });

    test('drops a held coupon whose definition is gone', () {
      const model = CouponModel(id: 166, name: '80%', type: 'coupon');

      expect(CouponMapper.toEntity(model), isNull);
    });
  });
}
