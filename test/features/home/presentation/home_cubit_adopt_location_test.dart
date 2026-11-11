import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/home/domain/dtos/dtos.dart';
import 'package:coflow_users_v2/features/home/domain/entities/entities.dart' hide ActivityLineEntity;
import 'package:coflow_users_v2/features/home/domain/use_cases/get_home_use_case.dart';
import 'package:coflow_users_v2/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

class _Home implements GetHomeUseCase {
  final requests = <HomeRequestDto>[];

  @override
  AsyncTask<HomeEntity> call(HomeRequestDto dto) {
    requests.add(dto);
    return TaskEither.right(
      const HomeEntity(profiles: [], recentlyJoined: [], instructors: []),
    );
  }
}

class _Locations implements GetLocationsUseCase {
  @override
  AsyncTask<LocationsEntity> call({int? activityLineId}) => TaskEither.right(
    const LocationsEntity(
      cities: [
        LocationCityEntity(
          id: 13,
          name: 'Cairo',
          facilityCount: 22,
          areas: [LocationAreaEntity(id: 2, name: 'Maadi', facilityCount: 8)],
        ),
      ],
      remoteCount: 0,
    ),
  );
}

void main() {
  Future<(HomeCubit, _Home)> open() async {
    final home = _Home();
    final cubit = HomeCubit(home, _Locations());
    addTearDown(cubit.close);
    await Future<void>.delayed(Duration.zero);
    return (cubit, home);
  }

  test('takes a location from a line screen when its own list has it', () async {
    final (cubit, home) = await open();
    cubit.adoptLocation(const SelectedLocation(cityId: 13, areaId: 2, areaName: 'Maadi'));
    expect(cubit.state.selectedLocation.areaId, 2);
    expect(cubit.state.selectedLocation.cityName, 'Cairo');
    expect(home.requests.last.areaId, 2);
  });

  test('ignores a location its own list lacks, and repeats of the current one', () async {
    final (cubit, home) = await open();
    final before = home.requests.length;
    cubit.adoptLocation(const SelectedLocation(isRemote: true));
    cubit.adoptLocation(const SelectedLocation(cityId: 99));
    cubit.adoptLocation(const SelectedLocation());
    expect(cubit.state.selectedLocation.isEmpty, isTrue);
    expect(home.requests, hasLength(before));
  });
}
