import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:flutter_test/flutter_test.dart';

FacilitySessionDetailsModel _model({
  String? viewerState,
  bool? customersVisible,
  List<SessionAttendeeModel> customers = const [],
  SessionLocationModel? location,
  SessionReservationTicketModel? reservationTicket,
  int? accessibleTickets,
}) {
  return FacilitySessionDetailsModel(
    id: 1,
    serviceId: 555,
    name: 'Yoga Flow',
    startsAt: DateTime(2026, 6, 15, 18),
    endsAt: DateTime(2026, 6, 15, 19),
    capacity: const FacilitySessionCapacityModel(booked: 2, total: 10, waitlist: 3),
    viewerState: viewerState,
    customersVisible: customersVisible,
    customers: customers,
    location: location,
    reservationTicket: reservationTicket,
    accessibleTickets: accessibleTickets,
  );
}

void main() {
  group('FacilitySessionDetailsMapper.toEntity', () {
    test('maps the viewer\'s standing on the slot', () {
      expect(
        FacilitySessionDetailsMapper.toEntity(_model(viewerState: 'reserved')).viewerState,
        SessionViewerState.reserved,
      );
      expect(
        FacilitySessionDetailsMapper.toEntity(_model(viewerState: 'waitlisted')).viewerState,
        SessionViewerState.waitlisted,
      );
    });

    test('never assumes a standing the backend did not send', () {
      expect(
        FacilitySessionDetailsMapper.toEntity(_model()).viewerState,
        SessionViewerState.none,
      );
      expect(
        FacilitySessionDetailsMapper.toEntity(_model(viewerState: 'something-new')).viewerState,
        SessionViewerState.none,
      );
    });

    test('defaults customers to private and no accessible tickets', () {
      final entity = FacilitySessionDetailsMapper.toEntity(_model());

      expect(entity.areCustomersVisible, isFalse);
      expect(entity.accessibleTickets, 0);
      expect(entity.reservationTicket, isNull);
    });

    test('maps attendees, flagging the requesting customer', () {
      final entity = FacilitySessionDetailsMapper.toEntity(
        _model(
          customersVisible: true,
          customers: const [
            SessionAttendeeModel(position: 1, name: 'A. Deco'),
            SessionAttendeeModel(position: 2, name: 'K. Emad', isCurrentUser: true),
          ],
        ),
      );

      expect(entity.customers, hasLength(2));
      expect(entity.customers.first.isCurrentUser, isFalse);
      expect(entity.customers.last.isCurrentUser, isTrue);
      expect(entity.customers.last.displayName, 'K. Emad');
    });

    test('treats a location as the facility\'s own unless told otherwise', () {
      final facilityLocation = FacilitySessionDetailsMapper.toEntity(
        _model(location: const SessionLocationModel(address: 'Maadi, Cairo')),
      ).location;
      final selectedLocation = FacilitySessionDetailsMapper.toEntity(
        _model(
          location: const SessionLocationModel(
            address: 'Maadi, Cairo',
            isFacilityLocation: false,
          ),
        ),
      ).location;

      expect(facilityLocation?.isFacilityLocation, isTrue);
      expect(selectedLocation?.isFacilityLocation, isFalse);
    });

    test('maps the purchase a reservation would consume', () {
      final entity = FacilitySessionDetailsMapper.toEntity(
        _model(
          accessibleTickets: 2,
          reservationTicket: const SessionReservationTicketModel(
            name: 'Training Session',
            quantity: 2,
            due: true,
            validForDays: 12,
            addOns: 2,
          ),
        ),
      );

      expect(entity.accessibleTickets, 2);
      expect(entity.reservationTicket?.name, 'Training Session');
      expect(entity.reservationTicket?.isDue, isTrue);
      expect(entity.reservationTicket?.validForDays, 12);
      expect(entity.reservationTicket?.addOnsCount, 2);
    });

    test('carries the waitlist count through from capacity', () {
      final entity = FacilitySessionDetailsMapper.toEntity(_model());

      expect(entity.capacity.waitlistCount, 3);
      expect(entity.isFull, isFalse);
    });
  });
}
