import '../../domain/entities/entities.dart';
import 'models/models.dart';

/// Mapper for converting locations data models to domain entities.
abstract final class LocationsMapper {
  /// Converts LocationsResponseModel to LocationsEntity.
  static LocationsEntity toEntity(LocationsResponseModel model) {
    return LocationsEntity(
      cities: model.cities.map(_cityToEntity).toList(),
      remoteCount: model.remote,
    );
  }

  static LocationCityEntity _cityToEntity(CityModel model) {
    return LocationCityEntity(
      id: model.id,
      name: model.name,
      countryId: model.countryId,
      facilityCount: model.count,
      areas: model.areas?.map(_areaToEntity).toList(),
    );
  }

  static LocationAreaEntity _areaToEntity(AreaModel model) {
    return LocationAreaEntity(
      id: model.id,
      name: model.name,
      countryId: model.countryId,
      cityId: model.cityId,
      facilityCount: model.count,
    );
  }
}
