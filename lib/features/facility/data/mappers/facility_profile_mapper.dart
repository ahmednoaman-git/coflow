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
      tags: (model.tags ?? const <FacilityTagModel>[]).map((e) => e.name).toList(),
    );
  }
}
