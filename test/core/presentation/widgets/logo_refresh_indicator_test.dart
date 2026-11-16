import 'dart:async';

import 'package:coflow_users_v2/core/presentation/widgets/logo_refresh/logo_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const contentKey = Key('content');

  /// Pumps an indicator over a sliver list whose body is [bodyHeight] tall —
  /// a notifier, so a test can resize the content mid-refresh the way a
  /// skeleton swap does.
  Future<Completer<void>> pumpIndicator(
    WidgetTester tester, {
    TargetPlatform platform = TargetPlatform.android,
    List<int>? refreshes,
    ValueNotifier<double>? bodyHeight,
  }) async {
    final completer = Completer<void>();
    final height = bodyHeight ?? ValueNotifier(0.0);
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(platform: platform),
        home: Scaffold(
          body: LogoRefreshIndicator(
            onRefresh: () {
              refreshes?.add(1);
              return completer.future;
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(key: contentKey, height: 40, width: double.infinity),
                ),
                // A horizontal row inside keeps its own physics.
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [for (var i = 0; i < 20; i++) const SizedBox(width: 80)],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ValueListenableBuilder(
                    valueListenable: height,
                    builder: (_, value, _) => SizedBox(height: value),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return completer;
  }

  double contentTop(WidgetTester tester) => tester.getTopLeft(find.byKey(contentKey)).dy;

  Future<void> pumpFrames(WidgetTester tester, int count) async {
    for (var frame = 0; frame < count; frame++) {
      await tester.pump(const Duration(milliseconds: 16));
    }
  }

  Future<void> pull(WidgetTester tester, double distance) =>
      tester.drag(find.byKey(contentKey), Offset(0, distance), warnIfMissed: false);

  for (final platform in [TargetPlatform.android, TargetPlatform.iOS]) {
    group(platform.name, () {
      testWidgets('pulling moves the content down and draws the logo above it', (tester) async {
        await pumpIndicator(tester, platform: platform);
        final top = contentTop(tester);

        final gesture = await tester.startGesture(
          tester.getCenter(find.byKey(contentKey), warnIfMissed: false),
        );
        await gesture.moveBy(const Offset(0, 20));
        await gesture.moveBy(const Offset(0, 80));
        await tester.pump();

        expect(contentTop(tester), greaterThan(top + 20));
        expect(find.byType(DrawnLogo), findsOneWidget);

        await gesture.up();
        await tester.pumpAndSettle();
        expect(contentTop(tester), top);
        expect(find.byType(DrawnLogo), findsNothing);
      });

      testWidgets('a short pull springs back without refreshing', (tester) async {
        final refreshes = <int>[];
        await pumpIndicator(tester, platform: platform, refreshes: refreshes);

        await pull(tester, 60);
        await tester.pumpAndSettle();

        expect(refreshes, isEmpty);
      });

      testWidgets('a full pull refreshes, holds the gap open, then closes it', (tester) async {
        final refreshes = <int>[];
        final completer = await pumpIndicator(tester, platform: platform, refreshes: refreshes);
        final top = contentTop(tester);

        await pull(tester, 400);
        await pumpFrames(tester, 40);

        expect(refreshes, hasLength(1));
        expect(contentTop(tester), closeTo(top + LogoRefreshIndicator.holdExtent, 1));
        expect(find.byType(DrawnLogo), findsOneWidget);

        completer.complete();
        await tester.pump(LogoRefreshIndicator.loopDuration);
        await tester.pumpAndSettle();

        expect(contentTop(tester), closeTo(top, 0.5));
        expect(find.byType(DrawnLogo), findsNothing);
      });

      testWidgets('the content resizing mid-refresh keeps the gap, then lets it close', (
        tester,
      ) async {
        final bodyHeight = ValueNotifier(800.0);
        final completer = await pumpIndicator(tester, platform: platform, bodyHeight: bodyHeight);
        final top = contentTop(tester);

        await pull(tester, 400);
        await tester.pump(const Duration(milliseconds: 16));
        // The refresh swaps the content for a shorter skeleton.
        bodyHeight.value = 100;
        await pumpFrames(tester, 40);

        expect(contentTop(tester), closeTo(top + LogoRefreshIndicator.holdExtent, 1));

        bodyHeight.value = 800;
        completer.complete();
        await tester.pump(LogoRefreshIndicator.loopDuration);
        await tester.pumpAndSettle();

        expect(contentTop(tester), closeTo(top, 0.5));
        expect(find.byType(DrawnLogo), findsNothing);
      });
    });
  }

  testWidgets('the loading loop spins the rings opposite ways, then shimmers and pulses', (
    tester,
  ) async {
    final completer = await pumpIndicator(tester);
    await pull(tester, 400);

    // The release starts the refresh on the spring's first moving frame.
    await pumpFrames(tester, 3);
    DrawnLogo logo() => tester.widget(find.byType(DrawnLogo));
    const loop = LogoRefreshIndicator.loopDuration;

    await tester.pump();
    await tester.pump(loop * 0.25);
    expect(logo().outerTurn, greaterThan(0));
    expect(logo().innerTurn, lessThan(0));
    expect(logo().shimmer, isNull);

    await tester.pump(loop * 0.4);
    expect(logo().shimmer, isNotNull);

    await tester.pump(loop * 0.2);
    expect(logo().scale, greaterThan(1));

    completer.complete();
    await tester.pump(loop);
    await tester.pumpAndSettle();
  });

  testWidgets('a fling into the top stops there on Android', (tester) async {
    final refreshes = <int>[];
    await pumpIndicator(tester, refreshes: refreshes, bodyHeight: ValueNotifier(3000));
    final scrollView = find.byType(CustomScrollView);
    double pixels() => tester
        .state<ScrollableState>(
          find.byWidgetPredicate((w) => w is Scrollable && w.axisDirection == AxisDirection.down),
        )
        .position
        .pixels;

    await tester.drag(scrollView, const Offset(0, -300));
    await tester.pumpAndSettle();
    await tester.fling(scrollView, const Offset(0, 200), 4000);
    for (var frame = 0; frame < 60; frame++) {
      await tester.pump(const Duration(milliseconds: 16));
      expect(pixels(), greaterThanOrEqualTo(0));
    }
    await tester.pumpAndSettle();
    expect(pixels(), 0);
    expect(refreshes, isEmpty);
  });

  testWidgets('a SingleChildScrollView is rejected in debug', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LogoRefreshIndicator(
            onRefresh: () async {},
            child: const SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: SizedBox(height: 40, width: double.infinity),
            ),
          ),
        ),
      ),
    );

    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, 100));
    expect(tester.takeException(), isA<FlutterError>());
  });
}
