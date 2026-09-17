import '../enums/enums.dart';

/// Request for a facility's recurring weekly schedule (`schedule/{facilityId}`).
///
/// The endpoint takes neither a date range nor a type filter — it returns the
/// whole weekly pattern. [windowStart]/[windowEnd] therefore describe the days
/// the UI is *showing*, which the mapper projects the pattern onto, and [type]
/// is applied client-side against each slot's service type.
class GetFacilityWeeklyScheduleDto {
  const GetFacilityWeeklyScheduleDto({
    required this.facilityId,
    required this.windowStart,
    required this.windowEnd,
    required this.type,
  });

  final int facilityId;

  /// First day rendered, inclusive.
  final DateTime windowStart;

  /// Last day rendered, inclusive.
  final DateTime windowEnd;

  final FacilityServiceType type;
}
