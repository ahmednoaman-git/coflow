import 'package:freezed_annotation/freezed_annotation.dart';

import 'location_city_entity.dart';
import 'selected_location.dart';

part 'locations_entity.freezed.dart';

/// Entity containing all available locations (cities/areas) for selection.
@freezed
abstract class LocationsEntity with _$LocationsEntity {
  const factory LocationsEntity({
    required List<LocationCityEntity> cities,
    required int remoteCount,
  }) = _LocationsEntity;
}

/// Carrying a [SelectedLocation] over from another list of locations.
extension LocationsEntityMatching on LocationsEntity {
  /// [selection] as it stands in this list — names refreshed from it — or null
  /// when this list has nothing there: the city or area is missing or has no
  /// facilities, or remote is chosen and nothing here is remote. An empty
  /// selection always matches.
  SelectedLocation? match(SelectedLocation selection) {
    if (selection.isEmpty) return selection;
    if (selection.isRemote) return remoteCount > 0 ? selection : null;

    bool hasFacilities(int? count) => count == null || count > 0;

    final city = cities.where((city) => city.id == selection.cityId).firstOrNull;
    if (city == null || !hasFacilities(city.facilityCount)) return null;
    if (selection.areaId == null) return selection.copyWith(cityName: city.name);

    final area = city.areas?.where((area) => area.id == selection.areaId).firstOrNull;
    if (area == null || !hasFacilities(area.facilityCount)) return null;
    return selection.copyWith(cityName: city.name, areaName: area.name);
  }
}
