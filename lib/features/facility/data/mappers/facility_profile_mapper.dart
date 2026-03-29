import '../../domain/entities/entities.dart';
import '../models/models.dart';

/// Mapper for facility profile.
abstract final class FacilityProfileMapper {
  static FacilityProfileEntity toEntity(FacilityProfileModel model) {
    return FacilityProfileEntity(
      id: model.id,
      name: model.name,
      title: model.title,
      year: model.year,
      bio: model.bio,
      likesCount: model.likesCount,
      logoUrl: model.logo,
      coverUrl: model.cover,
      tags: model.tags
          .map((e) => e.name)
          .where((name) => name.trim().isNotEmpty)
          .map((name) => name.trim())
          .toList(),
      teamMembers: model.teams
          .map(
            (t) => TeamMemberEntity(
              id: t.id,
              name: t.name,
              title: t.title,
              imageUrl: t.image,
              bio: t.bio,
            ),
          )
          .toList(),
      operatingHours: model.operations
          .map(
            (o) => OperatingHoursEntity(
              id: o.id,
              days: o.days,
              fromTime: o.from,
              toTime: o.to,
            ),
          )
          .toList(),
      branches: model.barcnhes
          .map(
            (b) => BranchEntity(
              id: b.id,
              title: (b.title ?? '').trim(),
              coverUrl: b.cover,
            ),
          )
          .toList(),
      languages: model.languages
          .map(
            (l) => LanguageEntity(
              id: l.id,
              name: l.name,
            ),
          )
          .toList(),
      amenities: model.amenities
          .map(
            (a) => AmenityEntity(
              id: a.id,
              name: a.name,
              iconUrl: a.icon,
            ),
          )
          .toList(),
      reservationContacts: model.reservationContact
          .where((c) => c.selectSocial != null && c.selectSocial!.trim().isNotEmpty)
          .map(
            (c) => ReservationContactEntity(
              type: c.selectSocial!.trim(),
              link: c.link?.toString(),
            ),
          )
          .toList(),
      location: _mapLocation(model),
      mainBranch: (model.main != null && model.main!.name.trim().isNotEmpty)
          ? MainBranchEntity(
              id: model.main!.id,
              name: model.main!.name.trim(),
            )
          : null,
    );
  }

  static LocationEntity? _mapLocation(FacilityProfileModel model) {
    if (model.address == null && model.city == null && model.area == null) {
      return null;
    }
    return LocationEntity(
      address: model.address?.address,
      cityName: model.city?.name,
      areaName: model.area?.name,
      latitude: model.address?.latitude,
      longitude: model.address?.longitude,
    );
  }
}
