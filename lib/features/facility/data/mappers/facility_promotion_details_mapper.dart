import '../../domain/entities/entities.dart';
import '../models/models.dart';
import 'facility_promotion_mapper.dart';

abstract final class FacilityPromotionDetailsMapper {
  static FacilityPromotionDetailsEntity toEntity(FacilityPromotionDetailsModel model) {
    final promotion = model.promotion;

    return FacilityPromotionDetailsEntity(
      promotion: FacilityPromotionMapper.toEntity(promotion),
      description: promotion.description?.trim() ?? '',
      requirements: promotion.requirements?.trim() ?? '',
      conditions: promotion.conditions?.trim() ?? '',
      unlimited: promotion.unlimited ?? false,
      validityDays: promotion.validityDays,
    );
  }
}
