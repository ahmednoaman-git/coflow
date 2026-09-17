import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/calendar/domain/dtos/dtos.dart';
import 'package:coflow_users_v2/features/calendar/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/calendar/domain/repositories/repositories.dart';
import 'package:coflow_users_v2/features/calendar/domain/use_cases/use_cases.dart';
import 'package:coflow_users_v2/features/calendar/presentation/components/components.dart';
import 'package:coflow_users_v2/features/calendar/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:solar_icons/solar_icons.dart';

DateTime _dayOf(DateTime date) => DateTime(date.year, date.month, date.day);

final _today = _dayOf(DateTime.now());

/// A day far enough out that it is never in the current week, so the opening
/// day is unambiguously driven by the reservation rather than by today.
final _bookedDay = _today.add(const Duration(days: 10));

final _reservations = [
  ReservationEntity(
    id: 1,
    facilityId: 101,
    facilityName: 'Calisthenics Club',
    serviceName: 'Calisthenics Session',
    startsAt: DateTime(_bookedDay.year, _bookedDay.month, _bookedDay.day, 17),
    endsAt: DateTime(_bookedDay.year, _bookedDay.month, _bookedDay.day, 18),
    colorHex: '#2FDAC2',
    level: const ReservationLevelEntity(name: 'BEGINNER', colorHex: '#2FDAC2'),
    instructorNames: const ['Abdelrahman Fouad'],
  ),
  ReservationEntity(
    id: 2,
    facilityId: 102,
    facilityName: 'Happy Horse',
    serviceName: 'Pony Ride',
    startsAt: DateTime(_bookedDay.year, _bookedDay.month, _bookedDay.day, 18),
    endsAt: DateTime(_bookedDay.year, _bookedDay.month, _bookedDay.day, 19),
    colorHex: '#2F9BE8',
  ),
];

class _StubRepository implements ReservationRepository {
  @override
  AsyncTask<ReservationCalendarEntity> getReservations(GetReservationsDto dto) => TaskEither.right(
    ReservationCalendarEntity(
      windowStart: dto.startDate,
      windowEnd: dto.endDate,
      reservations: _reservations,
    ),
  );

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUpAll(() => initializeDateFormatting('en'));

  Future<void> pumpBody(WidgetTester tester) async {
    await tester.pumpWidget(
      _TestApp(
        child: BlocProvider(
          create: (_) => CalendarCubit(GetReservationsUseCase(_StubRepository())),
          child: const CalendarScreenBody(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  group('CalendarScreenBody', () {
    testWidgets('opens on the first upcoming reservation and lists its slots', (tester) async {
      await pumpBody(tester);

      expect(find.text('2 Reservations'), findsOneWidget);
      expect(find.byType(ReservationCard), findsNWidgets(2));
      // Each card leads with the facility, then names the service.
      expect(find.text('Calisthenics Club'), findsOneWidget);
      expect(find.text('CALISTHENICS SESSION'), findsOneWidget);
      expect(find.text('Happy Horse'), findsOneWidget);
      expect(find.text('PONY RIDE'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('steps forward into an empty week', (tester) async {
      await pumpBody(tester);

      await tester.tap(find.byIcon(SolarIconsOutline.arrowRight));
      await tester.pumpAndSettle();

      expect(find.byType(CalendarEmptyState), findsOneWidget);
      expect(find.text('No Reservations'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('lays out in Arabic without errors', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          locale: const Locale('ar'),
          child: BlocProvider(
            create: (_) => CalendarCubit(GetReservationsUseCase(_StubRepository())),
            child: const CalendarScreenBody(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ReservationCard), findsNWidgets(2));
      expect(tester.takeException(), isNull);
    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child, this.locale = const Locale('en')});

  final Widget child;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.light,
      home: Scaffold(body: SizedBox(width: 375, child: child)),
    );
  }
}
