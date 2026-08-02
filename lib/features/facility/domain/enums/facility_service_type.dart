/// The kind of service listing requested from the `services/{facilityId}` endpoint.
enum FacilityServiceType {
  activity,
  flow,
  course
  ;

  /// Value sent as the `type` query parameter.
  String get queryParam => name;
}
