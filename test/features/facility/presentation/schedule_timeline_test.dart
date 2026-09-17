import 'package:coflow_users_v2/core/gen/l10n/app_localizations.dart';
import 'package:coflow_users_v2/core/presentation/widgets/calendar/calendar.dart';
import 'package:coflow_users_v2/core/theme/app_theme.dart';
import 'package:coflow_users_v2/core/theme/theme_extensions/app_colors.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/tabs/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

final _session = FacilitySessionEntity(
  id: 1,
  serviceId: 555,
  name: 'Yoga Flow',
  startsAt: DateTime(2026, 1, 4, 18),
  endsAt: DateTime(2026, 1, 4, 19),
  colorHex: '#2FDAC2',
  level: const FacilityServiceLevel.custom(name: 'BEGINNER', colorHex: '#2FDAC2'),
  isLadiesOnly: true,
  instructorNames: const ['Abdelrahman Fouad'],
  capacity: const FacilitySessionCapacityEntity(booked: 2, total: 10),
);

void main() {
  // Mirrors `main()` — `DateFormat` only knows en_US until this runs.
  setUpAll(() => initializeDateFormatting());

  group('SessionTimeline', () {
    testWidgets('shows the session, its pills and the time gutter', (tester) async {
      await tester.pumpWidget(
        _TestApp(child: SessionTimeline(sessions: [_session], showsCapacity: false)),
      );

      expect(find.text('YOGA FLOW'), findsOneWidget);
      expect(find.text('BEGINNER'), findsOneWidget);
      expect(find.text('LADIES ONLY'), findsOneWidget);
      expect(find.text('Abdelrahman Fouad'), findsOneWidget);
      expect(find.text('6:00 PM'), findsOneWidget);
      expect(find.text('7:00 PM'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('hides capacity on the Schedule variant', (tester) async {
      await tester.pumpWidget(
        _TestApp(child: SessionTimeline(sessions: [_session], showsCapacity: false)),
      );

      expect(find.byType(SessionCapacityBar), findsNothing);
      expect(find.text('2/10'), findsNothing);
    });

    testWidgets('shows capacity on the Calendar variant', (tester) async {
      await tester.pumpWidget(
        _TestApp(child: SessionTimeline(sessions: [_session], showsCapacity: true)),
      );

      expect(find.byType(SessionCapacityBar), findsOneWidget);
      expect(find.text('2/10'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('fills the capacity track to the booked ratio', (tester) async {
      final half = _session.copyWith(
        capacity: const FacilitySessionCapacityEntity(booked: 5, total: 10),
      );

      await tester.pumpWidget(
        _TestApp(child: SessionTimeline(sessions: [half], showsCapacity: true)),
      );

      final trackWidth = tester.getSize(find.byType(SessionCapacityBar)).width;
      final fillSize = tester.getSize(find.byKey(SessionCapacityBar.fillKey));

      expect(fillSize.height, SessionCapacityBar.height);
      expect(fillSize.width, closeTo(trackWidth * 0.5, 1));
    });

    testWidgets('keeps the count inside the fill, against its trailing edge', (tester) async {
      await tester.pumpWidget(
        _TestApp(child: SessionTimeline(sessions: [_session], showsCapacity: true)),
      );

      final fillStart = tester.getTopLeft(find.byKey(SessionCapacityBar.fillKey)).dx;
      final fillEnd = tester.getBottomRight(find.byKey(SessionCapacityBar.fillKey)).dx;
      final labelStart = tester.getTopLeft(find.text('2/10')).dx;
      final labelEnd = tester.getBottomRight(find.text('2/10')).dx;

      expect(labelStart, greaterThan(fillStart));
      expect(labelEnd, closeTo(fillEnd - 12, 1));
    });

    testWidgets('shows the waitlist only once a session is fully booked', (tester) async {
      final full = _session.copyWith(
        capacity: const FacilitySessionCapacityEntity(booked: 10, total: 10, waitlistCount: 5),
      );

      await tester.pumpWidget(
        _TestApp(child: SessionTimeline(sessions: [full], showsCapacity: true)),
      );

      expect(find.text('5 waiting'), findsOneWidget);
      expect(tester.takeException(), isNull);

      final partial = _session.copyWith(
        capacity: const FacilitySessionCapacityEntity(booked: 9, total: 10, waitlistCount: 5),
      );

      await tester.pumpWidget(
        _TestApp(child: SessionTimeline(sessions: [partial], showsCapacity: true)),
      );

      expect(find.text('5 waiting'), findsNothing);
    });

    testWidgets('centres the count over a full bar and flips it for contrast', (tester) async {
      final full = _session.copyWith(
        capacity: const FacilitySessionCapacityEntity(booked: 10, total: 10),
        colorHex: '#DA302B',
      );

      await tester.pumpWidget(
        _TestApp(child: SessionTimeline(sessions: [full], showsCapacity: true)),
      );

      final barCentre = tester.getCenter(find.byType(SessionCapacityBar)).dx;
      final labelCentre = tester.getCenter(find.text('10/10')).dx;
      final label = tester.widget<Text>(find.text('10/10'));

      // Icon + text are centred as a pair, so the text lands just past centre.
      expect(labelCentre, closeTo(barCentre, 12));
      // #DA302B is dark, so the count goes white on top of it.
      expect(label.style?.color, AppColors.light.textWhite);
    });

    testWidgets('lays out in Arabic without errors', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          locale: const Locale('ar'),
          child: SessionTimeline(sessions: [_session], showsCapacity: true),
        ),
      );

      expect(find.text('YOGA FLOW'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  group('CalendarDayStrip', () {
    final days = [for (var i = 1; i <= 7; i++) DateTime(2026, 1, i)];

    testWidgets('selects the tapped day', (tester) async {
      DateTime? tapped;

      await tester.pumpWidget(
        _TestApp(
          child: CalendarDayStrip(
            days: days,
            selectedDay: days.first,
            horizontalPadding: 16,
            onDaySelected: (day) => tapped = day,
          ),
        ),
      );

      await tester.tap(find.text('3'));
      expect(tapped, DateTime(2026, 1, 3));
      expect(tester.takeException(), isNull);
    });

    testWidgets('ignores taps on days with nothing scheduled', (tester) async {
      DateTime? tapped;

      await tester.pumpWidget(
        _TestApp(
          child: CalendarDayStrip(
            days: days,
            selectedDay: days.first,
            horizontalPadding: 16,
            onDaySelected: (day) => tapped = day,
            activeDays: {DateTime(2026, 1, 2)},
          ),
        ),
      );

      await tester.tap(find.text('3'));
      expect(tapped, isNull);

      await tester.tap(find.text('2'));
      expect(tapped, DateTime(2026, 1, 2));
    });

    testWidgets('dims days without sessions once the window has loaded', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: CalendarDayStrip(
            days: days,
            selectedDay: days.first,
            horizontalPadding: 16,
            onDaySelected: (_) {},
            activeDays: {DateTime(2026, 1, 2)},
          ),
        ),
      );

      final active = tester.widget<Text>(find.text('2'));
      final inactive = tester.widget<Text>(find.text('3'));

      expect(active.style?.color, AppColors.light.textPrimary);
      expect(inactive.style?.color, AppColors.light.textDisabled);
    });

    testWidgets('drops the day number for a recurring weekly cycle', (tester) async {
      DateTime? tapped;

      await tester.pumpWidget(
        _TestApp(
          child: CalendarDayStrip(
            days: days,
            selectedDay: days.first,
            horizontalPadding: 16,
            showsDayNumber: false,
            onDaySelected: (day) => tapped = day,
          ),
        ),
      );

      // Weekday only — no dates anywhere in the strip.
      for (var dayOfMonth = 1; dayOfMonth <= 7; dayOfMonth++) {
        expect(find.text('$dayOfMonth'), findsNothing);
      }

      // 2026-01-01 is a Thursday, so the window runs THU…WED.
      expect(find.text('THU'), findsOneWidget);
      await tester.tap(find.text('SAT'));

      expect(tapped, DateTime(2026, 1, 3));
      expect(tester.takeException(), isNull);
    });

    testWidgets('insets the first and last chip inside the scroll view', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: CalendarDayStrip(
            days: days,
            selectedDay: days.first,
            horizontalPadding: 16,
            onDaySelected: (_) {},
          ),
        ),
      );

      final scrollable = tester.widget<ListView>(find.byType(ListView));
      expect(scrollable.padding, const EdgeInsets.symmetric(horizontal: 16));

      // A full week still fits without scrolling, padding included.
      final strip = tester.getRect(find.byType(CalendarDayStrip));
      final firstChip = tester.getRect(find.text('THU'));
      expect(firstChip.left, greaterThanOrEqualTo(strip.left + 16));
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
      home: Scaffold(
        body: SizedBox(width: 375, child: child),
      ),
    );
  }
}
