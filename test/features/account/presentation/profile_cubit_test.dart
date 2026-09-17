import 'dart:async';

import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/account/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/account/data/models/models.dart';
import 'package:coflow_users_v2/features/account/domain/domain.dart';
import 'package:coflow_users_v2/features/account/presentation/cubit/cubit.dart';
import 'package:coflow_users_v2/features/authentication/domain/repositories/repositories.dart';
import 'package:coflow_users_v2/features/authentication/domain/use_cases/use_cases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

class _ProfileRepository implements ProfileRepository {
  int statisticsCalls = 0;
  bool failStatistics = false;
  Completer<void>? pendingStatistics;
  ProfileStatsEntity statistics = const ProfileStatsEntity(
    calendarEntries: 22,
    businesses: 0,
    purchases: 22,
    gifts: 44,
  );

  @override
  AsyncTask<ProfileEntity> getProfile() => TaskEither.right(
    ProfileMapper.toEntity(
      ProfileModel.fromJson({
        'id': 7,
        'name': 'Ahmed',
        'email': 'ahmed@example.com',
        'phone': '01000000000',
        'gender': 'male',
        'image': 'https://cdn.example.com/current-avatar.png',
      }),
    ),
  );

  @override
  AsyncTask<ProfileStatsEntity> getAccountStatistics() => TaskEither(() async {
    statisticsCalls++;
    await pendingStatistics?.future;
    return failStatistics ? const Left(NetworkFailure('offline')) : Right(statistics);
  });
}

class _AuthenticationRepository implements AuthenticationRepository {
  @override
  AsyncTask<void> logout() => TaskEither.right(null);

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

ProfileCubit _cubit(_ProfileRepository repository) => ProfileCubit(
  GetProfileUseCase(repository),
  LogoutUseCase(_AuthenticationRepository()),
  GetAccountStatisticsUseCase(repository),
);

void main() {
  test('account reentry retrieves the new purchase total from the server', () async {
    final repository = _ProfileRepository();
    final cubit = _cubit(repository);
    addTearDown(cubit.close);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.statisticsManager.data?.purchases, 22);
    repository.statistics = repository.statistics.copyWith(purchases: 23);
    await cubit.refreshStatistics();

    expect(repository.statisticsCalls, 2);
    expect(cubit.statisticsManager.data?.purchases, 23);
  });

  test('statistics failure keeps the successfully fetched identity and avatar', () async {
    final repository = _ProfileRepository()..failStatistics = true;
    final cubit = _cubit(repository);
    addTearDown(cubit.close);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.statisticsManager.isError, isTrue);
    expect(cubit.profileManager.isSuccess, isTrue);
    expect(cubit.user?.image, 'https://cdn.example.com/current-avatar.png');

    repository.failStatistics = false;
    await cubit.refreshStatistics();
    expect(cubit.statisticsManager.data?.purchases, 22);
  });

  test('repeated account taps do not start overlapping statistics requests', () async {
    final repository = _ProfileRepository()..pendingStatistics = Completer<void>();
    final cubit = _cubit(repository);
    addTearDown(cubit.close);
    await Future<void>.delayed(Duration.zero);

    await cubit.refreshStatistics();
    await cubit.refresh();
    expect(repository.statisticsCalls, 1);

    repository.pendingStatistics!.complete();
    await Future<void>.delayed(Duration.zero);
    expect(cubit.statisticsManager.isSuccess, isTrue);
  });
}
