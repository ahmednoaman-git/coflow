import 'package:json_annotation/json_annotation.dart';

part 'purchased_ticket_model.g.dart';

/// One ticket inside a purchase (`tickets[]` on a purchase row).
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class PurchasedTicketModel {
  const PurchasedTicketModel({
    required this.id,
    this.name,
    this.quantity,
    this.unlimited,
    this.used,
    this.expireDate,
    this.status,
    this.ticket,
    this.services = const [],
  });

  final int id;
  final String? name;

  /// How many are left — counts down as tickets are used; null on unlimited.
  final int? quantity;
  final bool? unlimited;
  final int? used;
  final DateTime? expireDate;

  /// `valid` or `expire`.
  final String? status;

  /// The ticket as the facility sells it — only its validity is read.
  final PurchasedTicketInfoModel? ticket;

  /// What the ticket gives access to: the sheet's Access chips.
  @JsonKey(defaultValue: <PurchasedServiceModel>[])
  final List<PurchasedServiceModel> services;

  factory PurchasedTicketModel.fromJson(Map<String, dynamic> json) =>
      _$PurchasedTicketModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class PurchasedTicketInfoModel {
  const PurchasedTicketInfoModel({this.validityDays, this.unlimited});

  final int? validityDays;
  final bool? unlimited;

  factory PurchasedTicketInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PurchasedTicketInfoModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class PurchasedServiceModel {
  const PurchasedServiceModel({this.name});

  final String? name;

  factory PurchasedServiceModel.fromJson(Map<String, dynamic> json) =>
      _$PurchasedServiceModelFromJson(json);
}
