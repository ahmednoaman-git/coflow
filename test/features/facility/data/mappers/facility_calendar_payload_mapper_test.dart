import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

final _calendar = <String, dynamic>{
  'id': 756, 'service_id': 574, 'facility_id': 184, 'date': '2026-09-19',
  'from': '02:09:00', 'to': '03:00:00', 'status': 'public',
  'capacity': 6, 'remain': 4, 'has_reserved': true, 'has_waitlist': false,
  'tickets_count': -3, 'service': {'id': 574, 'name': 'Activity', 'type': 'activity'},
  'instructors': [{'id': 1, 'full_name': 'Registered Instructor'}],
  'other_instructors': [{'id': 2, 'first_name': 'Other', 'last_name': 'Instructor'}],
  'reserved': [
    {'id': 181, 'user_id': 7, 'status': 'reserved', 'user': {'name': 'Viewer'}},
    {'id': 182, 'user_id': 8, 'status': 'reserved', 'user': {'name': 'Other'}},
  ],
};

void main() {
  test('preview count overrides contradictory slot count; privacy fails closed', () {
    final model = FacilityCalendarPayloadMapper.details(calendar: _calendar,
      currentUserId: 7, preview: {'tickets_quantity': 1, 'setting': {'calendar_cancellation': 2}});
    expect(model.accessibleTickets, 1);
    expect(model.capacity.booked, 2);
    expect(model.reservationId, 181);
    expect(model.viewerState, 'reserved');
    expect(model.customersVisible, false);
    expect(model.customers, isEmpty);
    expect(model.cancellationDeadline, DateTime(2026, 9, 19, 0, 9));
    expect(model.canWithdraw, true);
    expect(model.canJoinWaitlist, false);
    expect(model.instructors.map((i) => '${i.firstName} ${i.lastName}'.trim()),
      ['Registered Instructor', 'Other Instructor']);
  });

  test('account reservation shows its spent purchase rather than next eligible ticket', () {
    final model = FacilityCalendarPayloadMapper.details(calendar: _calendar,
      preview: {'ticket': {'name': 'Next ticket', 'quantity': 4}},
      reservation: {'id': 181, 'user_id': 7, 'status': 'reserved',
        'purchase_ticket': {'name': 'Spent ticket', 'quantity': 0, 'ticket': {'validity_days': 30}},
        'purchase': {'remain': '25', 'created_at': '2026-09-01T10:00:00Z', 'addons': [{ 'id': 1 }]}});
    expect(model.reservationTicket?.name, 'Spent ticket');
    expect(model.reservationTicket?.quantity, 0);
    expect(model.reservationTicket?.due, true);
    expect(model.reservationTicket?.validForDays, 30);
    expect(model.reservationTicket?.addOns, 1);
    expect(model.canWithdraw, false);
  });

  for (final state in ['reserved', 'waiting', 'cancelled']) {
    test('reservation state $state takes precedence over stale slot flags', () {
      final model = FacilityCalendarPayloadMapper.details(calendar: _calendar,
        reservation: {'id': 181, 'user_id': 7, 'status': state});
      expect(model.viewerState, {'reserved': 'reserved', 'waiting': 'waitlisted', 'cancelled': 'none'}[state]);
    });
  }

  test('unknown count disables reservation and unlimited preview permits a use', () {
    expect(FacilityCalendarPayloadMapper.details(calendar: _calendar).canReserve, false);
    final unlimited = FacilityCalendarPayloadMapper.details(calendar: _calendar,
      preview: {'ticket': {'unlimited': true}});
    expect(unlimited.accessibleTickets, 1);
    expect(unlimited.canReserve, true);
  });

  test('waitlist field and explicit visibility map without leaking private names', () {
    final model = FacilityCalendarPayloadMapper.details(calendar: {..._calendar,
      'customers_visible': true,
      'waitlists': [{'id': 190, 'user_id': 9, 'status': 'waiting', 'user': {'name': 'Queued'}}]},
      currentUserId: 9);
    expect(model.customers.map((c) => c.name), ['Viewer', 'Other']);
    expect(model.waitlist.single.isCurrentUser, true);
    expect(model.viewerState, 'waitlisted');
    expect(model.canWithdraw, false);
  });

  test('recurring details preserve schedule identity and omit booking capabilities', () {
    final fallback = FacilitySessionEntity(id: 12, serviceId: 574, name: 'Weekly flow',
      startsAt: DateTime(2026, 9, 19, 12), endsAt: DateTime(2026, 9, 19, 13),
      colorHex: '#123456', instructorNames: ['Instructor'], isRecurring: true);
    final model = FacilityCalendarPayloadMapper.details(calendar: {}, fallback: fallback,
      isRecurring: true);
    expect(model.id, 12);
    expect(model.startsAt, fallback.startsAt);
    expect(model.instructors.single.firstName, 'Instructor');
    expect(model.isRecurring, true);
    expect(model.canReserve, false);
    expect(model.canWithdraw, false);
  });

  test('overnight times and slot location are derived from API values', () {
    final model = FacilityCalendarPayloadMapper.details(calendar: {..._calendar,
      'from': '23:00:00', 'to': '01:00:00',
      'service_location': {'name': 'Beach', 'link': 'https://example.test/map'}},
      service: {'facility_location': 0});
    expect(model.endsAt, DateTime(2026, 9, 20, 1));
    expect(model.location?.address, 'Beach');
    expect(model.location?.isFacilityLocation, false);
  });
}
