import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/components.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/header/facility_data_pinned_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const double _screenWidth = 375;

/// Width the title has once the bar has slid up behind the floating controls.
const double _collapsedTextWidth = _screenWidth - 2 * FacilityHeaderControls.controlEdgeInsets;

const _longName = 'Extremely Long Facility Name That Cannot Possibly Fit';
const _longSubtitle = 'An equally long description of what this facility does';

void main() {
  Future<void> pump(
    WidgetTester tester, {
    required double progress,
    String name = 'X Wake',
    String description = 'Wakeboarding & Surfing School',
  }) {
    tester.view.physicalSize = const Size(_screenWidth * 3, 800 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    return tester.pumpWidget(
      _TestApp(
        name: name,
        description: description,
        child: HeaderAppBar(safeAreaScaleProgress: progress),
      ),
    );
  }

  group('collapsed, with the controls floating above it', () {
    testWidgets('keeps the title and subtitle clear of the controls', (tester) async {
      await pump(tester, progress: 1);

      expect(tester.getSize(find.text('X Wake')).width, lessThanOrEqualTo(_collapsedTextWidth));
      expect(
        tester.getSize(find.text('Wakeboarding & Surfing School')).width,
        lessThanOrEqualTo(_collapsedTextWidth),
      );
    });

    testWidgets('truncates rather than running under the controls', (tester) async {
      await pump(tester, progress: 1, name: _longName, description: _longSubtitle);

      // Both lines stay inside the safe band instead of overflowing into it.
      expect(tester.getSize(find.text(_longName)).width, lessThanOrEqualTo(_collapsedTextWidth));
      expect(
        tester.getSize(find.text(_longSubtitle)).width,
        lessThanOrEqualTo(_collapsedTextWidth),
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('ellipsises both lines on a single line each', (tester) async {
      await pump(tester, progress: 1, name: _longName, description: _longSubtitle);

      for (final text in [_longName, _longSubtitle]) {
        final widget = tester.widget<Text>(find.text(text));
        expect(widget.maxLines, 1);
        expect(widget.overflow, TextOverflow.ellipsis);
      }
    });
  });

  group('expanded, with the bar clear of the controls', () {
    testWidgets('gives the title the full width', (tester) async {
      await pump(tester, progress: 0, name: _longName, description: _longSubtitle);

      // No reserved edges down here, so the text may use the whole bar — which
      // is more room than the collapsed band allows.
      expect(tester.getSize(find.text(_longName)).width, greaterThan(_collapsedTextWidth));
      expect(tester.takeException(), isNull);
    });

    testWidgets('opens the space gradually rather than snapping', (tester) async {
      await pump(tester, progress: 0.5, name: _longName, description: _longSubtitle);
      final halfway = tester.getSize(find.text(_longName)).width;

      await pump(tester, progress: 1, name: _longName, description: _longSubtitle);
      final collapsed = tester.getSize(find.text(_longName)).width;

      await pump(tester, progress: 0, name: _longName, description: _longSubtitle);
      final expanded = tester.getSize(find.text(_longName)).width;

      expect(halfway, greaterThan(collapsed));
      expect(halfway, lessThan(expanded));
    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({
    required this.name,
    required this.description,
    required this.child,
  });

  final String name;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.light,
      home: FacilityDataProvider(
        scrollController: ScrollController(),
        facility: CollapsedFacilityEntity(
          id: 1,
          name: name,
          description: description,
          activityLine: ActivityLineEntity.sea,
          accountType: const FlowAccount(),
          status: FacilityStatus.visible,
          subscriptionStatus: SubscriptionStatus.basic,
          paymentType: PaymentType.directPurchase,
          views: 0,
        ),
        activityLineColor: const Color(0xFF2FDAC2),
        activityLineBackground: const Color(0xFFBFEEE0),
        child: Scaffold(body: child),
      ),
    );
  }
}
