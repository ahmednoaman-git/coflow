/// How a facility is reachable, as reported by `location_type` on the profile
/// payload.
///
/// The two variants are rendered as completely different cards: an address-based
/// facility shows a pinned map, a remote one shows the areas it operates in.
enum FacilityLocationType {
  /// The facility sits at a fixed address with coordinates.
  addressBased('address based'),

  /// The facility travels to the customer and covers a set of areas instead.
  remoteLocation('remote location')
  ;

  const FacilityLocationType(this.apiValue);

  /// Value the API sends for this type.
  final String apiValue;

  /// Parses `location_type`, or null when it is missing or unrecognized.
  static FacilityLocationType? fromApi(String? value) {
    if (value == null) return null;
    final normalized = value.trim().toLowerCase();

    for (final type in FacilityLocationType.values) {
      if (type.apiValue == normalized) return type;
    }
    return null;
  }
}
