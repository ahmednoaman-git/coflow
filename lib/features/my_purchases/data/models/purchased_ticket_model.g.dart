// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchased_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasedTicketModel _$PurchasedTicketModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PurchasedTicketModel', json, ($checkedConvert) {
  final val = PurchasedTicketModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String?),
    quantity: $checkedConvert('quantity', (v) => (v as num?)?.toInt()),
    unlimited: $checkedConvert('unlimited', (v) => v as bool?),
    used: $checkedConvert('used', (v) => (v as num?)?.toInt()),
    expireDate: $checkedConvert(
      'expire_date',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    status: $checkedConvert('status', (v) => v as String?),
    ticket: $checkedConvert(
      'ticket',
      (v) => v == null ? null : PurchasedTicketInfoModel.fromJson(v as Map<String, dynamic>),
    ),
    services: $checkedConvert(
      'services',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => PurchasedServiceModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    ),
  );
  return val;
}, fieldKeyMap: const {'expireDate': 'expire_date'});

PurchasedTicketInfoModel _$PurchasedTicketInfoModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PurchasedTicketInfoModel',
  json,
  ($checkedConvert) {
    final val = PurchasedTicketInfoModel(
      validityDays: $checkedConvert(
        'validity_days',
        (v) => (v as num?)?.toInt(),
      ),
      unlimited: $checkedConvert('unlimited', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {'validityDays': 'validity_days'},
);

PurchasedServiceModel _$PurchasedServiceModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PurchasedServiceModel', json, ($checkedConvert) {
  final val = PurchasedServiceModel(
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});
