import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../models/models.dart';

/// Maps the location half of the profile payload.
///
/// The payload does not have a single "location" object: an address-based
/// facility fills `address`/`city`/`area`, a remote one fills `locations`, and
/// `location_type` says which to trust. Some remote facilities carry a stale
/// `address` row too, so the type flag wins over what happens to be present.
abstract final class FacilityLocationMapper {
  static FacilityLocationEntity? toEntity(FacilityProfileModel model) {
    final type =
        FacilityLocationType.fromApi(model.locationType) ??
        (model.locations.isNotEmpty
            ? FacilityLocationType.remoteLocation
            : FacilityLocationType.addressBased);

    final location = switch (type) {
      FacilityLocationType.remoteLocation => _toRemote(model),
      FacilityLocationType.addressBased => _toAddress(model),
    };

    return location.isEmpty ? null : location;
  }

  static FacilityLocationEntity _toAddress(FacilityProfileModel model) {
    final address = model.address;

    return FacilityLocationEntity.address(
      addressLine: _clean(address?.address),
      areaName: _clean(model.area?.name),
      cityName: _clean(model.city?.name),
      countryName: _clean(model.country?.name),
      latitude: address?.latitude,
      longitude: address?.longitude,
      mapUrl: _clean(address?.location),
      phones:
          address?.phones
              .map((phone) => FacilityPhoneEntity(number: phone.number, label: _clean(phone.type)))
              .where((phone) => phone.number.isNotEmpty)
              .toList(growable: false) ??
          const <FacilityPhoneEntity>[],
    );
  }

  static FacilityLocationEntity _toRemote(FacilityProfileModel model) {
    return FacilityLocationEntity.remote(
      coverage: model.locations
          .map(_toCoverage)
          .whereType<FacilityCoverageEntity>()
          .toList(growable: false),
      mapUrl: _clean(model.address?.location),
    );
  }

  static FacilityCoverageEntity? _toCoverage(FacilityCoverageModel model) {
    final availability = model.availabilityType?.trim().toLowerCase();

    // A country-wide row names the country; everything else is scoped to a city.
    if (availability == 'all country') {
      final country = _clean(model.country?.name);
      return country == null ? null : FacilityCoverageEntity(label: country, coversAll: true);
    }

    final city = _clean(model.city?.name);
    if (city == null) return null;

    if (availability == 'all city') {
      return FacilityCoverageEntity(label: city, coversAll: true);
    }

    final areas =
        model.areas
            ?.map((area) => area.name.trim())
            .where((name) => name.isNotEmpty)
            .toList(growable: false) ??
        const <String>[];

    // An `open` row with no areas still means the whole city in practice.
    return FacilityCoverageEntity(label: city, areas: areas, coversAll: areas.isEmpty);
  }

  static String? _clean(String? value) {
    final trimmed = value?.trim();
    return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
  }
}
