import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
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
  id: id,
  name: name,
  description: '$name sessions',
  activityLine: activityLine,
  status: status,
  likeCount: 250,
  branchLabel: 'New Cairo, Cairo',
  isTracked: isTracked,
);

class _StubRepository implements SavedProfilesRepository {
  _StubRepository({this.failMutations = false});

  /// Makes both verbs fail, so the optimistic rollback can be exercised.
  final bool failMutations;

  final List<UnsaveProfileDto> unsaved = [];
  final List<SetProfileTrackingDto> trackingChanges = [];

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

  @override
  AsyncTask<void> unsaveProfile(UnsaveProfileDto dto) {
    unsaved.add(dto);
    return failMutations
        ? TaskEither.left(const NetworkFailure('offline'))
        : TaskEither.right(null);
  }

  @override
  AsyncTask<void> setProfileTracking(SetProfileTrackingDto dto) {
    trackingChanges.add(dto);
    return failMutations
        ? TaskEither.left(const NetworkFailure('offline'))
        : TaskEither.right(null);
  }
}

void main() {
  Future<_StubRepository> pumpBody(
    WidgetTester tester, {
    Locale locale = const Locale('en'),
    bool failMutations = false,
  }) async {
    final repository = _StubRepository(failMutations: failMutations);

    await tester.pumpWidget(
      _TestApp(
        locale: locale,
        child: BlocProvider(
          create: (_) => SavedProfilesCubit(
            GetSavedProfilesUseCase(repository),
            UnsaveProfileUseCase(repository),
            SetProfileTrackingUseCase(repository),
          ),
          child: const SavedProfilesScreenBody(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    return repository;
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
      final repository = await pumpBody(tester);

      expect(trackButtonOf(tester, 'Gravity').isTracked, isTrue);

      await tester.tap(find.byType(SavedProfileTrackButton).first);
      await tester.pumpAndSettle();

      expect(trackButtonOf(tester, 'Gravity').isTracked, isFalse);
      expect(trackButtonOf(tester, 'Blue Depths').isTracked, isFalse);
      expect(repository.trackingChanges.single.profileId, 1);
      expect(repository.trackingChanges.single.isTracked, isFalse);
      expect(tester.takeException(), isNull);
    });

    testWidgets('restores the toggle when tracking fails', (tester) async {
      await pumpBody(tester, failMutations: true);

      await tester.tap(find.byType(SavedProfileTrackButton).first);
      await tester.pumpAndSettle();

      expect(trackButtonOf(tester, 'Gravity').isTracked, isTrue);
      expect(tester.takeException(), isNull);
    });

    testWidgets('swiping a card away unsaves it', (tester) async {
      final repository = await pumpBody(tester);

      await tester.drag(find.text('Gravity'), const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(find.text('Gravity'), findsNothing);
      expect(find.byType(SavedProfileCard), findsNWidgets(2));
      expect(repository.unsaved.single.profileId, 1);
      expect(tester.takeException(), isNull);
    });

    testWidgets('puts the card back when unsaving fails', (tester) async {
      await pumpBody(tester, failMutations: true);

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
      final repository = await pumpBody(tester, locale: const Locale('ar'));

      // End-to-start is a rightward drag under RTL.
      await tester.drag(find.text('Gravity'), const Offset(500, 0));
      await tester.pumpAndSettle();

      expect(repository.unsaved.single.profileId, 1);
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
