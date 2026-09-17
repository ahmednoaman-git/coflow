import '../enums/enums.dart';

/// Request for a facility's scheduled sessions within a date window.
///
/// The backend will expose this as a start/end date filter, so the UI always
/// asks for a range rather than a single day.
///
/// Plain const class (not JSON-serialized) — [startDate]/[endDate] are sent as
/// `yyyy-MM-dd` query parameters by the data source.
class GetFacilitySessionsDto {
  const GetFacilitySessionsDto({
    required this.facilityId,
    required this.startDate,
    required this.endDate,
    required this.type,
  });

  final int facilityId;

  /// First day of the window, inclusive.
  final DateTime startDate;

  /// Last day of the window, inclusive.
  final DateTime endDate;

  final FacilityServiceType type;
}
