import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:coflow_users_v2/features/facility/domain/domain.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

/// CLYMB as a results list saw it while it still sold in the app.
const _staleCard = CollapsedFacilityEntity(
  id: 194,
  name: 'CLYMB Abu Dhabi',
  description: 'Indoor Skydiving & Climbing',
  activityLine: ActivityLineEntity.earth,
  accountType: ProAccount(),
  status: FacilityStatus.visible,
  subscriptionStatus: SubscriptionStatus.active,
  paymentType: PaymentType.directPurchase,
  views: 0,
);

class _StubRepository implements FacilityRepository {
  _StubRepository(this.paymentType);

  final PaymentType? paymentType;

  @override
  AsyncTask<FacilityProfileEntity> getFacilityProfile(GetFacilityProfileDto dto) =>
      TaskEither.right(
        FacilityProfileEntity(
          id: dto.facilityId,
          name: 'CLYMB Abu Dhabi',
          paymentType: paymentType,
        ),
      );

  // Built eagerly by the cubit's constructor but never executed here.
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

Future<FacilityDetailsCubit> _openWith(PaymentType? profilePaymentType) async {
  final repository = _StubRepository(profilePaymentType);
  final cubit = FacilityDetailsCubit(
    GetFacilityProfileUseCase(repository),
    GetFacilityTicketsUseCase(repository),
    GetFacilityPromotionsUseCase(repository),
    GetFacilityServicesUseCase(repository),
    ToggleFacilitySaveUseCase(repository),
    _staleCard,
  );
  await Future<void>.delayed(Duration.zero); // let the profile load
  return cubit;
}

void main() {
  group('FacilityDetailsCubit payment type', () {
    test('the freshly read profile overrides a stale list card', () async {
      final cubit = await _openWith(PaymentType.contact);

      expect(cubit.state.facility.paymentType, PaymentType.contact);
      expect(PurchaseCtaResolver.allowsInAppPurchase(cubit.state.facility), isFalse);
    });

    test("keeps the card's value when the profile omits it", () async {
      final cubit = await _openWith(null);

      expect(cubit.state.facility.paymentType, PaymentType.directPurchase);
    });
  });
}
