import 'dart:async';

import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:coflow_users_v2/features/facility/domain/domain.dart';
import 'package:coflow_users_v2/features/saved_profiles/domain/domain.dart';
import 'package:coflow_users_v2/features/saved_profiles/presentation/components/components.dart';
import 'package:coflow_users_v2/features/saved_profiles/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

SavedProfileEntity _profile({
  required int id,
  required String name,
  required ActivityLineEntity activityLine,
  bool isTracked = false,
  FacilityStatus status = FacilityStatus.visible,
}) => SavedProfileEntity(
  facility: CollapsedFacilityEntity(
    id: id,
    name: name,
    description: '$name sessions',
    likeCount: 250,
    activityLine: activityLine,
    accountType: const FlowAccount(),
    status: status,
    subscriptionStatus: SubscriptionStatus.basic,
    paymentType: PaymentType.none,
    views: 0,
  ),
  branchLabel: 'New Cairo, Cairo',
  isTracked: isTracked,
);

class _StubSavedProfilesRepository implements SavedProfilesRepository {
  @override
  AsyncTask<List<SavedProfileEntity>> getSavedProfiles() => TaskEither.right([
    _profile(id: 1, name: 'Gravity', activityLine: ActivityLineEntity.sky, isTracked: true),
    _profile(
      id: 2,
      name: 'Blue Depths',
      activityLine: ActivityLineEntity.sea,
      status: FacilityStatus.temporarilyClosed,
    ),
    _profile(id: 3, name: 'Terra Studio', activityLine: ActivityLineEntity.earth),
  ]);
}

/// Stubs the two toggles the Profiles screen reaches for; anything else would
/// be a bug if it were called from these tests.
class _StubFacilityRepository implements FacilityRepository {
  _StubFacilityRepository({this.failToggles = false});

  /// Makes both toggles fail, so the rollback paths can be exercised.
  final bool failToggles;

  /// Holds tracking requests open until completed, to catch a second tap
  /// landing while the first is still in flight.
  Completer<void>? trackingGate;

  final List<ToggleFacilitySaveDto> saveToggles = [];
  final List<ToggleFacilityTrackingDto> trackingToggles = [];

  @override
  AsyncTask<void> toggleFacilitySave(ToggleFacilitySaveDto dto) {
    saveToggles.add(dto);
    return _result();
  }

  @override
  AsyncTask<void> toggleFacilityTracking(ToggleFacilityTrackingDto dto) {
    trackingToggles.add(dto);
    final gate = trackingGate;
    if (gate == null) return _result();

    return TaskEither(() async {
      await gate.future;
      return _result().run();
    });
  }

  AsyncTask<void> _result() =>
      failToggles ? TaskEither.left(const NetworkFailure('offline')) : TaskEither.right(null);

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is not stubbed');
}

