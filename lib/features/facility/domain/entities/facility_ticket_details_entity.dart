import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_ticket_details_entity.freezed.dart';

@freezed
abstract class AddOnEntity with _$AddOnEntity {
  const factory AddOnEntity({
    required int id,
    required String name,
    required double price,
  }) = _AddOnEntity;
}

@freezed
abstract class ServiceEntity with _$ServiceEntity {
  const factory ServiceEntity({
    required int id,
    required String name,
    required String? imageUrl,
  }) = _ServiceEntity;
}

/// Ticket details entity for the ticket details bottom sheet.
@freezed
abstract class FacilityTicketDetailsEntity with _$FacilityTicketDetailsEntity {
  const FacilityTicketDetailsEntity._();

  const factory FacilityTicketDetailsEntity({
    required int id,
    required String name,
    required double price,
    double? discountPrice,
    required String currency,
    required bool unlimited,
    int? validityDays,
    @Default(<AddOnEntity>[]) List<AddOnEntity> addOns,
    @Default(<ServiceEntity>[]) List<ServiceEntity> services,
    @Default('') String conditions,
    @Default('') String requirements,
  }) = _FacilityTicketDetailsEntity;

  double get totalPrice => discountPrice ?? price;

  List<String> get accessList => services.map((s) => s.name).toList(growable: false);

  String priceText({double? value}) {
    final v = value ?? totalPrice;
    return '$currency $v';
  }

  String validityText(AppLocalizations l10n) {
    if (unlimited && validityDays == null) {
      return l10n.facilityDetails_unlimited;
    }

    final days = validityDays;
    if (days == null) {
      return l10n.facilityDetails_unknown;
    }

    return l10n.facilityDetails_days(days);
  }
}
