import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_invoice_entity.freezed.dart';

/// A single line item in a purchase invoice (base item or a selected add-on).
@freezed
abstract class PurchaseInvoiceLineEntity with _$PurchaseInvoiceLineEntity {
  const factory PurchaseInvoiceLineEntity({
    required String label,
    required int quantity,
    required double amount,
  }) = _PurchaseInvoiceLineEntity;
}

/// The computed invoice breakdown for a ticket/promotion purchase.
@freezed
abstract class PurchaseInvoiceEntity with _$PurchaseInvoiceEntity {
  const PurchaseInvoiceEntity._();

  const factory PurchaseInvoiceEntity({
    required String currency,
    required List<PurchaseInvoiceLineEntity> lines,
    required double subtotal,
    required double couponDiscount,
    required double total,
    double? depositAmount,
  }) = _PurchaseInvoiceEntity;

  bool get hasCouponDiscount => couponDiscount > 0;

  bool get hasDeposit => depositAmount != null;
}
