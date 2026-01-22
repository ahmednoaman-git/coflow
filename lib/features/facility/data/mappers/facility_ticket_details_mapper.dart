import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class FacilityTicketDetailsMapper {
  static FacilityTicketDetailsEntity toEntity(FacilityTicketDetailsModel model) {
    final ticket = model.ticket;

    return FacilityTicketDetailsEntity(
      id: ticket.id,
      name: ticket.name,
      price: ticket.price,
      discountPrice: ticket.discountPrice,
      currency: ticket.currency,
      unlimited: ticket.unlimited,
      validityDays: ticket.validityDays,
      conditions: ticket.conditions ?? '',
      requirements: ticket.requirements ?? '',
      addOns: (ticket.addons ?? const <AddonModel>[])
          .map((a) => AddOnEntity(id: a.id, name: a.name, price: a.price))
          .toList(growable: false),
      services: (ticket.services ?? const <ServiceModel>[])
          .map(
            (s) => ServiceEntity(
              id: s.id,
              name: s.name,
              imageUrl: s.image,
            ),
          )
          .toList(growable: false),
    );
  }
}
