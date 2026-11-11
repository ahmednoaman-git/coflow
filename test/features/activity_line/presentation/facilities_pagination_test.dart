import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:coflow_users_v2/features/activity_line/presentation/cubit/activity_line_facilities_cubit.dart';
import 'package:coflow_users_v2/features/activity_line/presentation/widgets/activity_line_facilities_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

class _Locations implements GetLocationsUseCase {
  _Locations([this.locations = const LocationsEntity(cities: [], remoteCount: 0)]);

  final LocationsEntity locations;

  @override
  AsyncTask<LocationsEntity> call({int? activityLineId}) => TaskEither.right(locations);
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
      null,
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
      null,
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
      null,
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

  group('location carried over from the dashboard', () {
    const cairo = LocationCityEntity(
      id: 13,
      name: 'Cairo',
      facilityCount: 4,
      areas: [LocationAreaEntity(id: 2, name: 'Maadi', facilityCount: 3)],
    );

    Future<(ActivityLineFacilitiesCubit, _Repository)> open(
      SelectedLocation initial,
      LocationsEntity lineLocations,
    ) async {
      final repository = _Repository();
      final cubit = ActivityLineFacilitiesCubit(
        GetFacilitiesUseCase(repository),
        _Locations(lineLocations),
        ActivityLineEntity.energy,
        initial,
      );
      addTearDown(cubit.close);
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);
      return (cubit, repository);
    }

    test('filters the first page by it and keeps it when the line has it', () async {
      final (cubit, repository) = await open(
        const SelectedLocation(cityId: 13, cityName: 'Cairo', areaId: 2, areaName: 'Maadi'),
        const LocationsEntity(cities: [cairo], remoteCount: 0),
      );
      expect(repository.requests, hasLength(1));
      expect(repository.requests.single.areaId, 2);
      expect(cubit.state.selectedLocation.areaId, 2);
    });

    test('resets to every location and refetches when the line lacks it', () async {
      final (cubit, repository) = await open(
        const SelectedLocation(cityId: 99, cityName: 'Aswan'),
        const LocationsEntity(cities: [cairo], remoteCount: 0),
      );
      expect(repository.requests.first.cityId, 99);
      expect(repository.requests.last.cityId, isNull);
      expect(cubit.state.selectedLocation.isEmpty, isTrue);
    });

    test('drops remote when the line has nothing remote', () async {
      final (cubit, _) = await open(
        const SelectedLocation(isRemote: true),
        const LocationsEntity(cities: [cairo], remoteCount: 0),
      );
      expect(cubit.state.selectedLocation.isEmpty, isTrue);
    });
  });

  test('LocationsEntity.match refreshes names and rejects empty places', () {
    const locations = LocationsEntity(
      cities: [
        LocationCityEntity(
          id: 1,
          name: 'Giza',
          areas: [LocationAreaEntity(id: 5, name: 'Dokki', facilityCount: 0)],
        ),
      ],
      remoteCount: 2,
    );
    expect(
      locations.match(const SelectedLocation(cityId: 1, cityName: 'old')),
      const SelectedLocation(cityId: 1, cityName: 'Giza'),
    );
    expect(locations.match(const SelectedLocation(cityId: 1, areaId: 5)), isNull);
    expect(locations.match(const SelectedLocation(isRemote: true)), isNotNull);
    expect(locations.match(const SelectedLocation()), const SelectedLocation());
  });
}
