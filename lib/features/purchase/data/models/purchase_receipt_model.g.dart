// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseReceiptModel _$PurchaseReceiptModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PurchaseReceiptModel', json, ($checkedConvert) {
  final val = PurchaseReceiptModel(
    id: $checkedConvert('id', (v) => PurchaseReceiptModel._purchaseId(v)),
  );
  return val;
});

Map<String, dynamic> _$PurchaseReceiptModelToJson(
  PurchaseReceiptModel instance,
) => <String, dynamic>{'id': instance.id};
