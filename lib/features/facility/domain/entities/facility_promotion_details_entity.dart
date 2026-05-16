import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_promotion_entity.dart';

part 'facility_promotion_details_entity.freezed.dart';

/// Promotion details entity for the promotion details bottom sheet.
@freezed
abstract class FacilityPromotionDetailsEntity with _$FacilityPromotionDetailsEntity {
  const FacilityPromotionDetailsEntity._();

  const factory FacilityPromotionDetailsEntity({
    required FacilityPromotionEntity promotion,
    @Default('') String description,
    @Default('') String requirements,
    @Default('') String conditions,
    @Default(false) bool unlimited,
    int? validityDays,
  }) = _FacilityPromotionDetailsEntity;

  String get title => promotion.name;

  String get priceText => promotion.trailingValueText;

  bool get hasDescription => description.trim().isNotEmpty;

  bool get hasRequirements => requirements.trim().isNotEmpty;

  bool get hasConditions => conditions.trim().isNotEmpty;

  String validityText(AppLocalizations l10n) {
    if (unlimited && validityDays == null) {
      return l10n.facilityDetails_unlimited;
    }

    final days = validityDays;
    if (days == null) {
      return l10n.facilityDetails_unknown;
    }

    return l10n.facilityDetails_days(days);
  }
}
