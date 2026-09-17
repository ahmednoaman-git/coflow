import 'dart:async';

import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:coflow_users_v2/features/facility/domain/domain.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:coflow_users_v2/features/purchase/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

const _facility = CollapsedFacilityEntity(
  id: 191,
  name: 'Facility',
  description: '',
  activityLine: ActivityLineEntity.sky,
  accountType: FlowAccount(),
  status: FacilityStatus.visible,
  subscriptionStatus: SubscriptionStatus.basic,
  paymentType: PaymentType.directPurchase,
  views: 0,
);

const _quote = PurchaseQuoteEntity(totalPrice: 9, finalPrice: 9, couponDiscount: 0);

class _Repository implements PurchaseRepository, CouponRepository {
  final quotes = <Completer<Either<Failure, PurchaseQuoteEntity>>>[];
  final quoteInputs = <SubmitPurchaseDto>[];
  final submissions = <Completer<Either<Failure, PurchaseReceiptEntity>>>[];
  final submitInputs = <SubmitPurchaseDto>[];

  @override
  AsyncTask<List<PurchaseCouponEntity>> getCoupons(GetPurchaseCouponsDto dto) =>
      TaskEither.right(const []);

  @override
  AsyncTask<PurchaseQuoteEntity> getQuote(SubmitPurchaseDto dto) => TaskEither(() {
    quoteInputs.add(dto);
    final result = Completer<Either<Failure, PurchaseQuoteEntity>>();
    quotes.add(result);
    return result.future;
  });

  @override
  AsyncTask<PurchaseReceiptEntity> submit(SubmitPurchaseDto dto) => TaskEither(() {
    submitInputs.add(dto);
    final result = Completer<Either<Failure, PurchaseReceiptEntity>>();
    submissions.add(result);
    return result.future;
  });
}

TicketPurchaseCubit _ticketCubit(_Repository repository) => TicketPurchaseCubit(
  GetPurchaseCouponsUseCase(repository),
  GetPurchaseQuoteUseCase(repository),
  SubmitPurchaseUseCase(repository),
  const TicketPurchaseArgs(
    ticket: FacilityTicketDetailsEntity(
      id: 103,
      name: 'Ticket',
      price: 10,
      currency: '€',
      unlimited: false,
      addOns: [AddOnEntity(id: 99, name: 'Addon', price: 1)],
    ),
    facility: _facility,
    accentColor: Color(0xFF181935),
  ),
);

PromotionPurchaseCubit _promotionCubit(_Repository repository) => PromotionPurchaseCubit(
  GetPurchaseCouponsUseCase(repository),
  GetPurchaseQuoteUseCase(repository),
  SubmitPurchaseUseCase(repository),
  PromotionPurchaseArgs(
    promotion: FacilityPromotionDetailsEntity(
      promotion: FacilityPromotionEntity.package(
        id: 204,
        name: 'Package',
        endDate: DateTime(2026, 10),
        isLiked: false,
        displayPrice: 250,
        currency: 'EGP',
        remainingUnlimited: true,
      ),
    ),
    facility: _facility,
    accentColor: const Color(0xFF181935),
  ),
);

Future<void> _flush() => Future<void>.delayed(Duration.zero);

