import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_service_level.freezed.dart';

/// The level badge shown on a service tile/details screen.
///
/// [FacilityServiceLevelAll] is a fallback used when the API returns a null
/// level for a type that conceptually requires one (flows/courses) — see
/// `FacilityServiceMapper.mapLevel`. Its display text is localized in the
/// UI, never composed in the mapper.
@freezed
sealed class FacilityServiceLevel with _$FacilityServiceLevel {
  const factory FacilityServiceLevel.custom({
    required String name,
    required String colorHex,
  }) = FacilityServiceLevelCustom;

  const factory FacilityServiceLevel.allLevels() = FacilityServiceLevelAll;
}
