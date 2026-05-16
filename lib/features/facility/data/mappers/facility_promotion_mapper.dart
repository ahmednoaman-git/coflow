import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class FacilityPromotionMapper {
  static FacilityPromotionEntity toEntity(FacilityPromotionModel model) {
    return switch (model.type.trim().toLowerCase()) {
      'discount' => FacilityPromotionEntity.discount(
        id: model.id,
        name: model.name,
        endDate: model.endDate,
        isLiked: model.hasLike ?? false,
        discountRatio: model.discountRatio ?? 0,
        discountFor: _mapDiscountFor(model.id, model.discountFor),
      ),
      'package' => FacilityPromotionEntity.package(
        id: model.id,
        name: model.name,
        endDate: model.endDate,
        isLiked: model.hasLike ?? false,
        displayPrice: _resolveDisplayPrice(model),
        currency: model.currency ?? '',
        tickets: _mapTicketLines(model.tickets),
        remainingUnlimited: model.paymentUnlimited ?? false,
        remainingCount: _resolveRemainingCount(model),
      ),
      'buy_get' => _mapBuyGetPromotion(model),
      _ => throw FormatException(
        'Unsupported facility promotion type: ${model.type}',
      ),
    };
  }

  static FacilityPromotionEntity _mapBuyGetPromotion(FacilityPromotionModel model) {
    final hasGiftReward = model.gift != null;
    final hasTicketReward =
        (model.getTickets ?? const <FacilityPromotionTicketLineModel>[]).isNotEmpty;
    final hasCouponReward = (model.coupons ?? const <FacilityPromotionCouponModel>[]).isNotEmpty;

    final rewardSourceCount = [
      hasGiftReward,
      hasTicketReward,
      hasCouponReward,
    ].where((hasReward) => hasReward).length;

    if (rewardSourceCount != 1) {
      throw FormatException(
        'Buy & Get promotion ${model.id} must contain exactly one reward source.',
      );
    }

    final reward = switch ((hasGiftReward, hasTicketReward, hasCouponReward)) {
      (true, false, false) => FacilityPromotionRewardEntity.gift(
        giftName: _mapGiftName(model.gift),
      ),
      (false, true, false) => FacilityPromotionRewardEntity.tickets(
        tickets: _mapTicketLines(model.getTickets),
      ),
      (false, false, true) => FacilityPromotionRewardEntity.coupons(
        coupons: _mapCoupons(model.coupons),
      ),
      _ => throw FormatException(
        'Buy & Get promotion ${model.id} has an invalid reward configuration.',
      ),
    };

    return FacilityPromotionEntity.buyGet(
      id: model.id,
      name: model.name,
      endDate: model.endDate,
      isLiked: model.hasLike ?? false,
      displayPrice: _resolveDisplayPrice(model),
      currency: model.currency ?? '',
      buyTickets: _mapTicketLines(model.tickets),
      reward: reward,
      remainingUnlimited: model.paymentUnlimited ?? false,
      remainingCount: _resolveRemainingCount(model),
    );
  }

  static List<FacilityPromotionTicketLineEntity> _mapTicketLines(
    List<FacilityPromotionTicketLineModel>? models,
  ) {
    return (models ?? const <FacilityPromotionTicketLineModel>[])
        .map(
          (model) => FacilityPromotionTicketLineEntity(
            name: _resolveTicketName(model),
            count: model.count,
            unlimited: model.unlimited ?? false,
          ),
        )
        .toList(growable: false);
  }

  static List<FacilityPromotionCouponEntity> _mapCoupons(
    List<FacilityPromotionCouponModel>? models,
  ) {
    return (models ?? const <FacilityPromotionCouponModel>[])
        .map(
          (model) => FacilityPromotionCouponEntity(
            discountRatio: model.discountRatio ?? 0,
            appliesOn: _mapCouponAppliesOn(model.appliesOn),
          ),
        )
        .toList(growable: false);
  }

  static double _resolveDisplayPrice(FacilityPromotionModel model) {
    return model.discountPrice ?? model.price ?? 0;
  }

  static int? _resolveRemainingCount(FacilityPromotionModel model) {
    if (model.paymentUnlimited ?? false) {
      return null;
    }

    return model.paymentRemain ?? 0;
  }

  static String _resolveTicketName(FacilityPromotionTicketLineModel model) {
    final ticketName = model.ticket?.name?.trim();
    if (ticketName == null || ticketName.isEmpty) {
      return facilityPromotionFallbackTicketName;
    }

    return ticketName;
  }

  static String _mapGiftName(Object? gift) {
    if (gift case String value when value.trim().isNotEmpty) {
      return value.trim();
    }

    if (gift case Map<String, dynamic> data) {
      for (final key in const ['name', 'title', 'gift', 'description']) {
        final candidate = data[key];
        if (candidate case String value when value.trim().isNotEmpty) {
          return value.trim();
        }
      }
    }

    throw FormatException('Gift reward is missing a usable display name.');
  }

  static FacilityPromotionAppliesOn _mapDiscountFor(int promotionId, String? rawValue) {
    final normalizedValue = rawValue?.trim();
    if (normalizedValue == null || normalizedValue.isEmpty) {
      throw FormatException(
        'Discount promotion $promotionId is missing discount_for.',
      );
    }

    return switch (normalizedValue.toLowerCase()) {
      'ticket' ||
      'tickets' ||
      'all_ticket' ||
      'all_tickets' => FacilityPromotionAppliesOn.allTickets,
      'promotion' ||
      'promotions' ||
      'all_promotion' ||
      'all_promotions' => FacilityPromotionAppliesOn.allPromotions,
      'purchase' ||
      'purchases' ||
      'all_purchase' ||
      'all_purchases' => FacilityPromotionAppliesOn.allPurchases,
      final value => throw FormatException(
        'Discount promotion $promotionId has unsupported discount_for value: $value',
      ),
    };
  }

  static FacilityPromotionAppliesOn _mapCouponAppliesOn(String? rawValue) {
    final normalizedValue = rawValue?.trim();
    if (normalizedValue == null || normalizedValue.isEmpty) {
      return FacilityPromotionAppliesOn.unknown;
    }

    return switch (normalizedValue.toLowerCase()) {
      'ticket' || 'tickets' => FacilityPromotionAppliesOn.tickets,
      'promotion' || 'promotions' => FacilityPromotionAppliesOn.promotions,
      'package' || 'packages' => FacilityPromotionAppliesOn.packages,
      'purchase' || 'purchases' => FacilityPromotionAppliesOn.purchases,
      'all_ticket' || 'all_tickets' => FacilityPromotionAppliesOn.allTickets,
      'all_promotion' || 'all_promotions' => FacilityPromotionAppliesOn.allPromotions,
      'all_package' || 'all_packages' => FacilityPromotionAppliesOn.allPackages,
      'all_purchase' || 'all_purchases' => FacilityPromotionAppliesOn.allPurchases,
      _ => FacilityPromotionAppliesOn.unknown,
    };
  }
}
