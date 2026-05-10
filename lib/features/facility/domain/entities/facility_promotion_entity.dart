import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_promotion_reward_entity.dart';
import 'facility_promotion_ticket_line_entity.dart';

part 'facility_promotion_entity.freezed.dart';

const String facilityPromotionDiscountFallbackAppliedOnText =
    'All Tickets / All Packages / All Purchases';
const String facilityPromotionFallbackTicketName = 'Ticket';
const String facilityPromotionUnknownAppliesOnText = 'Unknown';
const int facilityPromotionDefaultRemainingCount = 10;

enum FacilityPromotionType { discount, package, buyGet }

@freezed
sealed class FacilityPromotionEntity with _$FacilityPromotionEntity {
  const FacilityPromotionEntity._();

  const factory FacilityPromotionEntity.discount({
    required int id,
    required String name,
    required DateTime endDate,
    required bool isLiked,
    required double discountRatio,
    required String appliedOnText,
  }) = FacilityPromotionDiscountEntity;

  const factory FacilityPromotionEntity.package({
    required int id,
    required String name,
    required DateTime endDate,
    required bool isLiked,
    required double displayPrice,
    required String currency,
    @Default(<FacilityPromotionTicketLineEntity>[]) List<FacilityPromotionTicketLineEntity> tickets,
    required int remainingCount,
  }) = FacilityPromotionPackageEntity;

  const factory FacilityPromotionEntity.buyGet({
    required int id,
    required String name,
    required DateTime endDate,
    required bool isLiked,
    required double displayPrice,
    required String currency,
    @Default(<FacilityPromotionTicketLineEntity>[])
    List<FacilityPromotionTicketLineEntity> buyTickets,
    required FacilityPromotionRewardEntity reward,
    required int remainingCount,
  }) = FacilityPromotionBuyGetEntity;

  FacilityPromotionType get type => switch (this) {
    FacilityPromotionDiscountEntity() => FacilityPromotionType.discount,
    FacilityPromotionPackageEntity() => FacilityPromotionType.package,
    FacilityPromotionBuyGetEntity() => FacilityPromotionType.buyGet,
  };

  String get trailingValueText => switch (this) {
    FacilityPromotionDiscountEntity(:final discountRatio) =>
      '${_formatPromotionNumber(discountRatio)}%',
    FacilityPromotionPackageEntity(:final displayPrice, :final currency) => _formatPriceText(
      currency: currency,
      value: displayPrice,
    ),
    FacilityPromotionBuyGetEntity(:final displayPrice, :final currency) => _formatPriceText(
      currency: currency,
      value: displayPrice,
    ),
  };

  int? get remainingCountOrNull => switch (this) {
    FacilityPromotionDiscountEntity() => null,
    FacilityPromotionPackageEntity(:final remainingCount) => remainingCount,
    FacilityPromotionBuyGetEntity(:final remainingCount) => remainingCount,
  };
}

String _formatPriceText({required String currency, required double value}) {
  final formattedValue = _formatPromotionNumber(value);
  if (currency.trim().isEmpty) {
    return formattedValue;
  }

  return '$currency $formattedValue';
}

String _formatPromotionNumber(double value) {
  if (value == value.roundToDouble()) {
    return value.toStringAsFixed(0);
  }

  return value.toStringAsFixed(2).replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
}
