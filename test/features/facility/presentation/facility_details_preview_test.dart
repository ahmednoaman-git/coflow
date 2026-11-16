import 'dart:async';

import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:coflow_users_v2/features/facility/domain/domain.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

/// What the home dashboard knows about a profile, with placeholders for the
/// rest.
const _preview = CollapsedFacilityEntity(
  id: 207,
  name: 'SUEZ',
  description: 'Mobile Testing',
  activityLine: ActivityLineEntity.energy,
  accountType: GoAccount(),
  status: FacilityStatus.visible,
  subscriptionStatus: SubscriptionStatus.inactive,
  paymentType: PaymentType.none,
  views: 0,
);

/// A FLOW facility on an active plan, answering the profile when [answer]
/// completes.
class _StubRepository implements FacilityRepository {
  final answer = Completer<void>();
  final serviceRequests = <GetFacilityServicesDto>[];

  @override
  AsyncTask<FacilityProfileEntity> getFacilityProfile(GetFacilityProfileDto dto) =>
      TaskEither(() async {
        await answer.future;
        return Either.right(
          FacilityProfileEntity(
            id: dto.facilityId,
            name: 'SUEZ',
            accountType: const FlowAccount(),
            subscriptionStatus: SubscriptionStatus.inactive,
            status: FacilityStatus.visible,
            paymentType: PaymentType.contact,
            views: 12,
          ),
        );
      });

  @override
  AsyncTask<List<FacilityTicketEntity>> getFacilityTickets(GetFacilityTicketsDto dto) =>
      TaskEither.right(const []);

  @override
  AsyncTask<List<FacilityPromotionEntity>> getFacilityPromotions(GetFacilityPromotionsDto dto) =>
      TaskEither.right(const []);

  @override
  AsyncTask<FacilityServicesEntity> getFacilityServices(GetFacilityServicesDto dto) {
    serviceRequests.add(dto);
    return TaskEither.right(const FacilityServicesEntity(folders: [], rootServices: []));
  }

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is not stubbed');
}

FacilityDetailsCubit _open(
  _StubRepository repository,
  CollapsedFacilityEntity facility, {
  required bool isPreview,
}) {
  final cubit = FacilityDetailsCubit(
    GetFacilityProfileUseCase(repository),
    GetFacilityTicketsUseCase(repository),
    GetFacilityPromotionsUseCase(repository),
    GetFacilityServicesUseCase(repository),
    ToggleFacilitySaveUseCase(repository),
    FacilitySaveEvents(),
    facility,
    isPreview,
  );
  addTearDown(cubit.close);
  return cubit;
}

void main() {
  test('a preview takes its whole summary from the profile', () async {
    final repository = _StubRepository();
    final cubit = _open(repository, _preview, isPreview: true);

    expect(cubit.state.isResolved, isFalse);

    repository.answer.complete();
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.isResolved, isTrue);
    final facility = cubit.state.facility;
    expect(facility.accountType, isA<FlowAccount>());
    expect(facility.subscriptionStatus, SubscriptionStatus.inactive);
    expect(facility.paymentType, PaymentType.contact);
    expect(facility.views, 12);
    expect(facility.name, 'SUEZ');
  });

  test('services are requested with the resolved account type', () async {
    final repository = _StubRepository()..answer.complete();
    final cubit = _open(repository, _preview, isPreview: true);
    await Future<void>.delayed(Duration.zero);

    cubit.ensureServicesLoaded(FacilityServiceType.flow);
    await Future<void>.delayed(Duration.zero);

    expect(repository.serviceRequests.single.accountType, isA<FlowAccount>());
  });

  test("a full card keeps its tabs: the profile doesn't change its subscription", () async {
    final repository = _StubRepository()..answer.complete();
    final card = _preview.copyWith(
      accountType: const ProAccount(),
      subscriptionStatus: SubscriptionStatus.active,
    );
    final cubit = _open(repository, card, isPreview: false);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.isResolved, isTrue);
    expect(cubit.state.facility.accountType, isA<ProAccount>());
    expect(cubit.state.facility.subscriptionStatus, SubscriptionStatus.active);
    expect(cubit.state.facility.paymentType, PaymentType.contact);
  });
}