void main() {
  test('ticket ignores stale quote success and stale errors after selection changes', () async {
    final repository = _Repository();
    final cubit = _ticketCubit(repository);
    addTearDown(cubit.close);
    await _flush();
    cubit.incrementQuantity();
    cubit.toggleAddOn(99);
    await _flush();
    expect(repository.quotes, hasLength(3));
    repository.quotes[2].complete(const Right(_quote));
    await _flush();
    repository.quotes[1].complete(const Left(ValidationFailure('stale')));
    repository.quotes[0].complete(
      const Right(
        PurchaseQuoteEntity(totalPrice: 100, finalPrice: 100, couponDiscount: 0),
      ),
    );
    await _flush();
    expect(cubit.quoteManager.data, _quote);
    expect(cubit.state.quantity, 2);
    expect(repository.quoteInputs.last.addOnIds, [99]);
  });

  test('ticket cannot submit an unquoted selection and can retry a quote failure', () async {
    final repository = _Repository();
    final cubit = _ticketCubit(repository);
    addTearDown(cubit.close);
    await _flush();
    await cubit.submit();
    expect(repository.submissions, isEmpty);
    repository.quotes.single.complete(const Left(ValidationFailure('unavailable')));
    await _flush();
    await cubit.submit();
    expect(repository.submissions, isEmpty);
    final retry = cubit.refreshQuote();
    await _flush();
    repository.quotes.last.complete(const Right(_quote));
    await retry;
    expect(cubit.quoteManager.isSuccess, isTrue);
  });

  test('ticket submission freezes selection, prevents duplicates, and persists receipt', () async {
    final repository = _Repository();
    final cubit = _ticketCubit(repository);
    addTearDown(cubit.close);
    await _flush();
    repository.quotes.single.complete(const Right(_quote));
    await _flush();
    final submit = cubit.submit();
    await cubit.submit();
    cubit.incrementQuantity();
    cubit.toggleAddOn(99);
    cubit.selectCoupon(const PurchaseCouponEntity(id: 3, name: 'Coupon', discountRatio: 10));
    await _flush();
    expect(repository.submissions, hasLength(1));
    expect(cubit.state.quantity, 1);
    expect(cubit.state.selectedAddOnIds, isEmpty);
    expect(cubit.state.selectedCoupon, isNull);
    expect(identical(repository.quoteInputs.single, repository.submitInputs.single), isTrue);
    repository.submissions.single.complete(const Right(PurchaseReceiptEntity(id: 761)));
    await submit;
    expect(cubit.submitManager.data?.id, 761);
    await cubit.submit();
    expect(repository.submissions, hasLength(1));
  });

  test('explicit submit retry is possible after a server failure', () async {
    final repository = _Repository();
    final cubit = _ticketCubit(repository);
    addTearDown(cubit.close);
    await _flush();
    repository.quotes.single.complete(const Right(_quote));
    await _flush();
    final failed = cubit.submit();
    await _flush();
    repository.submissions.single.complete(const Left(ValidationFailure('sold out')));
    await failed;
    expect(cubit.submitManager.isError, isTrue);
    expect(cubit.inputsLocked, isFalse);
    final retried = cubit.submit();
    await _flush();
    repository.submissions.last.complete(const Right(PurchaseReceiptEntity(id: 762)));
    await retried;
    expect(cubit.submitManager.data?.id, 762);
    expect(repository.submissions, hasLength(2));
  });

  test('promotion submits only the latest quoted selection and prevents duplicates', () async {
    final repository = _Repository();
    final cubit = _promotionCubit(repository);
    addTearDown(cubit.close);
    await _flush();
    cubit.incrementQuantity();
    await _flush();
    repository.quotes.last.complete(const Right(_quote));
    await _flush();
    repository.quotes.first.complete(const Left(NetworkFailure('old request')));
    await _flush();
    final submit = cubit.submit();
    await cubit.submit();
    cubit.decrementQuantity();
    await _flush();
    expect(repository.submitInputs.single.toJson(), {'promotion_id': 204, 'quantity': 2});
    expect(cubit.state.quantity, 2);
    repository.submissions.single.complete(const Right(PurchaseReceiptEntity(id: 763)));
    await submit;
    expect(cubit.submitManager.data?.id, 763);
  });

  test('late requests do not emit after checkout is closed', () async {
    final repository = _Repository();
    final cubit = _ticketCubit(repository);
    await _flush();
    await cubit.close();
    repository.quotes.single.complete(const Right(_quote));
    await _flush();
    expect(cubit.isClosed, isTrue);
  });
}
