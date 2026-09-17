import 'package:coflow_users_v2/core/gen/l10n/app_localizations.dart';
import 'package:coflow_users_v2/core/theme/app_theme.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/tabs/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

FacilitySessionDetailsEntity _session({
  bool areCustomersVisible = false,
  int booked = 3,
  int total = 10,
  List<SessionAttendeeEntity> customers = const [],
  List<SessionAttendeeEntity> waitlist = const [],
}) {
  return FacilitySessionDetailsEntity(
    id: 1,
    serviceId: 555,
    name: 'Yoga Flow',
    startsAt: DateTime(2026, 6, 15, 18),
    endsAt: DateTime(2026, 6, 15, 19),
    colorHex: '#2FDAC2',
    capacity: FacilitySessionCapacityEntity(booked: booked, total: total),
    areCustomersVisible: areCustomersVisible,
    customers: customers,
    waitlist: waitlist,
  );
}

const _customers = [
  SessionAttendeeEntity(position: 1, displayName: 'A. Deco'),
  SessionAttendeeEntity(position: 2, displayName: 'O. Alshami'),
  SessionAttendeeEntity(position: 3, displayName: 'K. Emad', isCurrentUser: true),
];

void main() {
  setUpAll(() => initializeDateFormatting());

  group('SessionCustomersSection', () {
    testWidgets('private slots show the aggregate bar and no names', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: SessionCustomersSection(
            session: _session(customers: _customers),
            accent: const Color(0xFF2FDAC2),
          ),
        ),
      );

      expect(find.byType(SessionCapacityBar), findsOneWidget);
      expect(find.text('3/10'), findsOneWidget);
      expect(find.text('A. Deco'), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('visible slots list every position up to capacity', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: SessionCustomersSection(
            session: _session(areCustomersVisible: true, customers: _customers),
            accent: const Color(0xFF2FDAC2),
          ),
        ),
      );

      expect(find.byType(SessionCapacityBar), findsNothing);
      expect(find.text('A. Deco'), findsOneWidget);

      // Ten positions, three of them filled — the rest render as empty slots.
      expect(find.text('10.'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('the current user\'s own row is bold', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: SessionCustomersSection(
            session: _session(areCustomersVisible: true, customers: _customers),
            accent: const Color(0xFF2FDAC2),
          ),
        ),
      );

      final mine = tester.widget<Text>(find.text('K. Emad'));
      final other = tester.widget<Text>(find.text('A. Deco'));

      expect(mine.style?.fontWeight, FontWeight.w700);
      expect(other.style?.fontWeight, isNot(FontWeight.w700));
    });
  });

  group('SessionWaitlistSection', () {
    testWidgets('lists the queue in order regardless of customer privacy', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: const SessionWaitlistSection(
            waitlist: [
              SessionAttendeeEntity(position: 1, displayName: 'A. Deco'),
              SessionAttendeeEntity(position: 2, displayName: 'K. Emad', isCurrentUser: true),
            ],
          ),
        ),
      );

      expect(find.text('A. Deco'), findsOneWidget);
      expect(find.text('K. Emad'), findsOneWidget);
      expect(find.text('2.'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  group('SessionDetailsHeader', () {
    testWidgets('renders the slot identity and its tags', (tester) async {
      final session = _session().copyWith(
        level: const FacilityServiceLevel.custom(name: 'BEGINNER', colorHex: '#2FDAC2'),
        isLadiesOnly: true,
        instructorNames: const ['Abdelrahman Fouad', 'Amr Nabil'],
      );

      await tester.pumpWidget(
        _TestApp(
          child: SessionDetailsHeader(session: session, accent: const Color(0xFF2FDAC2)),
        ),
      );

      expect(find.text('YOGA FLOW'), findsOneWidget);
      expect(find.text('Monday 15/6'), findsOneWidget);
      expect(find.text('6:00 PM - 7:00 PM'), findsOneWidget);
      expect(find.text('Abdelrahman Fouad, Amr Nabil'), findsOneWidget);
      expect(find.text('BEGINNER'), findsOneWidget);
      expect(find.text('LADIES ONLY'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  group('SessionLocationSection', () {
    testWidgets('titles the section by which location applies', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: const SessionLocationSection(
            location: SessionLocationEntity(address: '32 Mostafa Makram, Maadi, Cairo'),
          ),
        ),
      );

      expect(find.text('Facility Location'), findsOneWidget);

      await tester.pumpWidget(
        _TestApp(
          child: const SessionLocationSection(
            location: SessionLocationEntity(
              address: '32 Mostafa Makram, Maadi, Cairo',
              isFacilityLocation: false,
            ),
          ),
        ),
      );

      expect(find.text('Location'), findsOneWidget);
      expect(find.text('Facility Location'), findsNothing);
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
      home: Scaffold(
        body: SizedBox(width: 375, child: SingleChildScrollView(child: child)),
      ),
    );
  }
}
