import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_purchase_state.freezed.dart';

@freezed
abstract class PromotionPurchaseState with _$PromotionPurchaseState {
  const PromotionPurchaseState._();

  const factory PromotionPurchaseState({
    required FacilityPromotionDetailsEntity promotion,
    required CollapsedFacilityEntity facility,
    required Color accentColor,
    @Default(1) int quantity,
    PurchaseCouponEntity? selectedCoupon,
    @Default(AsyncState.idle()) AsyncState<List<PurchaseCouponEntity>> couponsRequest,
  }) = _PromotionPurchaseState;

  double get _unitPrice => switch (promotion.promotion) {
    FacilityPromotionPackageEntity(:final displayPrice) => displayPrice,
    FacilityPromotionBuyGetEntity(:final displayPrice) => displayPrice,
    FacilityPromotionDiscountEntity() => throw StateError(
      'Discount promotions are not purchasable.',
    ),
  };

  String get _currency => switch (promotion.promotion) {
    FacilityPromotionPackageEntity(:final currency) => currency,
    FacilityPromotionBuyGetEntity(:final currency) => currency,
    FacilityPromotionDiscountEntity() => throw StateError(
      'Discount promotions are not purchasable.',
    ),
  };

  PurchaseInvoiceEntity get invoice => PurchaseInvoiceCalculator.compute(
    currency: _currency,
    itemLabel: promotion.title,
    unitPrice: _unitPrice,
    quantity: quantity,
    selectedAddOns: const [],
    coupon: selectedCoupon,
    paymentType: facility.paymentType,
    depositRatio: kPlaceholderDepositRatio,
  );
}
