import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_promotion_applies_on.dart';
import 'facility_promotion_reward_entity.dart';
import 'facility_promotion_ticket_line_entity.dart';

part 'facility_promotion_entity.freezed.dart';

const String facilityPromotionFallbackTicketName = 'Ticket';

enum FacilityPromotionType { discount, package, buyGet }

@freezed
sealed class FacilityPromotionEntity with _$FacilityPromotionEntity {
  FacilityPromotionEntity._();

  factory FacilityPromotionEntity.discount({
    required int id,
    required String name,
    required DateTime endDate,
    required bool isLiked,
    required double discountRatio,
    required FacilityPromotionAppliesOn discountFor,
  }) = FacilityPromotionDiscountEntity;

  factory FacilityPromotionEntity.package({
    required int id,
    required String name,
    required DateTime endDate,
    required bool isLiked,
    required double displayPrice,
    required String currency,
    @Default(<FacilityPromotionTicketLineEntity>[]) List<FacilityPromotionTicketLineEntity> tickets,
    required bool remainingUnlimited,
    int? remainingCount,
  }) = FacilityPromotionPackageEntity;

  factory FacilityPromotionEntity.buyGet({
    required int id,
    required String name,
    required DateTime endDate,
    required bool isLiked,
    required double displayPrice,
    required String currency,
    @Default(<FacilityPromotionTicketLineEntity>[])
    List<FacilityPromotionTicketLineEntity> buyTickets,
    required FacilityPromotionRewardEntity reward,
    required bool remainingUnlimited,
    int? remainingCount,
  }) = FacilityPromotionBuyGetEntity;

  FacilityPromotionType get type;
  String get trailingValueText;
  bool get hasRemainingInfo;
  bool get isRemainingUnlimited;
  int? get remainingCountOrNull;
}

@freezed
class FacilityPromotionDiscountEntity extends FacilityPromotionEntity
    with _$FacilityPromotionDiscountEntity {
  FacilityPromotionDiscountEntity({
    required this.id,
    required this.name,
    required this.endDate,
    required this.isLiked,
    required this.discountRatio,
    required this.discountFor,
  }) : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime endDate;
  @override
  final bool isLiked;
  @override
  final double discountRatio;
  @override
  final FacilityPromotionAppliesOn discountFor;

  @override
  FacilityPromotionType get type => .discount;

  @override
  String get trailingValueText => '${_formatPromotionNumber(discountRatio)}%';

  @override
  bool get hasRemainingInfo => false;

  @override
  bool get isRemainingUnlimited => false;

  @override
  int? get remainingCountOrNull => null;
}

@freezed
class FacilityPromotionPackageEntity extends FacilityPromotionEntity
    with _$FacilityPromotionPackageEntity {
  FacilityPromotionPackageEntity({
    required this.id,
    required this.name,
    required this.endDate,
    required this.isLiked,
    required this.displayPrice,
    required this.currency,
    this.tickets = const <FacilityPromotionTicketLineEntity>[],
    required this.remainingUnlimited,
    this.remainingCount,
  }) : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime endDate;
  @override
  final bool isLiked;
  @override
  final double displayPrice;
  @override
  final String currency;
  @override
  final List<FacilityPromotionTicketLineEntity> tickets;
  @override
  final bool remainingUnlimited;
  @override
  final int? remainingCount;

  @override
  FacilityPromotionType get type => .package;

  @override
  String get trailingValueText => _formatPriceText(currency: currency, value: displayPrice);

  @override
  bool get hasRemainingInfo => true;

  @override
  bool get isRemainingUnlimited => remainingUnlimited;

  @override
  int? get remainingCountOrNull => remainingUnlimited ? null : remainingCount;
}

@freezed
class FacilityPromotionBuyGetEntity extends FacilityPromotionEntity
    with _$FacilityPromotionBuyGetEntity {
  FacilityPromotionBuyGetEntity({
    required this.id,
    required this.name,
    required this.endDate,
    required this.isLiked,
    required this.displayPrice,
    required this.currency,
    this.buyTickets = const <FacilityPromotionTicketLineEntity>[],
    required this.reward,
    required this.remainingUnlimited,
    this.remainingCount,
  }) : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime endDate;
  @override
  final bool isLiked;
  @override
  final double displayPrice;
  @override
  final String currency;
  @override
  final List<FacilityPromotionTicketLineEntity> buyTickets;
  @override
  final FacilityPromotionRewardEntity reward;
  @override
  final bool remainingUnlimited;
  @override
  final int? remainingCount;

  @override
  FacilityPromotionType get type => .buyGet;

  @override
  String get trailingValueText => _formatPriceText(currency: currency, value: displayPrice);

  @override
  bool get hasRemainingInfo => true;

  @override
  bool get isRemainingUnlimited => remainingUnlimited;

  @override
  int? get remainingCountOrNull => remainingUnlimited ? null : remainingCount;
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
