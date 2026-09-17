import '../../domain/entities/entities.dart';
import '../models/models.dart';

/// Normalizes the calendar, ticket-preview and account-reservation API shapes.
/// Optional settings stay unknown; absence never grants a booking capability.
abstract final class FacilityCalendarPayloadMapper {
  static FacilitySessionDetailsModel details({
    required Map<String, dynamic> calendar,
    Map<String, dynamic> preview = const {},
    Map<String, dynamic> service = const {},
    Map<String, dynamic> facility = const {},
    Map<String, dynamic> reservation = const {},
    int? currentUserId,
    FacilitySessionEntity? fallback,
    bool isRecurring = false,
  }) {
    final serviceData = {..._map(calendar['service']), ...service};
    final settings = _map(preview['setting']);
    final startsAt = _time(calendar, 'from', fallback?.startsAt);
    var endsAt = _time(calendar, 'to', fallback?.endsAt);
    if (!endsAt.isAfter(startsAt)) endsAt = endsAt.add(const Duration(days: 1));
    final customers = _rows(calendar['reserved']);
    final waiting = _rows(calendar['waitlists'] ?? calendar['waiting']);
    final userId = currentUserId ?? _int(reservation['user_id']);
    final ownReservation = reservation.isNotEmpty
        ? reservation
        : [
                ...customers,
                ...waiting,
              ].where((row) => userId != null && _int(row['user_id']) == userId).firstOrNull ??
              const <String, dynamic>{};
    final ownStatus = ownReservation['status']?.toString().toLowerCase();
    final viewerState = switch (ownStatus) {
      'reserved' => 'reserved',
      'waiting' || 'waitlisted' => 'waitlisted',
      'cancelled' || 'canceled' => 'none',
      _ =>
        _bool(calendar['has_reserved'])
            ? 'reserved'
            : _bool(calendar['has_waitlist'])
            ? 'waitlisted'
            : 'none',
    };
    final cancellationHours = _int(settings['calendar_cancellation']);
    final policyKnown = cancellationHours != null && cancellationHours >= 0;
    final reservationId = _int(ownReservation['id']);
    final total = _int(calendar['capacity']) ?? 0;
    final remaining = _int(calendar['remain']);
    final booked =
        _int(calendar['reserved_count']) ??
        (remaining == null ? customers.length : (total - remaining).clamp(0, total));
    // Customer names require an affirmative privacy setting, even if included
    // in the response. The backend does not currently expose it consistently.
    final visible =
        _bool(settings['calendar_customers']) ||
        settings['calendar_customers'] == 'visible' ||
        _bool(calendar['customers_visible']);
    final cutoff = policyKnown ? startsAt.subtract(Duration(hours: cancellationHours)) : null;
    final purchaseTicket = reservation.isNotEmpty
        ? _map(reservation['purchase_ticket'])
        : _map(preview['ticket']);
    final purchase = reservation.isNotEmpty
        ? _map(reservation['purchase'])
        : _map(purchaseTicket['purchase']);
    final ticket = _map(purchaseTicket['ticket']);
    final accessible = _int(preview['tickets_quantity']);
    final hasUnlimited = _bool(_map(preview['ticket'])['unlimited']);
    final quantity = accessible ?? (hasUnlimited ? 1 : _int(_map(preview['ticket'])['quantity']));
    final level = _map(serviceData['level']);
    final instructors = [
      ..._rows(calendar['instructors']),
      ..._rows(calendar['other_instructors']),
    ];
    final status = calendar['status']?.toString().toLowerCase();
    final validStatus = status == 'public' || status == 'private' || status == 'active';

    return FacilitySessionDetailsModel(
      id:
          _int(calendar['id']) ??
          fallback?.id ??
          (throw const FormatException('Missing calendar id')),
      serviceId:
          _int(calendar['service_id']) ?? _int(serviceData['id']) ?? fallback?.serviceId ?? 0,
      name:
          serviceData['name']?.toString() ??
          reservation['service']?.toString() ??
          fallback?.name ??
          '',
      startsAt: startsAt,
      endsAt: endsAt,
      color: calendar['color']?.toString() ?? level['color']?.toString() ?? fallback?.colorHex,
      level: level['name'] == null
          ? null
          : FacilityServiceLevelModel(
              id: _int(level['id']) ?? 0,
              name: level['name'].toString(),
              color: level['color']?.toString(),
            ),
      ladiesOnly:
          _bool(calendar['ladies_only']) || (isRecurring && (fallback?.isLadiesOnly ?? false)),
      instructors: instructors.isEmpty && isRecurring
          ? [
              for (final (index, name) in (fallback?.instructorNames ?? <String>[]).indexed)
                FacilitySessionInstructorModel(id: index, firstName: name, lastName: ''),
            ]
          : [
              for (final row in instructors)
                FacilitySessionInstructorModel(
                  id: _int(row['id']) ?? 0,
                  firstName: row['full_name']?.toString() ?? row['first_name']?.toString() ?? '',
                  lastName: row['full_name'] == null ? row['last_name']?.toString() ?? '' : '',
                ),
            ],
      capacity: FacilitySessionCapacityModel(
        booked: booked,
        total: total,
        waitlist: _int(calendar['waiting_count']) ?? waiting.length,
      ),
      customersVisible: visible,
      customers: visible ? _attendees(customers, userId) : const [],
      waitlist: _attendees(waiting, userId),
      location: _location(calendar, serviceData, facility),
      note: calendar['notes']?.toString(),
      cancellationDeadline: cutoff,
      cancellationWindowHours: policyKnown ? cancellationHours : null,
      viewerState: viewerState,
      accessibleTickets: (quantity ?? 0).clamp(0, 2147483647),
      reservationTicket: purchaseTicket.isEmpty
          ? null
          : SessionReservationTicketModel(
              name: purchaseTicket['name']?.toString() ?? '',
              quantity: _int(purchaseTicket['quantity']) ?? 0,
              due: (_number(purchase['remain']) ?? 0) > 0,
              purchasedAt: DateTime.tryParse(purchase['created_at']?.toString() ?? ''),
              validForDays: _int(ticket['validity_days']),
              addOns: _rows(purchase['addons']).length,
            ),
      reservationId: reservationId,
      isRecurring: isRecurring,
      canReserve: !isRecurring && validStatus && quantity != null,
      // These routes are not documented as waitlist actions. Do not claim an
      // action until the server explicitly advertises the capability.
      canJoinWaitlist: false,
      canWithdraw:
          !isRecurring && policyKnown && reservationId != null && viewerState == 'reserved',
    );
  }

