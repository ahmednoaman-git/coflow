import 'package:coflow_users_v2/core/core.dart';
import 'package:dio/dio.dart';

import '../../domain/domain.dart';
import '../models/models.dart';

abstract final class PurchaseMapper {
  static PurchaseQuoteEntity quote(PurchaseQuoteModel model) => PurchaseQuoteEntity(
    totalPrice: model.totalPrice,
    finalPrice: model.finalPrice,
    couponDiscount: model.discountCoupon,
    addOnsPrice: model.addonsPrice,
    currency: model.currency,
  );

  static PurchaseReceiptEntity receipt(PurchaseReceiptModel model) =>
      PurchaseReceiptEntity(id: model.id);

  /// Tells a quote refused over its coupon apart from any other failure, so
  /// checkout can drop the coupon instead of stalling on the error.
  ///
  /// The API answers 422 with a `coupon_id` error when the coupon does not
  /// cover the item, and 404 when it is another facility's. A 404 counts only
  /// when a coupon was sent: checkout has quoted the item without one first,
  /// so the item itself exists.
  static Failure quoteFailure(Failure failure, SubmitPurchaseDto dto) {
    if (dto.couponId == null) return failure;

    final refusedCoupon = switch (failure) {
      ValidationFailure(exception: DioException(response: Response(:final data))) =>
        data is Map && data['errors'] is Map && (data['errors'] as Map).containsKey('coupon_id'),
      NotFoundFailure() => true,
      _ => false,
    };
    return refusedCoupon
        ? CouponRejectedFailure(failure.message, exception: failure.exception)
        : failure;
  }
}
