import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:coflow_users_v2/features/activity_line/presentation/cubit/activity_line_facilities_cubit.dart';
import 'package:coflow_users_v2/features/activity_line/presentation/widgets/activity_line_facilities_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

class _Locations implements GetLocationsUseCase {
  @override
  AsyncTask<LocationsEntity> call() =>
      TaskEither.right(const LocationsEntity(cities: [], remoteCount: 0));
}

class _Repository implements ActivityLineRepository {
  bool includeItems = false;
  final requests = <GetFacilitiesDto>[];
  bool failNext = false;
  @override
  AsyncTask<ActivityLineFacilitiesEntity> getFacilities(GetFacilitiesDto dto) {
    requests.add(dto);
    if (failNext) {
      failNext = false;
      return TaskEither.left(const NetworkFailure('Offline'));
    }
    final filtered = dto.tagId != null;
    return TaskEither.right(
      ActivityLineFacilitiesEntity(
        facilities: includeItems
            ? [
                CollapsedFacilityEntity(
                  id: dto.page,
                  name: 'Facility ${dto.page}',
                  description: 'Test facility',
                  activityLine: ActivityLineEntity.energy,
                  accountType: const FlowAccount(),
                  status: FacilityStatus.visible,
                  subscriptionStatus: SubscriptionStatus.basic,
                  paymentType: PaymentType.none,
                  views: 0,
                ),
              ]
            : [],
        tags: const [
          TagWithCountEntity(id: 40, name: 'Crossfit', count: 5),
          TagWithCountEntity(id: 37, name: 'Dance', count: 4),
        ],
        currentPage: dto.page,
        lastPage: filtered ? 1 : 2,
        total: filtered ? 0 : 23,
      ),
    );
  }
}

void main() {
  testWidgets('loads another page when the first page does not fill the viewport', (tester) async {
    final repository = _Repository()..includeItems = true;
    final cubit = ActivityLineFacilitiesCubit(
      GetFacilitiesUseCase(repository),
      _Locations(),
      ActivityLineEntity.energy,
    );
    addTearDown(cubit.close);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: BlocProvider.value(value: cubit, child: const ActivityLineFacilitiesBody()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(repository.requests.map((request) => request.page), [1, 2]);
    expect(cubit.state.facilities.map((facility) => facility.id), [1, 2]);
    expect(cubit.facilitiesManager.hasNextPage, isFalse);
    expect(tester.takeException(), isNull);
  });

  test('tag/location changes restart server pagination and retain full tags', () async {
    final repository = _Repository();
    final cubit = ActivityLineFacilitiesCubit(
      GetFacilitiesUseCase(repository),
      _Locations(),
      ActivityLineEntity.energy,
    );
    addTearDown(cubit.close);
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.allFacilitiesTotal, 23);
    await cubit.loadMore();
    expect(repository.requests.last.page, 2);
    cubit.handleTagSelection(40);
    await Future<void>.delayed(Duration.zero);
    expect(repository.requests.last.page, 1);
    expect(repository.requests.last.tagId, 40);
    expect(cubit.state.tags, hasLength(2));
    expect(cubit.state.allFacilitiesTotal, 23);
    cubit.handleTagSelection(37);
    await Future<void>.delayed(Duration.zero);
    expect(repository.requests.last.tagId, 37);
    cubit.selectLocation(const SelectedLocation(cityId: 13, areaId: 2));
    await Future<void>.delayed(Duration.zero);
    expect(repository.requests.last.tagId, 37);
    expect(repository.requests.last.cityId, 13);
    expect(repository.requests.last.areaId, 2);
    expect(repository.requests.last.page, 1);
    expect(cubit.state.allFacilitiesTotal, isNull);
    cubit.clearSelectedTags();
    await Future<void>.delayed(Duration.zero);
    expect(repository.requests.last.tagId, isNull);
    expect(repository.requests.last.cityId, 13);
    await cubit.refresh();
    expect(repository.requests.last.page, 1);
  });

  testWidgets('tags survive filter failure, retry restores empty results and Arabic layout', (
    tester,
  ) async {
    final repository = _Repository();
    final cubit = ActivityLineFacilitiesCubit(
      GetFacilitiesUseCase(repository),
      _Locations(),
      ActivityLineEntity.energy,
    );
    addTearDown(cubit.close);
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        theme: AppTheme.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: BlocProvider.value(value: cubit, child: const ActivityLineFacilitiesBody()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    repository.failNext = true;
    await tester.tap(find.text('Crossfit (5)'));
    await tester.pumpAndSettle();
    expect(find.text('Crossfit (5)'), findsOneWidget);
    expect(find.text('Dance (4)'), findsOneWidget);
    expect(find.text('Offline'), findsOneWidget);
    await tester.tap(find.byType(MainButton));
    await tester.pumpAndSettle();
    expect(find.text('Offline'), findsNothing);
    expect(cubit.state.facilities, isEmpty);
    expect(cubit.state.tags, hasLength(2));
    expect(tester.takeException(), isNull);
  });
}
