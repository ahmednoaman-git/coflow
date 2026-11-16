import 'package:coflow_users_v2/core/core.dart';

/// The checkout quote refused the coupon on the purchase.
class CouponRejectedFailure extends ValidationFailure {
  const CouponRejectedFailure(super.message, {super.exception});
}