  static FacilitySessionModel session(Map<String, dynamic> calendar) {
    final value = details(calendar: calendar);
    return FacilitySessionModel(
      id: value.id,
      serviceId: value.serviceId,
      name: value.name,
      startsAt: value.startsAt,
      endsAt: value.endsAt,
      color: value.color,
      ladiesOnly: value.ladiesOnly,
      level: value.level,
      instructors: value.instructors,
      capacity: value.capacity,
    );
  }

  static List<Map<String, dynamic>> calendarRows(dynamic value) {
    if (value is List) return value.map(_map).where((row) => row.isNotEmpty).toList();
    final map = _map(value);
    if (map.isEmpty) return const [];
    if (map.containsKey('id') && map.containsKey('date')) return [map];
    if (map.containsKey('data')) return calendarRows(map['data']);
    if (map.containsKey('calendar')) return calendarRows(map['calendar']);
    if (map.containsKey('calendars')) return calendarRows(map['calendars']);
    if (map.keys.every((key) => RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(key))) {
      return map.values.expand(calendarRows).toList();
    }
    throw const FormatException('Unrecognized calendar response');
  }

  static DateTime _time(Map<String, dynamic> row, String key, DateTime? fallback) {
    final date = row['date']?.toString();
    final time = row[key]?.toString();
    if (date != null && time != null) {
      final value = DateTime.tryParse('${date.split('T').first}T$time');
      if (value != null) return value;
    }
    return fallback ?? (throw const FormatException('Missing calendar date or time'));
  }

  static List<SessionAttendeeModel> _attendees(List<Map<String, dynamic>> rows, int? userId) => [
    for (final (index, row) in rows.indexed)
      SessionAttendeeModel(
        position: index + 1,
        name: _map(row['user'])['name']?.toString() ?? '',
        isCurrentUser: userId != null && _int(row['user_id']) == userId,
      ),
  ];

  static SessionLocationModel? _location(
    Map<String, dynamic> calendar,
    Map<String, dynamic> service,
    Map<String, dynamic> facility,
  ) {
    final useFacility = _bool(service['facility_location']);
    final location = useFacility ? _map(facility['address']) : _map(calendar['service_location']);
    final address = location['address']?.toString() ?? location['name']?.toString();
    final url = location['location']?.toString() ?? location['link']?.toString();
    if (address == null || address.trim().isEmpty) return null;
    return SessionLocationModel(address: address, mapUrl: url, isFacilityLocation: useFacility);
  }

  static Map<String, dynamic> _map(dynamic value) =>
      value is Map ? Map<String, dynamic>.from(value) : const {};
  static List<Map<String, dynamic>> _rows(dynamic value) =>
      value is List ? value.map(_map).toList() : const [];
  static int? _int(dynamic value) => value is num ? value.toInt() : int.tryParse('$value');
  static num? _number(dynamic value) => value is num ? value : num.tryParse('$value');
  static bool _bool(dynamic value) => value == true || value == 1 || value == '1';
}
