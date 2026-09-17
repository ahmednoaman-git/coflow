import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:coflow_users_v2/features/facility/domain/domain.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

const _facility = CollapsedFacilityEntity(
  id: 184,
  name: 'PRO Profile',
  description: 'Mobile Profile',
  activityLine: ActivityLineEntity.sky,
  accountType: FlowAccount(),
  status: FacilityStatus.visible,
  subscriptionStatus: SubscriptionStatus.basic,
  paymentType: PaymentType.none,
  views: 0,
);

/// Stubs only what the details cubit reaches for; everything else would be a
/// bug if it were called from these tests.
class _StubRepository implements FacilityRepository {
  _StubRepository({this.isSaved = false, this.isTracked = false});

  bool isSaved;
  bool isTracked;

  /// Set to fail the next toggle, so the rollback path can be exercised.
  bool failToggles = false;

  int saveCalls = 0;

  @override
  AsyncTask<FacilityProfileEntity> getFacilityProfile(GetFacilityProfileDto dto) {
    return TaskEither.right(
      FacilityProfileEntity(
        id: dto.facilityId,
        name: 'PRO Profile',
        isSaved: isSaved,
        isTracked: isTracked,
      ),
    );
  }

  @override
  AsyncTask<void> toggleFacilitySave(ToggleFacilitySaveDto dto) {
    saveCalls++;
    return failToggles ? TaskEither.left(const NetworkFailure('offline')) : TaskEither.right(null);
  }

  // The remaining requests are built eagerly by the cubit's constructor but
  // never executed here, so an empty result is enough.
  @override
  AsyncTask<List<FacilityTicketEntity>> getFacilityTickets(GetFacilityTicketsDto dto) =>
      TaskEither.right(const []);

  @override
  AsyncTask<List<FacilityPromotionEntity>> getFacilityPromotions(GetFacilityPromotionsDto dto) =>
      TaskEither.right(const []);

  @override
  AsyncTask<FacilityServicesEntity> getFacilityServices(GetFacilityServicesDto dto) =>
      TaskEither.right(const FacilityServicesEntity(folders: [], rootServices: []));

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is not stubbed');
}

FacilityDetailsCubit _cubit(_StubRepository repository) {
  return FacilityDetailsCubit(
    GetFacilityProfileUseCase(repository),
    GetFacilityTicketsUseCase(repository),
    GetFacilityPromotionsUseCase(repository),
    GetFacilityServicesUseCase(repository),
    ToggleFacilitySaveUseCase(repository),
    _facility,
  );
}

void main() {
  group('FacilityDetailsCubit.toggleSave', () {
    test('flips the flag and calls the endpoint once', () async {
      final repository = _StubRepository();
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero); // let the profile load

      expect(cubit.profileManager.data?.isSaved, isFalse);

      await cubit.toggleSave();

      expect(cubit.profileManager.data?.isSaved, isTrue);
      expect(repository.saveCalls, 1);
      expect(cubit.saveManager.isError, isFalse);
    });

    test('unsaves a saved facility through the same toggle', () async {
      final repository = _StubRepository(isSaved: true);
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);

      await cubit.toggleSave();

      expect(cubit.profileManager.data?.isSaved, isFalse);
      expect(repository.saveCalls, 1);
    });

    test('rolls the flag back when the call fails', () async {
      final repository = _StubRepository()..failToggles = true;
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);

      await cubit.toggleSave();

      expect(cubit.profileManager.data?.isSaved, isFalse);
      expect(cubit.saveManager.isError, isTrue);
    });

    test('un-saving clears tracking, the way the backend does', () async {
      // The backend stores tracking against the saved row, so `save/{id}`
      // removing the save also clears `has_track`.
      final repository = _StubRepository(isSaved: true, isTracked: true);
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);

      await cubit.toggleSave();

      expect(cubit.profileManager.data?.isSaved, isFalse);
      expect(cubit.profileManager.data?.isTracked, isFalse);
    });

    test('saving leaves an already-tracked facility tracked', () async {
      final repository = _StubRepository(isTracked: true);
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);

      await cubit.toggleSave();

      expect(cubit.profileManager.data?.isSaved, isTrue);
      expect(cubit.profileManager.data?.isTracked, isTrue);
    });

    test('ignores a tap before the profile has loaded', () async {
      final repository = _StubRepository();
      final cubit = _cubit(repository);

      await cubit.toggleSave();

      expect(repository.saveCalls, 0);
    });
  });
}
