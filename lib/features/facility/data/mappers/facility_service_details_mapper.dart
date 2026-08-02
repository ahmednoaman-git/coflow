import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../models/models.dart';
import 'facility_service_mapper.dart';

abstract final class FacilityServiceDetailsMapper {
  static FacilityServiceDetailsEntity toEntity(
    FacilityServiceDetailsModel model,
    FacilityServiceType requestedType,
  ) {
    return FacilityServiceDetailsEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      requirements: model.requirements,
      conditions: model.conditions,
      imageUrls: _mapImageUrls(model),
      durationLabel: FacilityServiceMapper.composeDurationLabel(
        model.duration,
        model.durationList,
      ),
      level: FacilityServiceMapper.mapLevel(model.level, requestedType),
      tickets: model.tickets.map(_mapTicket).toList(growable: false),
      locations: model.locations.map(_mapLocation).toList(growable: false),
      instructors: model.instructors.map(_mapInstructor).toList(growable: false),
    );
  }

  static List<String> _mapImageUrls(FacilityServiceDetailsModel model) {
    final images =
        model.images.where((image) => image.type == null || image.type == 'image').toList()
          ..sort((a, b) => (a.sort ?? 0).compareTo(b.sort ?? 0));

    if (images.isNotEmpty) {
      return images.map((image) => image.file).toList(growable: false);
    }

    final fallback = model.image;
    return fallback == null ? const [] : [fallback];
  }

  static FacilityServiceTicketEntity _mapTicket(FacilityServiceTicketModel model) {
    return FacilityServiceTicketEntity(
      id: model.id,
      name: model.name,
      price: model.price,
      discountPrice: model.hasDiscount == true ? model.discountPrice : null,
      currency: model.currency ?? 'EGP',
    );
  }

  static FacilityServiceLocationEntity _mapLocation(FacilityServiceLocationModel model) {
    return FacilityServiceLocationEntity(id: model.id, name: model.name, link: model.link);
  }

  static FacilityServiceInstructorEntity _mapInstructor(FacilityServiceInstructorModel model) {
    return FacilityServiceInstructorEntity(
      id: model.id,
      firstName: model.firstName,
      lastName: model.lastName,
    );
  }
}
