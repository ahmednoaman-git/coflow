import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/data/mappers/activity_line_mapper.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/data/mappers/facility_promotion_mapper.dart';
import 'package:coflow_users_v2/features/facility/data/models/facility_promotion_model.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';

import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class UserPurchaseMapper {
  /// Flattens the list endpoints' per-facility groups into rows, each stamped
  /// with its facility (grouping is redone by `PurchaseGrouping`).
  static List<UserPurchaseEntity> fromGroups(List<PurchaseFacilityGroupModel> groups) => [
    for (final group in groups)
      for (final purchase in group.purchases)
        toEntity(
          purchase,
          facilityId: group.id,
          facilityName: group.name,
          activityLineId: group.tags.map((tag) => tag.activityLineId).nonNulls.firstOrNull,
        ),
  ];

  /// [facilityId] and [facilityName] come from the enclosing group, when there
  /// is one; a lone row (`purchases/{id}`) falls back to its own facility.
  /// [activityLineId] lets a row without a facility record (a gift) still open
  /// its facility, as a preview.
  static UserPurchaseEntity toEntity(
    UserPurchaseModel model, {
    int? facilityId,
    String? facilityName,
    int? activityLineId,
  }) {
    final facilityModel = model.facility;
    final resolvedId = facilityId ?? model.facilityId ?? facilityModel?.id ?? 0;
    final resolvedName = _firstNonEmpty([facilityName, facilityModel?.name]) ?? '';
    final facility = facilityModel != null
        ? ActivityLineMapper.toFacilityEntity(facilityModel)
        : _facilityPreview(resolvedId, resolvedName, activityLineId);

    final paidAmount = _sumPayments(model.payments, 'paid');
    final refundedAt = model.payments
        .where((payment) => _isStatus(payment.status, 'refund'))
        .map((payment) => payment.createdAt?.toLocal())
        .nonNulls
        .fold<DateTime?>(null, (latest, at) => latest == null || at.isAfter(latest) ? at : latest);

    final promotionModel = model.promotion;

    return UserPurchaseEntity(
      id: model.id,
      name: model.name?.trim() ?? '',
      kind: PurchaseKind.fromApi(model.type),
      status: PurchaseStatus.fromApi(model.status),
      isGift: model.gift ?? false,
      facilityId: resolvedId,
      facilityName: resolvedName,
      facility: facility,
      isFacilityPreview: facilityModel == null && facility != null,
      currency: model.currency?.trim() ?? '',
      createdAt: model.createdAt?.toLocal(),
      expireDate: model.expireDate,
      quantity: model.quantity ?? 1,
      price: _toDouble(model.price),
      addOnsPrice: _toDouble(model.addonsPrice),
      couponDiscount: _toDouble(model.discountCoupon),
      totalPrice: _toDouble(model.totalPrice),
      finalPrice: _toDouble(model.finalPrice),
      refundAmount: _toDouble(model.refund),
      paidAmount: paidAmount,
      refundedAt: refundedAt,
      tickets: model.tickets.map(_toTicket).toList(growable: false),
      addOns: model.addons.map(_toAddOn).toList(growable: false),
      promotion: promotionModel == null ? null : _toPromotion(promotionModel),
      promotionValidityDays: promotionModel?.validityDays,
      coupon: switch (model.coupon) {
        final coupon? => _toCoupon(coupon),
        null => null,
      },
      sourcePurchase: switch (model.relatedPurchase) {
        final related? => toEntity(related),
        null => null,
      },
      appliedPurchase: switch (model.couponPurchase) {
        final applied? => toEntity(applied),
        null => null,
      },
    );
  }

  /// What the facility screen needs to open at once, for a row that carried
  /// no facility record; the screen fills in the rest from the profile it
  /// loads (the Home dashboard opens facilities the same way).
  static CollapsedFacilityEntity? _facilityPreview(int id, String name, int? activityLineId) {
    if (id <= 0 || name.isEmpty || activityLineId == null) return null;

    return CollapsedFacilityEntity(
      id: id,
      name: name,
      description: '',
      activityLine: ActivityLineEntity.fromId(activityLineId),
      accountType: const GoAccount(),
      status: FacilityStatus.visible,
      subscriptionStatus: SubscriptionStatus.inactive,
      paymentType: PaymentType.none,
      views: 0,
    );
  }

  static PurchasedTicketEntity _toTicket(PurchasedTicketModel model) {
    final unlimited = model.unlimited ?? false;

    return PurchasedTicketEntity(
      id: model.id,
      name: model.name?.trim() ?? '',
      quantity: unlimited ? null : model.quantity,
      used: model.used ?? 0,
      unlimited: unlimited,
      validityDays: model.ticket?.validityDays,
      expireDate: model.expireDate,
      isExpired: _isStatus(model.status, 'expire'),
      accessNames: _names(model.services.map((service) => service.name)),
    );
  }

  static PurchasedAddOnEntity _toAddOn(PurchasedAddOnModel model) => PurchasedAddOnEntity(
    name: model.name?.trim() ?? '',
    quantity: model.quantity ?? 1,
    price: _toDouble(model.finalPrice),
  );

  static GiftCouponEntity _toCoupon(GiftCouponModel model) {
    final scope = CouponScope.fromApi(model.appliesOn);
    final targets = switch (scope) {
      CouponScope.tickets => model.tickets,
      CouponScope.promotions => model.promotions,
      CouponScope.purchases || CouponScope.unknown => const <NamedItemModel>[],
    };

    return GiftCouponEntity(
      discountRatio: _toDouble(model.discountRatio),
      validityDays: model.validityDays,
      unlimited: model.unlimited ?? false,
      scope: scope,
      targetNames: _names(targets.map((target) => target.name)),
    );
  }

  /// The promotion only feeds "Promotion Information"; one the facility
  /// mapper rejects (e.g. a Buy & Get without exactly one reward) hides that
  /// section instead of failing the row.
  static FacilityPromotionEntity? _toPromotion(FacilityPromotionModel model) {
    try {
      return FacilityPromotionMapper.toEntity(model);
    } catch (_) {
      return null;
    }
  }

  static double _sumPayments(List<PurchasePaymentModel> payments, String status) => payments
      .where((payment) => _isStatus(payment.status, status))
      .fold<double>(0, (sum, payment) => sum + _toDouble(payment.amount));

  static bool _isStatus(String? value, String status) => value?.trim().toLowerCase() == status;

  /// The non-blank names, trimmed.
  static List<String> _names(Iterable<String?> names) => names
      .map((name) => name?.trim())
      .nonNulls
      .where((name) => name.isNotEmpty)
      .toList(growable: false);

  static double _toDouble(num? value) => value?.toDouble() ?? 0;

  static String? _firstNonEmpty(List<String?> values) {
    for (final value in values) {
      final trimmed = value?.trim();
      if (trimmed != null && trimmed.isNotEmpty) return trimmed;
    }
    return null;
  }
}
