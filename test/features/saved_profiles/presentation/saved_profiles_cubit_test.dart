import 'dart:async';

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

  // Read on every run, as a real request is, so a refresh sees the change.
  @override
  AsyncTask<List<SavedProfileEntity>> getSavedProfiles() => TaskEither(
    () async => fail ? const Left(NetworkFailure('offline')) : Right(List.of(profiles)),
  );
}

/// Toggle endpoints answered by hand: each call waits on [answer], and [calls]
/// counts them.
class _FacilityRepository implements FacilityRepository {
  int calls = 0;
  Completer<Result<void>> answer = Completer();

  AsyncTask<void> _toggle() => TaskEither(() {
    calls++;
    return answer.future;
  });

  @override
  AsyncTask<void> toggleFacilitySave(ToggleFacilitySaveDto dto) => _toggle();

  @override
  AsyncTask<void> toggleFacilityTracking(ToggleFacilityTrackingDto dto) => _toggle();

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is not stubbed');
}

void main() {
  Future<SavedProfilesCubit> loadedCubit(
    _StubSavedProfilesRepository repository, [
    _FacilityRepository? facilityRepository,
    FacilitySaveEvents? events,
  ]) async {
    final facilities = facilityRepository ?? _FacilityRepository();
    final cubit = SavedProfilesCubit(
      GetSavedProfilesUseCase(repository),
      ToggleFacilitySaveUseCase(facilities),
      ToggleFacilityTrackingUseCase(facilities),
      events ?? FacilitySaveEvents(),
    );
    // The list auto-loads in a microtask; let it land.
    await Future<void>.delayed(Duration.zero);
    return cubit;
  }

  group('SavedProfilesCubit.refresh', () {
    test('picks up a facility unsaved elsewhere without a loading state', () async {
      final repository = _StubSavedProfilesRepository([_profile(1), _profile(2)]);
      final cubit = await loadedCubit(repository);
      addTearDown(cubit.close);

      final requestStates = <AsyncState<List<SavedProfileEntity>>>[];
      final subscription = cubit.stream.listen((state) => requestStates.add(state.profilesRequest));
      addTearDown(subscription.cancel);

      repository.profiles = [_profile(2)];
      await cubit.refresh();

      expect(cubit.state.profiles.map((profile) => profile.id), [2]);
      expect(requestStates.whereType<AsyncLoading<List<SavedProfileEntity>>>(), isEmpty);
    });

    test('keeps the list on screen when the re-read fails', () async {
      final repository = _StubSavedProfilesRepository([_profile(1), _profile(2)]);
      final cubit = await loadedCubit(repository);
      addTearDown(cubit.close);

      repository.fail = true;
      await cubit.refresh();

      expect(cubit.state.profiles.map((profile) => profile.id), [1, 2]);
      expect(cubit.profilesManager.isSuccess, isTrue);
      expect(cubit.profilesManager.isError, isFalse);
    });
  });

  group('optimistic verbs over a refresh', () {
    test('a card being unsaved stays gone through a refresh, and comes back if refused', () async {
      final repository = _StubSavedProfilesRepository([_profile(1), _profile(2)]);
      final facilities = _FacilityRepository();
      final cubit = await loadedCubit(repository, facilities);
      addTearDown(cubit.close);

      final unsave = cubit.removeUnsaved(_profile(1));
      await Future<void>.delayed(Duration.zero);
      expect(cubit.state.profiles.map((profile) => profile.id), [2]);
      expect(facilities.calls, 1);

      // The server hasn't taken the unsave yet when the list is re-read.
      await cubit.refresh();
      expect(cubit.state.profiles.map((profile) => profile.id), [2]);

      facilities.answer.complete(const Left(NetworkFailure('offline')));
      await unsave;
      expect(cubit.state.profiles.map((profile) => profile.id), [1, 2]);
      expect(
        cubit.state.profilesRequest,
        isA<AsyncSuccess<List<SavedProfileEntity>>>().having(
          (state) => state.failure,
          'failure',
          isA<NetworkFailure>(),
        ),
      );
    });

    test('a bell still settling keeps what the user tapped through a refresh', () async {
      SavedProfilesCubit.trackingSettle = const Duration(milliseconds: 20);
      final repository = _StubSavedProfilesRepository([_profile(1)]);
      final facilities = _FacilityRepository()..answer.complete(const Right(null));
      final cubit = await loadedCubit(repository, facilities);
      addTearDown(cubit.close);

      cubit.toggleTracking(cubit.state.profiles.single);
      expect(cubit.state.profiles.single.isTracked, isTrue);

      await cubit.refresh();
      expect(cubit.state.profiles.single.isTracked, isTrue, reason: 'not sent yet');

      await Future<void>.delayed(const Duration(milliseconds: 60));
      expect(facilities.calls, 1);
      expect(cubit.state.profiles.single.isTracked, isTrue);
    });
  });

  group('saves made on other screens', () {
    FacilitySaveChange elsewhere(int id, {required bool saved, bool tracked = false}) =>
        FacilitySaveChange(facilityId: id, isSaved: saved, isTracked: tracked, source: Object());

    test('an unsave from a facility profile drops the card at once', () async {
      final events = FacilitySaveEvents();
      final repository = _StubSavedProfilesRepository([_profile(1), _profile(2)]);
      final cubit = await loadedCubit(repository, null, events);
      addTearDown(cubit.close);

      events.report(elsewhere(1, saved: false));

      expect(cubit.state.profiles.map((profile) => profile.id), [2]);
    });

    test('a tracking change relights the bell and drops taps not yet sent', () async {
      SavedProfilesCubit.trackingSettle = const Duration(milliseconds: 20);
      final events = FacilitySaveEvents();
      final repository = _StubSavedProfilesRepository([_profile(1)]);
      final facilities = _FacilityRepository()..answer.complete(const Right(null));
      final cubit = await loadedCubit(repository, facilities, events);
      addTearDown(cubit.close);

      cubit.toggleTracking(cubit.state.profiles.single);
      events.report(elsewhere(1, saved: true));
      await Future<void>.delayed(const Duration(milliseconds: 60));

      expect(facilities.calls, 0);
      expect(cubit.state.profiles.single.isTracked, isFalse);
    });

    test('a facility saved elsewhere is read in with the list', () async {
      final events = FacilitySaveEvents();
      final repository = _StubSavedProfilesRepository([_profile(1)]);
      final cubit = await loadedCubit(repository, null, events);
      addTearDown(cubit.close);

      repository.profiles = [_profile(1), _profile(2)];
      events.report(elsewhere(2, saved: true));
      expect(cubit.state.profilesRequest.isRefreshing, isTrue, reason: 'no skeleton');
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.profiles.map((profile) => profile.id), [1, 2]);
    });

    test('a confirmed unsave is reported to the other screens', () async {
      final events = FacilitySaveEvents();
      final reported = <FacilitySaveChange>[];
      events.changes.listen(reported.add);
      final repository = _StubSavedProfilesRepository([_profile(1)]);
      final facilities = _FacilityRepository()..answer.complete(const Right(null));
      final cubit = await loadedCubit(repository, facilities, events);
      addTearDown(cubit.close);

      await cubit.removeUnsaved(cubit.state.profiles.single);

      expect(reported, hasLength(1));
      expect((reported.single.facilityId, reported.single.isSaved), (1, false));
      expect(cubit.state.profiles, isEmpty);
    });

    test('a refused unsave reports nothing', () async {
      final events = FacilitySaveEvents();
      final reported = <FacilitySaveChange>[];
      events.changes.listen(reported.add);
      final repository = _StubSavedProfilesRepository([_profile(1)]);
      final facilities = _FacilityRepository()
        ..answer.complete(const Left(NetworkFailure('offline')));
      final cubit = await loadedCubit(repository, facilities, events);
      addTearDown(cubit.close);

      await cubit.removeUnsaved(cubit.state.profiles.single);

      expect(reported, isEmpty);
    });
  });
}
