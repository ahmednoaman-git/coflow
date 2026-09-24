import '../../domain/entities/entities.dart';
import '../models/models.dart';
import 'ticket_price_mapper.dart';

abstract final class FacilityTicketMapper {
  static FacilityTicketEntity toEntity(FacilityTicketModel model) {
    return FacilityTicketEntity(
      id: model.id,
      name: model.name,
      servicesCount: model.servicesCount,
      originalPrice: model.price,
      discountPrice: TicketPriceMapper.reducedPrice(
        price: model.price,
        discountPrice: model.discountPrice,
        offerPercent: model.offer,
      ),
      currency: model.currency,
    );
  }
}
