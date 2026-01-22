import 'package:json_annotation/json_annotation.dart';

part 'facility_ticket_model.g.dart';

/// Facility ticket model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityTicketModel {
  const FacilityTicketModel({
    required this.id,
    required this.name,
    required this.price,
    this.discountPrice,
    required this.currency,
    required this.facilityId,
    required this.servicesCount,
  });

  final int id;
  final String name;
  final double price;

  @JsonKey(name: 'discount_price')
  final double? discountPrice;

  final String currency;

  @JsonKey(name: 'facility_id')
  final int facilityId;

  @JsonKey(name: 'services_count')
  final int servicesCount;

  factory FacilityTicketModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityTicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityTicketModelToJson(this);
}
