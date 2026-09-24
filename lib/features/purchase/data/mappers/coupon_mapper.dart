import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class CouponMapper {
  /// Null for a held coupon whose definition is gone (`coupon: null`) —
  /// there is nothing left to apply.
  ///
  /// `applies_on` scopes the coupon: `purchases` covers everything the
  /// facility sells, `tickets` / `promotions` every one of that kind unless
  /// the coupon lists some, and anything else only what it lists.
  static PurchaseCouponEntity? toEntity(CouponModel model) {
    final coupon = model.coupon;
    if (coupon == null) return null;

    final scope = coupon.appliesOn?.trim().toLowerCase();
    final tickets = coupon.tickets.map(_target).toList(growable: false);
    final promotions = coupon.promotions.map(_target).toList(growable: false);

    return PurchaseCouponEntity(
      id: coupon.id,
      facilityId: coupon.facilityId,
      discountRatio: coupon.discountRatio,
      coversAllTickets: scope == 'purchases' || (scope == 'tickets' && tickets.isEmpty),
      coversAllPromotions: scope == 'purchases' || (scope == 'promotions' && promotions.isEmpty),
      tickets: tickets,
      promotions: promotions,
    );
  }

  static PurchaseCouponTarget _target(CouponTargetModel model) =>
      (id: model.id, name: model.name?.trim() ?? '');
}
