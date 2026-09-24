import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// The customer's coupons that can discount one ticket or promotion.
@lazySingleton
class GetPurchaseCouponsUseCase {
  const GetPurchaseCouponsUseCase(this._repository);

  final CouponRepository _repository;

  /// `GET coupons` lists what the customer holds at every facility, one row
  /// per copy held, so this keeps the ones the purchase can take and lists a
  /// coupon held twice once — both copies go by the same `coupon_id`.
  AsyncTask<List<PurchaseCouponEntity>> call(GetPurchaseCouponsDto dto) =>
      _repository.getCoupons(dto).map((coupons) {
        final usable = <int, PurchaseCouponEntity>{};
        for (final coupon in coupons) {
          final applies = coupon.appliesTo(
            facilityId: dto.facilityId,
            subjectType: dto.subjectType,
            subjectId: dto.subjectId,
          );
          if (applies) usable.putIfAbsent(coupon.id, () => coupon);
        }
        return usable.values.toList(growable: false);
      });
}
