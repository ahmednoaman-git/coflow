import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

final _calendar = <String, dynamic>{
  'id': 756,
  'service_id': 574,
  'facility_id': 184,
  'date': '2026-09-19',
  'from': '02:09:00',
  'to': '03:00:00',
  'status': 'public',
  'capacity': 6,
  'remain': 4,
  'has_reserved': true,
  'has_waitlist': false,
  'tickets_count': -3,
  'service': {'id': 574, 'name': 'Activity', 'type': 'activity'},
  'instructors': [
    {'id': 1, 'full_name': 'Registered Instructor'},
  ],
  'other_instructors': [
    {'id': 2, 'first_name': 'Other', 'last_name': 'Instructor'},
  ],
  'reserved': [
    {
      'id': 181,
      'user_id': 7,
      'status': 'reserved',
      'user': {'name': 'Viewer'},
    },
    {
      'id': 182,
      'user_id': 8,
      'status': 'reserved',
      'user': {'name': 'Other'},
    },
  ],
};

void main() {
  test('preview count overrides contradictory slot count; privacy fails closed', () {
    final model = FacilityCalendarPayloadMapper.details(
      calendar: _calendar,
      currentUserId: 7,
      preview: {
        'tickets_quantity': 1,
        'setting': {'calendar_cancellation': 2},
      },
    );
    expect(model.accessibleTickets, 1);
    expect(model.capacity.booked, 2);
    expect(model.reservationId, 181);
    expect(model.viewerState, 'reserved');
    expect(model.customersVisible, false);
    expect(model.customers, isEmpty);
    expect(model.cancellationDeadline, DateTime(2026, 9, 19, 0, 9));
    expect(model.canWithdraw, true);
    expect(model.canJoinWaitlist, true);
    expect(model.instructors.map((i) => '${i.firstName} ${i.lastName}'.trim()), [
      'Registered Instructor',
      'Other Instructor',
    ]);
  });

  test('account reservation shows its spent purchase rather than next eligible ticket', () {
    final model = FacilityCalendarPayloadMapper.details(
      calendar: _calendar,
      preview: {
        'ticket': {'name': 'Next ticket', 'quantity': 4},
      },
      reservation: {
        'id': 181,
        'user_id': 7,
        'status': 'reserved',
        'purchase_ticket': {
          'name': 'Spent ticket',
          'quantity': 0,
          'ticket': {'validity_days': 30},
        },
        'purchase': {
          'remain': '25',
          'created_at': '2026-09-01T10:00:00Z',
          'addons': [
            {'id': 1},
          ],
        },
      },
    );
    expect(model.reservationTicket?.name, 'Spent ticket');
    expect(model.reservationTicket?.quantity, 0);
    expect(model.reservationTicket?.due, true);
    expect(model.reservationTicket?.validForDays, 30);
    expect(model.reservationTicket?.addOns, 1);
    // No preview setting: no deadline, but the reservation can still be
    // cancelled — the server enforces the limit.
    expect(model.cancellationDeadline, isNull);
    expect(model.canWithdraw, true);
  });

  for (final state in ['reserved', 'waiting', 'cancelled']) {
    test('reservation state $state takes precedence over stale slot flags', () {
      final model = FacilityCalendarPayloadMapper.details(
        calendar: _calendar,
        reservation: {'id': 181, 'user_id': 7, 'status': state},
      );
      expect(
        model.viewerState,
        {'reserved': 'reserved', 'waiting': 'waitlisted', 'cancelled': 'none'}[state],
      );
    });
  }

  test('unknown count disables reservation and unlimited preview permits a use', () {
    expect(FacilityCalendarPayloadMapper.details(calendar: _calendar).canReserve, false);
    final unlimited = FacilityCalendarPayloadMapper.details(
      calendar: _calendar,
      preview: {
        'ticket': {'unlimited': true},
      },
    );
    expect(unlimited.accessibleTickets, 1);
    expect(unlimited.canReserve, true);
  });

  test('waitlist field and explicit visibility map without leaking private names', () {
    final model = FacilityCalendarPayloadMapper.details(
      calendar: {
        ..._calendar,
        'customers_visible': true,
        'waitlists': [
          {
            'id': 190,
            'user_id': 9,
            'status': 'waiting',
            'user': {'name': 'Queued'},
          },
        ],
      },
      currentUserId: 9,
    );
    expect(model.customers.map((c) => c.name), ['Viewer', 'Other']);
    expect(model.waitlist.single.isCurrentUser, true);
    expect(model.viewerState, 'waitlisted');
    expect(model.reservationId, 190);
    expect(model.canWithdraw, true);
  });

  test('setting from calendar extra_data sets the deadline when the preview has none', () {
    final model = FacilityCalendarPayloadMapper.details(
      calendar: _calendar,
      currentUserId: 7,
      preview: {'tickets_quantity': 1},
      setting: {'calendar_cancellation': 6},
    );
    expect(model.cancellationDeadline, DateTime(2026, 9, 18, 20, 9));
    expect(model.cancellationWindowHours, 6);
  });

  test('calendar_show_reservations decides whether customer names show', () {
    FacilitySessionDetailsModel withSetting(String value) => FacilityCalendarPayloadMapper.details(
      calendar: _calendar,
      setting: {'calendar_show_reservations': value},
    );
    expect(withSetting('visible').customers.map((c) => c.name), ['Viewer', 'Other']);
    expect(withSetting('hidden').customers, isEmpty);
  });

  test('recurring schedules never offer the waitlist', () {
    final model = FacilityCalendarPayloadMapper.details(calendar: _calendar, isRecurring: true);
    expect(model.canJoinWaitlist, false);
  });

  test('calendar/{id} customers and waitlists arrive as bare user records', () {
    // Live shape of calendar/811 (2026-09-25): no `user_id`, no nested `user`.
    final model = FacilityCalendarPayloadMapper.details(
      calendar: {
        ..._calendar,
        'reserved': null,
        'customers_visible': true,
        'customers': [
          {'id': 1, 'name': 'Rubye Schinner'},
          {'id': 2, 'name': 'Other'},
        ],
        'waitlists': [
          {'id': 9, 'name': 'Monte Fisher'},
        ],
      },
      currentUserId: 1,
    );
    expect(model.customers.map((c) => c.name), ['Rubye Schinner', 'Other']);
    expect(model.customers.first.isCurrentUser, true);
    expect(model.waitlist.single.name, 'Monte Fisher');
    expect(model.waitlist.single.isCurrentUser, false);
  });

  test('no usable ticket still offers purchasing rather than disabling the slot', () {
    // What the data source substitutes when calendar/{id}/ticket answers 500.
    final model = FacilityCalendarPayloadMapper.details(
      calendar: _calendar,
      preview: {'tickets_quantity': 0},
    );
    expect(model.accessibleTickets, 0);
    expect(model.canReserve, true);
    expect(model.reservationTicket, isNull);
  });

  test('a ticket from a package names the package; a plain ticket names none', () {
    FacilitySessionDetailsModel preview(String type) => FacilityCalendarPayloadMapper.details(
      calendar: _calendar,
      preview: {
        'tickets_quantity': 4,
        'ticket': {
          'name': 'Intermediate Flows Ticket',
          'quantity': 4,
          'purchase': {'name': 'EGP Package', 'type': type},
        },
      },
    );
    expect(preview('package').reservationTicket?.purchaseName, 'EGP Package');
    expect(preview('ticket').reservationTicket?.purchaseName, isNull);
  });

  test('recurring details preserve schedule identity and omit booking capabilities', () {
    final fallback = FacilitySessionEntity(
      id: 12,
      serviceId: 574,
      name: 'Weekly flow',
      startsAt: DateTime(2026, 9, 19, 12),
      endsAt: DateTime(2026, 9, 19, 13),
      colorHex: '#123456',
      instructorNames: ['Instructor'],
      isRecurring: true,
    );
    final model = FacilityCalendarPayloadMapper.details(
      calendar: {},
      fallback: fallback,
      isRecurring: true,
    );
    expect(model.id, 12);
    expect(model.startsAt, fallback.startsAt);
    expect(model.instructors.single.firstName, 'Instructor');
    expect(model.isRecurring, true);
    expect(model.canReserve, false);
    expect(model.canWithdraw, false);
  });

  test('overnight times and slot location are derived from API values', () {
    final model = FacilityCalendarPayloadMapper.details(
      calendar: {
        ..._calendar,
        'from': '23:00:00',
        'to': '01:00:00',
        'service_location': {'name': 'Beach', 'link': 'https://example.test/map'},
      },
      service: {'facility_location': 0},
    );
    expect(model.endsAt, DateTime(2026, 9, 20, 1));
    expect(model.location?.address, 'Beach');
    expect(model.location?.isFacilityLocation, false);
  });
}
