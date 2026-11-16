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

FacilityDetailsCubit _cubit(_StubRepository repository, [FacilitySaveEvents? events]) {
  return FacilityDetailsCubit(
    GetFacilityProfileUseCase(repository),
    GetFacilityTicketsUseCase(repository),
    GetFacilityPromotionsUseCase(repository),
    GetFacilityServicesUseCase(repository),
    ToggleFacilitySaveUseCase(repository),
    events ?? FacilitySaveEvents(),
    _facility,
    null,
  );
}

Future<void> _settled() => Future<void>.delayed(const Duration(milliseconds: 20));

void main() {
  setUp(() => FacilityDetailsCubit.saveSettle = Duration.zero);

  group('FacilityDetailsCubit.toggleSave', () {
    test('flips the flag and calls the endpoint once', () async {
      final repository = _StubRepository();
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero); // let the profile load

      expect(cubit.profileManager.data?.isSaved, isFalse);

      cubit.toggleSave();
      await _settled();

      expect(cubit.profileManager.data?.isSaved, isTrue);
      expect(repository.saveCalls, 1);
      expect(cubit.state.saveRequest, const AsyncState<bool>.success(true));
    });

    test('unsaves a saved facility through the same toggle', () async {
      final repository = _StubRepository(isSaved: true);
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);

      cubit.toggleSave();
      await _settled();

      expect(cubit.profileManager.data?.isSaved, isFalse);
      expect(repository.saveCalls, 1);
    });

    test('rolls the flag back when the call fails', () async {
      final repository = _StubRepository()..failToggles = true;
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);

      cubit.toggleSave();
      await _settled();

      expect(cubit.profileManager.data?.isSaved, isFalse);
      expect(cubit.state.saveRequest.isError, isTrue);
    });

    test('un-saving clears tracking, the way the backend does', () async {
      // The backend stores tracking against the saved row, so `save/{id}`
      // removing the save also clears `has_track`.
      final repository = _StubRepository(isSaved: true, isTracked: true);
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);

      cubit.toggleSave();
      await _settled();

      expect(cubit.profileManager.data?.isSaved, isFalse);
      expect(cubit.profileManager.data?.isTracked, isFalse);
    });

    test('saving leaves an already-tracked facility tracked', () async {
      final repository = _StubRepository(isTracked: true);
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);

      cubit.toggleSave();
      await _settled();

      expect(cubit.profileManager.data?.isSaved, isTrue);
      expect(cubit.profileManager.data?.isTracked, isTrue);
    });

    test('ignores a tap before the profile has loaded', () async {
      final repository = _StubRepository();
      final cubit = _cubit(repository);

      cubit.toggleSave();
      await _settled();

      expect(repository.saveCalls, 0);
    });
    test('spamming the bookmark sends one call, or none when the taps cancel out', () async {
      final repository = _StubRepository();
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);

      for (var i = 0; i < 5; i++) {
        cubit.toggleSave();
      }
      expect(cubit.profileManager.data?.isSaved, isTrue, reason: 'shown at once');
      await _settled();
      expect(repository.saveCalls, 1);

      for (var i = 0; i < 4; i++) {
        cubit.toggleSave();
      }
      await _settled();
      expect(repository.saveCalls, 1);
      expect(cubit.profileManager.data?.isSaved, isTrue);
    });

    test('an unsave undone before it was sent keeps tracking', () async {
      final repository = _StubRepository(isSaved: true, isTracked: true);
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);

      cubit.toggleSave();
      expect(cubit.profileManager.data?.isTracked, isFalse);
      cubit.toggleSave();
      await _settled();

      expect(repository.saveCalls, 0);
      expect(cubit.profileManager.data?.isSaved, isTrue);
      expect(cubit.profileManager.data?.isTracked, isTrue);
    });

    test('a tap just before leaving is still sent', () async {
      final repository = _StubRepository();
      final cubit = _cubit(repository);
      await Future<void>.delayed(Duration.zero);
      FacilityDetailsCubit.saveSettle = const Duration(seconds: 5);

      cubit.toggleSave();
      await cubit.close();
      await Future<void>.delayed(Duration.zero);

      expect(repository.saveCalls, 1);
    });
  });

  group('FacilityDetailsCubit and saves made on other screens', () {
    FacilitySaveChange elsewhere({required bool saved, bool tracked = false, int id = 184}) =>
        FacilitySaveChange(facilityId: id, isSaved: saved, isTracked: tracked, source: Object());

    test('an unsave from another screen clears the bookmark and the bell', () async {
      final events = FacilitySaveEvents();
      final repository = _StubRepository(isSaved: true, isTracked: true);
      final cubit = _cubit(repository, events);
      addTearDown(cubit.close);
      await Future<void>.delayed(Duration.zero);

      events.report(elsewhere(saved: false));

      expect(cubit.profileManager.data?.isSaved, isFalse);
      expect(cubit.profileManager.data?.isTracked, isFalse);
      expect(repository.saveCalls, 0);
    });

    test('the next tap starts from the flag as reported, not the one first loaded', () async {
      final events = FacilitySaveEvents();
      final repository = _StubRepository(isSaved: true);
      final cubit = _cubit(repository, events);
      addTearDown(cubit.close);
      await Future<void>.delayed(Duration.zero);

      // Made the toggle from the loaded "saved", then the facility was unsaved
      // elsewhere.
      cubit.toggleSave();
      cubit.toggleSave();
      await _settled();
      events.report(elsewhere(saved: false));

      cubit.toggleSave();
      await _settled();

      expect(cubit.profileManager.data?.isSaved, isTrue);
      expect(repository.saveCalls, 1);
    });

    test('taps not yet sent give way to the reported change', () async {
      final events = FacilitySaveEvents();
      final repository = _StubRepository();
      final cubit = _cubit(repository, events);
      addTearDown(cubit.close);
      await Future<void>.delayed(Duration.zero);
      FacilityDetailsCubit.saveSettle = const Duration(milliseconds: 20);

      cubit.toggleSave();
      events.report(elsewhere(saved: true, tracked: true));
      await Future<void>.delayed(const Duration(milliseconds: 60));

      expect(repository.saveCalls, 0);
      expect(cubit.profileManager.data?.isSaved, isTrue);
      expect(cubit.profileManager.data?.isTracked, isTrue);
    });

    test("ignores other facilities and its own reports, and reports what it settles", () async {
      final events = FacilitySaveEvents();
      final reported = <FacilitySaveChange>[];
      events.changes.listen(reported.add);
      final repository = _StubRepository(isSaved: true, isTracked: true);
      final cubit = _cubit(repository, events);
      addTearDown(cubit.close);
      await Future<void>.delayed(Duration.zero);

      events.report(elsewhere(saved: false, id: 7));
      expect(cubit.profileManager.data?.isSaved, isTrue);

      cubit.toggleSave();
      await _settled();

      final own = reported.last;
      expect((own.facilityId, own.isSaved, own.isTracked), (184, false, false));
      expect(own.source, same(cubit));
      expect(cubit.profileManager.data?.isSaved, isFalse);
    });
  });
}
