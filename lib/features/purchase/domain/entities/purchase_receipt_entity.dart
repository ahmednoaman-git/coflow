import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_receipt_entity.freezed.dart';

/// A backend-persisted purchase, rather than a payment authorization.
@freezed
abstract class PurchaseReceiptEntity with _$PurchaseReceiptEntity {
  const factory PurchaseReceiptEntity({required int id}) = _PurchaseReceiptEntity;
}
