import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class CouponMapper {
  static PurchaseCouponEntity toEntity(CouponModel model) => PurchaseCouponEntity(
    id: model.id,
    name: model.name,
    discountRatio: model.coupon.discountRatio,
  );
}
