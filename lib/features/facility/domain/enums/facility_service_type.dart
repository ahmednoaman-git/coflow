/// The kind of service listing requested from the `services/{facilityId}` endpoint.
enum FacilityServiceType {
  activity,
  flow,
  course
  ;

  /// Value sent as the `type` query parameter.
  String get queryParam => name;

  /// Parses the `type` an API payload reports for a service, or null when it is
  /// missing or unrecognized.
  static FacilityServiceType? fromApi(String? value) {
    if (value == null) return null;
    final normalized = value.trim().toLowerCase();

    for (final type in FacilityServiceType.values) {
      if (type.name == normalized) return type;
    }
    return null;
  }
}
