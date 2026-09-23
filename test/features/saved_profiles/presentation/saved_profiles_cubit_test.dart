import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:coflow_users_v2/features/facility/domain/domain.dart';
import 'package:coflow_users_v2/features/saved_profiles/domain/domain.dart';
import 'package:coflow_users_v2/features/saved_profiles/presentation/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

SavedProfileEntity _profile(int id) => SavedProfileEntity(
  facility: CollapsedFacilityEntity(
    id: id,
    name: 'Facility $id',
    description: 'Headline',
    activityLine: ActivityLineEntity.sky,
    accountType: const FlowAccount(),
    status: FacilityStatus.visible,
    subscriptionStatus: SubscriptionStatus.basic,
    paymentType: PaymentType.none,
    views: 0,
  ),
);

/// Serves whatever [profiles] holds at the time of the call, so a test can
/// change what the server has between fetches.
class _StubSavedProfilesRepository implements SavedProfilesRepository {
  _StubSavedProfilesRepository(this.profiles);

  List<SavedProfileEntity> profiles;
  bool fail = false;

  @override
  AsyncTask<List<SavedProfileEntity>> getSavedProfiles() =>
      fail ? TaskEither.left(const NetworkFailure('offline')) : TaskEither.right(List.of(profiles));
}

class _UnusedFacilityRepository implements FacilityRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is not stubbed');
}

void main() {
  Future<SavedProfilesCubit> loadedCubit(_StubSavedProfilesRepository repository) async {
    final facilities = _UnusedFacilityRepository();
    final cubit = SavedProfilesCubit(
      GetSavedProfilesUseCase(repository),
      ToggleFacilitySaveUseCase(facilities),
      ToggleFacilityTrackingUseCase(facilities),
    );
    // The list auto-loads in a microtask; let it land.
    await Future<void>.delayed(Duration.zero);
    return cubit;
  }

  group('SavedProfilesCubit.resync', () {
    test('picks up a facility unsaved elsewhere without a loading state', () async {
      final repository = _StubSavedProfilesRepository([_profile(1), _profile(2)]);
      final cubit = await loadedCubit(repository);
      addTearDown(cubit.close);

      final requestStates = <AsyncState<List<SavedProfileEntity>>>[];
      final subscription = cubit.stream.listen((state) => requestStates.add(state.profilesRequest));
      addTearDown(subscription.cancel);

      repository.profiles = [_profile(2)];
      await cubit.resync();

      expect(cubit.state.profiles.map((profile) => profile.id), [2]);
      expect(requestStates.whereType<AsyncLoading<List<SavedProfileEntity>>>(), isEmpty);
    });

    test('keeps the list on screen when the re-read fails', () async {
      final repository = _StubSavedProfilesRepository([_profile(1), _profile(2)]);
      final cubit = await loadedCubit(repository);
      addTearDown(cubit.close);

      repository.fail = true;
      await cubit.resync();

      expect(cubit.state.profiles.map((profile) => profile.id), [1, 2]);
      expect(cubit.profilesManager.isSuccess, isTrue);
    });
  });
}