void main() {
  setUp(() => SavedProfilesCubit.trackingSettle = Duration.zero);

  Future<_StubFacilityRepository> pumpBody(
    WidgetTester tester, {
    Locale locale = const Locale('en'),
    _StubFacilityRepository? facilityRepository,
  }) async {
    final facilities = facilityRepository ?? _StubFacilityRepository();

    await tester.pumpWidget(
      _TestApp(
        locale: locale,
        child: BlocProvider(
          create: (_) => SavedProfilesCubit(
            GetSavedProfilesUseCase(_StubSavedProfilesRepository()),
            ToggleFacilitySaveUseCase(facilities),
            ToggleFacilityTrackingUseCase(facilities),
            FacilitySaveEvents(),
          ),
          child: const SavedProfilesScreenBody(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    return facilities;
  }

  /// The filter chips, in `ActivityLineEntity.all` order: sky, sea, earth, energy.
  Finder lineChip(int index) => find
      .descendant(of: find.byType(ActivityLineFilterBar), matching: find.byType(SvgPicture))
      .at(index);

  SavedProfileTrackButton trackButtonOf(WidgetTester tester, String name) =>
      tester.widget<SavedProfileTrackButton>(
        find.descendant(
          of: find.ancestor(of: find.text(name), matching: find.byType(SavedProfileCard)),
          matching: find.byType(SavedProfileTrackButton),
        ),
      );

  group('SavedProfilesScreenBody', () {
    testWidgets('lists every saved profile with no line selected', (tester) async {
      await pumpBody(tester);

      expect(find.byType(SavedProfileCard), findsNWidgets(3));
      expect(find.text('Gravity'), findsOneWidget);
      expect(find.text('New Cairo, Cairo'), findsNWidgets(3));
      // Only the closed facility carries the status line.
      expect(find.text('Temporarily Closed'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('filters to one line, then clears back to all', (tester) async {
      await pumpBody(tester);

      await tester.tap(lineChip(1)); // Sea
      await tester.pumpAndSettle();

      expect(find.byType(SavedProfileCard), findsOneWidget);
      expect(find.text('Blue Depths'), findsOneWidget);

      // Tapping the selected chip is the way back to "All".
      await tester.tap(lineChip(1));
      await tester.pumpAndSettle();

      expect(find.byType(SavedProfileCard), findsNWidgets(3));
      expect(tester.takeException(), isNull);
    });

    testWidgets('shows the filtered empty state for a line with nothing saved', (tester) async {
      await pumpBody(tester);

      await tester.tap(lineChip(3)); // Energy — nothing saved on it
      await tester.pumpAndSettle();

      expect(find.byType(SavedProfileCard), findsNothing);
      expect(find.text('Nothing saved on this activity line'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('toggles tracking on the tapped card only', (tester) async {
      final facilities = await pumpBody(tester);

      expect(trackButtonOf(tester, 'Gravity').isTracked, isTrue);

      await tester.tap(find.byType(SavedProfileTrackButton).first);
      await tester.pumpAndSettle();

      expect(trackButtonOf(tester, 'Gravity').isTracked, isFalse);
      expect(trackButtonOf(tester, 'Blue Depths').isTracked, isFalse);
      expect(facilities.trackingToggles.single.facilityId, 1);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a track tap during a request is sent after it, not alongside', (tester) async {
      final facilities = _StubFacilityRepository()..trackingGate = Completer<void>();
      await pumpBody(tester, facilityRepository: facilities);

      // The endpoint is a toggle: two calls at once could land in either
      // order, so the second waits for the first.
      await tester.tap(find.byType(SavedProfileTrackButton).first);
      await tester.pump(const Duration(milliseconds: 1));
      await tester.tap(find.byType(SavedProfileTrackButton).first);
      await tester.pump(const Duration(milliseconds: 1));

      expect(facilities.trackingToggles, hasLength(1));
      expect(trackButtonOf(tester, 'Gravity').isTracked, isTrue, reason: 'shown at once');

      facilities.trackingGate!.complete();
      await tester.pumpAndSettle();

      expect(facilities.trackingToggles, hasLength(2));
      expect(trackButtonOf(tester, 'Gravity').isTracked, isTrue);
      expect(tester.takeException(), isNull);
    });

    testWidgets('spamming the bell sends one call, or none when the taps cancel out', (
      tester,
    ) async {
      final facilities = await pumpBody(tester);
      final bell = find.byType(SavedProfileTrackButton).first;

      for (var i = 0; i < 3; i++) {
        await tester.tap(bell);
      }
      await tester.pumpAndSettle();
      expect(facilities.trackingToggles, hasLength(1));
      expect(trackButtonOf(tester, 'Gravity').isTracked, isFalse);

      for (var i = 0; i < 2; i++) {
        await tester.tap(bell);
      }
      await tester.pumpAndSettle();
      expect(facilities.trackingToggles, hasLength(1));
      expect(trackButtonOf(tester, 'Gravity').isTracked, isFalse);
      expect(tester.takeException(), isNull);
    });

    testWidgets('unsaving a card drops its bell taps still waiting', (tester) async {
      SavedProfilesCubit.trackingSettle = const Duration(seconds: 5);
      final facilities = await pumpBody(tester);

      // Sent after the unsave, the track call would save the facility again.
      await tester.tap(find.byType(SavedProfileTrackButton).first);
      await tester.drag(find.text('Gravity'), const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(find.text('Gravity'), findsNothing);
      expect(facilities.saveToggles.single.facilityId, 1);
      expect(facilities.trackingToggles, isEmpty);
      expect(tester.takeException(), isNull);
    });

    testWidgets('restores the toggle when tracking fails', (tester) async {
      await pumpBody(tester, facilityRepository: _StubFacilityRepository(failToggles: true));

      await tester.tap(find.byType(SavedProfileTrackButton).first);
      await tester.pumpAndSettle();

      expect(trackButtonOf(tester, 'Gravity').isTracked, isTrue);
      expect(tester.takeException(), isNull);
    });

    testWidgets('swiping a card away unsaves it', (tester) async {
      final facilities = await pumpBody(tester);

      await tester.drag(find.text('Gravity'), const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(find.text('Gravity'), findsNothing);
      expect(find.byType(SavedProfileCard), findsNWidgets(2));
      expect(facilities.saveToggles.single.facilityId, 1);
      expect(tester.takeException(), isNull);
    });

    testWidgets('puts the card back when unsaving fails', (tester) async {
      await pumpBody(tester, facilityRepository: _StubFacilityRepository(failToggles: true));

      await tester.drag(find.text('Gravity'), const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(find.text('Gravity'), findsOneWidget);
      expect(find.byType(SavedProfileCard), findsNWidgets(3));
      expect(tester.takeException(), isNull);
    });

    testWidgets('lays out in Arabic without errors', (tester) async {
      await pumpBody(tester, locale: const Locale('ar'));

      expect(find.byType(SavedProfileCard), findsNWidgets(3));
      expect(tester.takeException(), isNull);
    });

    testWidgets('unsaves on a start-to-end swipe in Arabic', (tester) async {
      final facilities = await pumpBody(tester, locale: const Locale('ar'));

      // End-to-start is a rightward drag under RTL.
      await tester.drag(find.text('Gravity'), const Offset(500, 0));
      await tester.pumpAndSettle();

      expect(facilities.saveToggles.single.facilityId, 1);
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
      builder: (context, child) => SnackbarHost(child: child!),
      home: Scaffold(body: SizedBox(width: 375, child: child)),
    );
  }
}
