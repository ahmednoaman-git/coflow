import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class FacilityTicketMapper {
  static FacilityTicketEntity toEntity(FacilityTicketModel model) {
    return FacilityTicketEntity(
      id: model.id,
      name: model.name,
      servicesCount: model.servicesCount,
      originalPrice: model.price,
      discountPrice: model.discountPrice,
      currency: model.currency,
    );
  }
}
