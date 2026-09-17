import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:flutter_test/flutter_test.dart';

final _now = DateTime(2026, 6, 15, 12);

FacilitySessionDetailsEntity _session({
  int booked = 2,
  int total = 10,
  SessionViewerState viewerState = SessionViewerState.none,
  int accessibleTickets = 1,
  DateTime? cancellationDeadline,
}) {
  return FacilitySessionDetailsEntity(
    id: 1,
    serviceId: 555,
    name: 'Yoga Flow',
    startsAt: DateTime(2026, 6, 15, 18),
    endsAt: DateTime(2026, 6, 15, 19),
    colorHex: '#2FDAC2',
    capacity: FacilitySessionCapacityEntity(booked: booked, total: total),
    viewerState: viewerState,
    accessibleTickets: accessibleTickets,
    canJoinWaitlist: true,
    cancellationDeadline: cancellationDeadline,
  );
}

SessionCtaEntity _resolve(
  FacilitySessionDetailsEntity session, {
  bool isPremiumActive = true,
  DateTime? now,
}) {
  return SessionCtaEntity.resolve(
    session: session,
    facilityName: 'Flying Yoga',
    isFacilityPremiumActive: isPremiumActive,
    now: now ?? _now,
  );
}

void main() {
  group('SessionCtaEntity.resolve', () {
    test('an unverified waitlist action stays unavailable', () {
      expect(_resolve(_session(booked: 10).copyWith(canJoinWaitlist: false)),
          const SessionCtaEntity.unavailable());
    });

    test('a recurring schedule only offers contact even with premium', () {
      expect(_resolve(_session().copyWith(isRecurring: true)),
          const SessionCtaEntity.contactFacility(facilityName: 'Flying Yoga'));
    });

    test('a started session cannot offer a new reservation', () {
      expect(_resolve(_session(), now: DateTime(2026, 6, 15, 18)),
          const SessionCtaEntity.unavailable());
    });

    test('unknown cancellation policy cannot authorize withdrawal', () {
      expect(_resolve(_session(viewerState: SessionViewerState.reserved)
          .copyWith(canWithdraw: false)),
          const SessionCtaEntity.cancelReservation(isEnabled: false));
    });
    test('a facility without an active premium can only be contacted', () {
      final cta = _resolve(_session(), isPremiumActive: false);

      expect(cta, const SessionCtaEntity.contactFacility(facilityName: 'Flying Yoga'));
    });

    test('the contact CTA wins even when the customer could otherwise reserve', () {
      final cta = _resolve(
        _session(accessibleTickets: 5, viewerState: SessionViewerState.none),
        isPremiumActive: false,
      );

      expect(cta, isA<SessionContactFacilityCta>());
    });

    test('a free spot and a usable ticket offers a reservation', () {
      final cta = _resolve(_session(accessibleTickets: 2));

      expect(cta, const SessionCtaEntity.reserve(accessibleTickets: 2));
    });

    test('no tickets diverts to purchasing, whether or not the slot is full', () {
      expect(
        _resolve(_session(accessibleTickets: 0)),
        const SessionCtaEntity.purchaseTickets(accessibleTickets: 0),
      );
      expect(
        _resolve(_session(booked: 10, total: 10, accessibleTickets: 0)),
        const SessionCtaEntity.purchaseTickets(accessibleTickets: 0),
      );
    });

    test('a full slot with a usable ticket offers the waitlist', () {
      final cta = _resolve(_session(booked: 10, total: 10, accessibleTickets: 1));

      expect(cta, const SessionCtaEntity.joinWaitlist());
    });

    test('an existing reservation offers cancellation', () {
      final cta = _resolve(_session(viewerState: SessionViewerState.reserved));

      expect(cta, const SessionCtaEntity.cancelReservation(isEnabled: true));
    });

    test('a waitlist entry offers leaving', () {
      final cta = _resolve(_session(viewerState: SessionViewerState.waitlisted));

      expect(cta, const SessionCtaEntity.leaveWaitlist(isEnabled: true));
    });

    test('the viewer\'s own standing outranks the free/full split', () {
      // Reserved into a slot that is now full: still a cancellation, not a
      // waitlist offer.
      final cta = _resolve(
        _session(booked: 10, total: 10, viewerState: SessionViewerState.reserved),
      );

      expect(cta, isA<SessionCancelReservationCta>());
    });

    group('cancellation deadline', () {
      test('withdrawal stays enabled before it', () {
        final session = _session(
          viewerState: SessionViewerState.reserved,
          cancellationDeadline: _now.add(const Duration(hours: 1)),
        );

        expect(_resolve(session), const SessionCtaEntity.cancelReservation(isEnabled: true));
      });

      test('cancelling disables once it passes', () {
        final session = _session(
          viewerState: SessionViewerState.reserved,
          cancellationDeadline: _now.subtract(const Duration(minutes: 1)),
        );

        expect(_resolve(session), const SessionCtaEntity.cancelReservation(isEnabled: false));
      });

      test('leaving the waitlist disables once it passes', () {
        final session = _session(
          viewerState: SessionViewerState.waitlisted,
          cancellationDeadline: _now.subtract(const Duration(minutes: 1)),
        );

        expect(_resolve(session), const SessionCtaEntity.leaveWaitlist(isEnabled: false));
      });

      test('a slot without a deadline never locks withdrawal', () {
        final session = _session(viewerState: SessionViewerState.reserved);

        expect(session.canWithdrawAt(DateTime(2030)), isTrue);
      });
    });
  });
}
