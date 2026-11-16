import 'package:freezed_annotation/freezed_annotation.dart';

import 'purchase_status.dart';

part 'gift_coupon_entity.freezed.dart';

/// The coupon a gift grants.
@freezed
abstract class GiftCouponEntity with _$GiftCouponEntity {
  const factory GiftCouponEntity({
    /// The discount, in percent.
    required double discountRatio,
    int? validityDays,
    @Default(false) bool unlimited,
    @Default(CouponScope.unknown) CouponScope scope,

    /// The tickets or promotions it is limited to.
    @Default(<String>[]) List<String> targetNames,
  }) = _GiftCouponEntity;

  const GiftCouponEntity._();

  /// Whether it applies to everything in [scope]: the API lists no targets
  /// (agreed reading of brief F6 until the backend confirms).
  bool get appliesToAll => targetNames.isEmpty && scope != CouponScope.unknown;

  /// Whether there is anything to show under "Applies on".
  bool get hasScope => targetNames.isNotEmpty || appliesToAll;
}
