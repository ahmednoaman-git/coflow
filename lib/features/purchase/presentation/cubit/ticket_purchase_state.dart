import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_purchase_state.freezed.dart';

@freezed
abstract class TicketPurchaseState with _$TicketPurchaseState {
  const TicketPurchaseState._();

  const factory TicketPurchaseState({
    required FacilityTicketDetailsEntity ticket,
    required CollapsedFacilityEntity facility,
    required Color accentColor,
    @Default(<int>{}) Set<int> selectedAddOnIds,
    @Default(1) int quantity,
    PurchaseCouponEntity? selectedCoupon,
    @Default(AsyncState.idle()) AsyncState<List<PurchaseCouponEntity>> couponsRequest,
  }) = _TicketPurchaseState;

  List<AddOnEntity> get selectedAddOns =>
      ticket.addOns.where((addOn) => selectedAddOnIds.contains(addOn.id)).toList(growable: false);

  PurchaseInvoiceEntity get invoice => PurchaseInvoiceCalculator.compute(
    currency: ticket.currency,
    itemLabel: ticket.name,
    unitPrice: ticket.totalPrice,
    quantity: quantity,
    selectedAddOns: selectedAddOns
        .map((addOn) => (name: addOn.name, unitPrice: addOn.price))
        .toList(growable: false),
    coupon: selectedCoupon,
    paymentType: facility.paymentType,
    depositRatio: kPlaceholderDepositRatio,
  );
}
