import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';

import '../models/models.dart';

/// Adapts the dated account endpoint to the calendar's display models.
abstract final class AccountReservationPayloadMapper {
  static List<Map<String, dynamic>> rows(Object? payload) {
    if (payload is List && payload.isEmpty) return const [];
    final days = payload as Map<String, dynamic>;
    return [
      for (final entries in days.values)
        for (final entry in entries as List)
          if (entry is Map<String, dynamic> && isActive(entry)) entry,
    ];
  }

  static bool isActive(Map<String, dynamic> row) =>
      const {'reserved', 'waiting', 'waitlist', 'waitlisted'}.contains(row['status']);

  static ReservationModel toModel(
    Map<String, dynamic> row, {
    required Map<String, dynamic> facility,
    required Map<String, dynamic> service,
  }) {
    final slot = FacilityCalendarPayloadMapper.details(
      calendar: row['calendar'] as Map<String, dynamic>,
      facility: facility,
      service: service,
      reservation: row,
    );
    return ReservationModel(
      id: (row['id'] as num).toInt(),
      facilityId: (row['facility_id'] as num).toInt(),
      facilityName: facility['name'] as String,
      facilityLogo: facility['logo'] as String?,
      serviceName: row['service'] as String? ?? slot.name,
      startsAt: slot.startsAt,
      endsAt: slot.endsAt,
      color: slot.color,
      level: slot.level == null
          ? null
          : ReservationLevelModel(name: slot.level!.name, color: slot.level!.color),
      instructors: [
        for (final instructor in slot.instructors)
          ReservationInstructorModel(
            id: instructor.id,
            firstName: instructor.firstName,
            lastName: instructor.lastName,
          ),
      ],
    );
  }
}
