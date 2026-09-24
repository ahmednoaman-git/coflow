import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

class _Repository implements CouponRepository {
  _Repository(this.coupons);

  final List<PurchaseCouponEntity> coupons;

  @override
  AsyncTask<List<PurchaseCouponEntity>> getCoupons(GetPurchaseCouponsDto dto) =>
      TaskEither.right(coupons);
}

// What the test user held on 2026-09-23: PRO Profile's 10% on any purchase,
// and CLYMB's 100% on tickets, held twice.
const _proProfilePurchases = PurchaseCouponEntity(
  id: 71,
  facilityId: 184,
  discountRatio: 10,
  coversAllTickets: true,
  coversAllPromotions: true,
);
const _clymbTickets = PurchaseCouponEntity(
  id: 76,
  facilityId: 194,
  discountRatio: 100,
  coversAllTickets: true,
);
const _clymbPackage = PurchaseCouponEntity(
  id: 80,
  facilityId: 194,
  discountRatio: 20,
  promotions: [(id: 206, name: 'Package 1')],
);

Future<List<PurchaseCouponEntity>> _usable(
  GetPurchaseCouponsDto dto, [
  List<PurchaseCouponEntity> held = const [
    _proProfilePurchases,
    _clymbTickets,
    _clymbTickets,
    _clymbPackage,
  ],
]) async {
  final result = await GetPurchaseCouponsUseCase(_Repository(held))(dto).run();
  return result.getOrElse((failure) => fail(failure.message));
}

void main() {
  group('GetPurchaseCouponsUseCase', () {
    test("drops other facilities' coupons and lists a coupon held twice once", () async {
      final coupons = await _usable(
        const GetPurchaseCouponsDto(
          facilityId: 194,
          subjectType: PurchaseSubjectType.ticket,
          subjectId: 109,
        ),
      );

      expect(coupons, [_clymbTickets]);
    });

    test('keeps only coupons that cover the promotion', () async {
      final package = await _usable(
        const GetPurchaseCouponsDto(
          facilityId: 194,
          subjectType: PurchaseSubjectType.promotion,
          subjectId: 206,
        ),
      );
      final buyGet = await _usable(
        const GetPurchaseCouponsDto(
          facilityId: 194,
          subjectType: PurchaseSubjectType.promotion,
          subjectId: 207,
        ),
      );

      expect(package, [_clymbPackage]);
      expect(buyGet, isEmpty);
    });

    test('a purchases coupon covers tickets and promotions alike', () async {
      final ticket = await _usable(
        const GetPurchaseCouponsDto(
          facilityId: 184,
          subjectType: PurchaseSubjectType.ticket,
          subjectId: 1,
        ),
      );
      final promotion = await _usable(
        const GetPurchaseCouponsDto(
          facilityId: 184,
          subjectType: PurchaseSubjectType.promotion,
          subjectId: 2,
        ),
      );

      expect(ticket, [_proProfilePurchases]);
      expect(promotion, [_proProfilePurchases]);
    });
  });
}
