import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocationSection — address based', () {
    testWidgets('shows the written address and a map for coordinates', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: LocationSection(
            location: const FacilityLocationEntity.address(
              addressLine: 'Alpenstrasse 2',
              areaName: 'Interlaken',
              cityName: 'Bern',
              countryName: 'Switzerland',
              latitude: 46.684019,
              longitude: 7.857573,
              mapUrl: 'https://maps.app.goo.gl/eEGsPM3VPhGeR4Hw7',
            ),
          ),
        ),
      );

      expect(find.text('Address & Location'), findsOneWidget);
      expect(find.text('Alpenstrasse 2, Interlaken, Bern, Switzerland'), findsOneWidget);
      expect(find.byType(FacilityMapPreview), findsOneWidget);
      expect(find.text('Link'), findsOneWidget);
    });

    testWidgets('drops the map when the facility saved no coordinates', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: LocationSection(
            location: const FacilityLocationEntity.address(
              addressLine: 'St. 44 First',
              cityName: 'Cairo',
            ),
          ),
        ),
      );

      expect(find.text('St. 44 First, Cairo'), findsOneWidget);
      expect(find.byType(FacilityMapPreview), findsNothing);
      // No saved link means no pill to tap.
      expect(find.text('Link'), findsNothing);
    });
  });

  group('LocationSection — remote', () {
    testWidgets('lists coverage, collapsing a full city to ALL', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: LocationSection(
            location: const FacilityLocationEntity.remote(
              coverage: [
                FacilityCoverageEntity(label: 'Cairo', areas: ['New Cairo', 'Maadi']),
                FacilityCoverageEntity(label: 'Giza', coversAll: true),
              ],
              mapUrl: 'https://test.coflow.co/profiles/',
            ),
          ),
        ),
      );

      expect(find.text('Remote Location'), findsOneWidget);
      expect(find.text('Operating in:'), findsOneWidget);
      expect(find.byType(FacilityMapPreview), findsNothing);

      // The lines are `LABEL: value` spans, so match on the rendered text.
      final lines = tester
          .widgetList<Text>(find.byType(Text))
          .map((text) => text.textSpan?.toPlainText() ?? text.data ?? '')
          .toList();
      expect(lines, contains('CAIRO: New Cairo, Maadi'));
      expect(lines, contains('GIZA: ALL'));
    });
  });

  testWidgets('renders nothing when there is no location at all', (tester) async {
    await tester.pumpWidget(const _TestApp(child: LocationSection(location: null)));

    expect(find.text('Address & Location'), findsNothing);
    expect(find.text('Remote Location'), findsNothing);
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
      home: Builder(
        builder: (context) => FacilityDataProvider(
          scrollController: ScrollController(),
          facility: const CollapsedFacilityEntity(
            id: 1,
            name: 'Flying Yoga',
            description: 'Aerial & Yoga Studio',
            activityLine: ActivityLineEntity.sky,
            accountType: FlowAccount(),
            status: FacilityStatus.visible,
            subscriptionStatus: SubscriptionStatus.basic,
            paymentType: PaymentType.directPurchase,
            views: 0,
          ),
          activityLineColor: const Color(0xFF2FDAC2),
          activityLineBackground: const Color(0xFFD6F1FC),
          child: Scaffold(
            body: SizedBox(width: 375, child: SingleChildScrollView(child: child)),
          ),
        ),
      ),
    );
  }
}
