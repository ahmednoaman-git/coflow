import 'package:coflow_users_v2/core/async/async.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

/// Coupon repository contract.
abstract interface class CouponRepository {
  AsyncTask<List<PurchaseCouponEntity>> getCoupons(GetPurchaseCouponsDto dto);
}
