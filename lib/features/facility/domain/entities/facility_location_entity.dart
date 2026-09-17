import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_location_entity.freezed.dart';

/// A phone number the facility publishes against its address.
///
/// Kept separate from the reservation contacts: the address block carries its
/// own `phones` list, which a facility may fill without configuring a
/// "Contact Number" channel at all.
@freezed
abstract class FacilityPhoneEntity with _$FacilityPhoneEntity {
  const factory FacilityPhoneEntity({
    required String number,

    /// `Mobile`, `Landline`, ... — absent when the backend did not label it.
    String? label,
  }) = _FacilityPhoneEntity;
}

/// One line of a remote facility's coverage, e.g. `Cairo — New Cairo, Maadi`
/// or `Giza — all`.
@freezed
abstract class FacilityCoverageEntity with _$FacilityCoverageEntity {
  const factory FacilityCoverageEntity({
    /// The city the areas belong to, or the country when the facility covers
    /// a whole country.
    required String label,

    /// Named areas inside [label]. Empty when [coversAll] is true.
    @Default(<String>[]) List<String> areas,

    /// The facility serves all of [label] rather than specific areas.
    @Default(false) bool coversAll,
  }) = _FacilityCoverageEntity;
}

/// Where a facility can be reached.
///
/// A sealed union rather than a nullable bag of fields, because the two cases
/// share almost nothing: an address renders a map pin, a remote facility
/// renders the list of areas it travels to.
@freezed
sealed class FacilityLocationEntity with _$FacilityLocationEntity {
  /// A fixed address, usually with coordinates and a maps link.
  const factory FacilityLocationEntity.address({
    String? addressLine,
    String? areaName,
    String? cityName,
    String? countryName,
    double? latitude,
    double? longitude,

    /// The externally shareable maps link the facility saved.
    String? mapUrl,
    @Default(<FacilityPhoneEntity>[]) List<FacilityPhoneEntity> phones,
  }) = FacilityAddressLocation;

  /// A facility that comes to the customer, described by the areas it covers.
  const factory FacilityLocationEntity.remote({
    @Default(<FacilityCoverageEntity>[]) List<FacilityCoverageEntity> coverage,

    /// Some remote facilities still publish a link (a booking page, a pinned
    /// meeting point); shown as the same "Link" affordance.
    String? mapUrl,
  }) = FacilityRemoteLocation;

  const FacilityLocationEntity._();

  /// The link behind the section's "Link" pill, when there is one to open.
  String? get link {
    final url = switch (this) {
      FacilityAddressLocation(:final mapUrl) => mapUrl,
      FacilityRemoteLocation(:final mapUrl) => mapUrl,
    };
    final trimmed = url?.trim();
    return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
  }

  /// Whether a map preview can be drawn — coordinates only, an address without
  /// them falls back to the text line.
  bool get hasCoordinates => switch (this) {
    FacilityAddressLocation(:final latitude, :final longitude) =>
      latitude != null && longitude != null,
    FacilityRemoteLocation() => false,
  };

  /// Whether the section has anything at all to render.
  bool get isEmpty => switch (this) {
    FacilityAddressLocation(
      :final addressLine,
      :final areaName,
      :final cityName,
      :final countryName,
    ) =>
      !hasCoordinates &&
          link == null &&
          [addressLine, areaName, cityName, countryName].every(
            (part) => part == null || part.trim().isEmpty,
          ),
    FacilityRemoteLocation(:final coverage) => coverage.isEmpty && link == null,
  };
}
