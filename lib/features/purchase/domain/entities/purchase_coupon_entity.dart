import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_coupon_entity.freezed.dart';

/// A coupon applicable to a ticket/promotion purchase.
@freezed
abstract class PurchaseCouponEntity with _$PurchaseCouponEntity {
  const PurchaseCouponEntity._();

  const factory PurchaseCouponEntity({
    required int id,
    required String name,
    required double discountRatio,
  }) = _PurchaseCouponEntity;

  String get percentText => '${_formatRatio(discountRatio)}%';
}

String _formatRatio(double value) {
  if (value == value.roundToDouble()) {
    return value.toStringAsFixed(0);
  }

  return value.toStringAsFixed(2).replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
}
