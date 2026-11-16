import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_ticket_entity.freezed.dart';

/// Facility ticket shown in the Pricing tab.
@freezed
abstract class FacilityTicketEntity with _$FacilityTicketEntity {
  const factory FacilityTicketEntity({
    required int id,
    required String name,
    required int servicesCount,
    required double originalPrice,

    /// What the ticket sells for when it is reduced — by its own discount or
    /// an active discount promotion. Null when it sells at full price.
    double? discountPrice,

    required String currency,
  }) = _FacilityTicketEntity;
}
