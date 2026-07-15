import 'package:coflow_users_v2/features/purchase/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CouponMapper', () {
    test('maps a coupon model to its entity', () {
      const model = CouponModel(
        id: 386,
        name: '10%',
        type: 'coupon',
        coupon: CouponDetailsModel(
          id: 69,
          discountRatio: 10,
          unlimited: false,
          appliesOn: 'purchases',
          status: 'active',
          facilityId: 173,
          laravelThroughKey: 386,
        ),
      );

      final entity = CouponMapper.toEntity(model);

      expect(entity.id, 386);
      expect(entity.name, '10%');
      expect(entity.discountRatio, 10);
      expect(entity.percentText, '10%');
    });
  });
}
