import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class PurchaseMapper {
  static PurchaseQuoteEntity quote(PurchaseQuoteModel model) => PurchaseQuoteEntity(
    totalPrice: model.totalPrice,
    finalPrice: model.finalPrice,
    couponDiscount: model.discountCoupon,
    addOnsPrice: model.addonsPrice,
    currency: model.currency,
  );

  static PurchaseReceiptEntity receipt(PurchaseReceiptModel model) =>
      PurchaseReceiptEntity(id: model.id);
}
