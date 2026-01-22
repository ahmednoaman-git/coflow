import 'package:json_annotation/json_annotation.dart';

part 'facility_ticket_details_model.g.dart';

/// Ticket details response model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityTicketDetailsModel {
  const FacilityTicketDetailsModel({
    required this.ticket,
    this.coupons,
  });

  final TicketDetailModel ticket;

  // Kept for forward compatibility (coupons exist in old API response).
  final List<CouponPlaceholderModel>? coupons;

  factory FacilityTicketDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityTicketDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityTicketDetailsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class TicketDetailModel {
  const TicketDetailModel({
    required this.id,
    required this.name,
    required this.unlimited,
    this.validityDays,
    required this.price,
    this.discountPrice,
    required this.currency,
    this.conditions,
    this.requirements,
    this.services,
    this.addons,
  });

  final int id;
  final String name;
  final bool unlimited;

  @JsonKey(name: 'validity_days')
  final int? validityDays;

  final double price;

  @JsonKey(name: 'discount_price')
  final double? discountPrice;

  final String currency;

  final String? conditions;
  final String? requirements;

  @JsonKey(defaultValue: <ServiceModel>[], disallowNullValue: true)
  final List<ServiceModel>? services;

  @JsonKey(defaultValue: <AddonModel>[], disallowNullValue: true)
  final List<AddonModel>? addons;

  factory TicketDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TicketDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDetailModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class ServiceModel {
  const ServiceModel({
    required this.id,
    required this.name,
    this.image,
    this.pivot,
  });

  final int id;
  final String name;

  // API field is `image`.
  final String? image;

  final PivotModel? pivot;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class PivotModel {
  const PivotModel({
    this.ticketId,
    this.serviceId,
  });

  @JsonKey(name: 'ticket_id')
  final int? ticketId;

  @JsonKey(name: 'service_id')
  final int? serviceId;

  factory PivotModel.fromJson(Map<String, dynamic> json) => _$PivotModelFromJson(json);

  Map<String, dynamic> toJson() => _$PivotModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class AddonModel {
  const AddonModel({
    required this.id,
    required this.name,
    required this.price,
  });

  final int id;
  final String name;
  final double price;

  factory AddonModel.fromJson(Map<String, dynamic> json) => _$AddonModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddonModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class CouponPlaceholderModel {
  const CouponPlaceholderModel({required this.id});

  final int id;

  factory CouponPlaceholderModel.fromJson(Map<String, dynamic> json) =>
      _$CouponPlaceholderModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponPlaceholderModelToJson(this);
}
