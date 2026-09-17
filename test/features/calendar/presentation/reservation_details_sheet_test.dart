import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/calendar/domain/dtos/dtos.dart';
import 'package:coflow_users_v2/features/calendar/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/calendar/domain/repositories/repositories.dart';
import 'package:coflow_users_v2/features/calendar/domain/use_cases/use_cases.dart';
import 'package:coflow_users_v2/features/calendar/presentation/components/components.dart';
import 'package:coflow_users_v2/features/calendar/presentation/cubit/cubit.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/date_symbol_data_local.dart';

final _startsAt = DateTime(2026, 1, 4, 18);

final _reservation = ReservationEntity(
  id: 1,
  facilityId: 102,
  facilityName: 'Happy Horse',
  serviceName: 'Pony Ride',
  startsAt: _startsAt,
  endsAt: _startsAt.add(const Duration(hours: 1)),
  colorHex: '#2F9BE8',
);

ReservationDetailsEntity _details({
  SessionViewerState viewerState = SessionViewerState.reserved,
  bool isFacilityLocation = true,
  DateTime? cancellationDeadline,
}) {
  return ReservationDetailsEntity(
    facilityId: 102,
    facilityName: 'Happy Horse',
    slot: FacilitySessionDetailsEntity(
      id: 1,
      serviceId: 102,
      name: 'Pony Ride',
      startsAt: _startsAt,
      endsAt: _startsAt.add(const Duration(hours: 1)),
      colorHex: '#2F9BE8',
      capacity: const FacilitySessionCapacityEntity(booked: 5, total: 10),
      areCustomersVisible: true,
      customers: const [
        SessionAttendeeEntity(position: 1, displayName: 'A. Deco'),
        SessionAttendeeEntity(position: 2, displayName: 'K. Emad', isCurrentUser: true),
      ],
      waitlist: const [SessionAttendeeEntity(position: 1, displayName: 'O. Alshami')],
      location: SessionLocationEntity(
        address: '32 Mostafa Makram, Maadi, Cairo',
        isFacilityLocation: isFacilityLocation,
      ),
      note: 'Expected wind 15 - 25 km/hr between 12 - 4pm',
      cancellationDeadline: cancellationDeadline,
      viewerState: viewerState,
    ),
  );
}

class _StubRepository implements ReservationRepository {
  _StubRepository(this.details);

  final ReservationDetailsEntity details;

  @override
  AsyncTask<ReservationDetailsEntity> getReservationDetails(GetReservationDetailsDto dto) =>
      TaskEither.right(details);

  @override
  AsyncTask<ReservationDetailsEntity> withdrawReservation(WithdrawReservationDto dto) =>
      TaskEither.right(details);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUpAll(() => initializeDateFormatting('en'));

  Future<void> pumpSheet(WidgetTester tester, ReservationDetailsEntity details) async {
    await tester.pumpWidget(
      _TestApp(
        child: BlocProvider(
          create: (_) => ReservationDetailsCubit(
            GetReservationDetailsUseCase(_StubRepository(details)),
            WithdrawReservationUseCase(_StubRepository(details)),
            _reservation,
          ),
          child: const ReservationDetailsBottomSheet(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  group('ReservationDetailsBottomSheet', () {
    testWidgets('leads with the facility, then the slot, day, and time', (tester) async {
      await pumpSheet(tester, _details());

      final header = find.byType(ReservationDetailsHeader);
      expect(find.descendant(of: header, matching: find.text('Happy Horse')), findsOneWidget);
      expect(find.descendant(of: header, matching: find.text('PONY RIDE')), findsOneWidget);
      expect(find.text('Sunday 4/1'), findsOneWidget);
      expect(find.text('6:00 PM - 7:00 PM'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('puts the location section first, titled by the facility setting', (
      tester,
    ) async {
      await pumpSheet(tester, _details());

      expect(find.text('Facility Location'), findsOneWidget);
      // Location leads the body: it sits above the Customers section.
      expect(
        tester.getTopLeft(find.text('Facility Location')).dy,
        lessThan(tester.getTopLeft(find.text('Customers')).dy),
      );
    });

    testWidgets('a slot held somewhere else drops "Facility" from the heading', (tester) async {
      await pumpSheet(tester, _details(isFacilityLocation: false));

      expect(find.text('Facility Location'), findsNothing);
      expect(find.text('Location'), findsOneWidget);
    });

    testWidgets('a booked place offers a filled Cancel Reservation', (tester) async {
      await pumpSheet(tester, _details());

      final button = tester.widget<MainButton>(
        find.widgetWithText(MainButton, 'Cancel Reservation'),
      );

      expect(find.text('Leave Waitlist'), findsNothing);
      // Filled in the slot's own colour, with no outline.
      expect(button.backgroundColor, isNot(AppColors.light.backgroundWhite));
      expect(button.borderColor, isNull);
    });

    testWidgets('a queued place offers a white Leave Waitlist', (tester) async {
      await pumpSheet(tester, _details(viewerState: SessionViewerState.waitlisted));

      final button = tester.widget<MainButton>(find.widgetWithText(MainButton, 'Leave Waitlist'));

      expect(find.text('Cancel Reservation'), findsNothing);
      expect(button.backgroundColor, AppColors.light.backgroundWhite);
      // Text and outline carry the slot's colour instead.
      expect(button.textColor, button.borderColor);
    });

    testWidgets('withdrawing is inert once the cancellation window has closed', (tester) async {
      await pumpSheet(
        tester,
        _details(cancellationDeadline: DateTime.now().subtract(const Duration(hours: 1))),
      );

      final button = tester.widget<MainButton>(
        find.widgetWithText(MainButton, 'Cancel Reservation'),
      );

      expect(button.isDisabled, isTrue);
    });

    testWidgets('always offers the facility alongside the withdrawal', (tester) async {
      await pumpSheet(tester, _details());

      expect(find.widgetWithText(MainButton, 'Happy Horse'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.light,
      home: Scaffold(body: SizedBox(width: 375, child: child)),
    );
  }
}
