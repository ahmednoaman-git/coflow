import '../../domain/entities/entities.dart';
import '../models/models.dart';

/// Mapper for converting home data models to domain entities.
abstract final class HomeMapper {
  /// Converts HomeResponseModel to HomeEntity.
  static HomeEntity toEntity(HomeResponseModel model) {
    return HomeEntity(
      profiles: model.profiles.map(_profileToEntity).toList(),
      recentlyJoined: model.recentlyJoined.map(_profileToEntity).toList(),
      instructors: const [], // Empty list - API pending from backend
    );
  }

  static ProfileEntity _profileToEntity(ProfileModel model) {
    return ProfileEntity(
      id: model.id,
      name: model.name,
      logo: model.logo,
      cover: model.cover,
      title: model.title,
      activityLine: _activityLineToEntity(model.activityLine),
      city: model.city != null ? _cityToEntity(model.city!) : null,
      area: model.area != null ? _areaToEntity(model.area!) : null,
    );
  }

  static ActivityLineEntity _activityLineToEntity(ActivityLineModel model) {
    return ActivityLineEntity(
      id: model.id,
      name: model.name,
      image: model.image,
      color: model.color,
      facilities: model.facilities,
    );
  }

  static CityEntity _cityToEntity(CityModel model) {
    return CityEntity(
      id: model.id,
      name: model.name,
      countryId: model.countryId,
    );
  }

  static AreaEntity _areaToEntity(AreaModel model) {
    return AreaEntity(
      id: model.id,
      name: model.name,
      countryId: model.countryId,
      cityId: model.cityId,
    );
  }
}
