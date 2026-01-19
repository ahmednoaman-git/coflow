import 'package:freezed_annotation/freezed_annotation.dart';

import 'location_city_entity.dart';

part 'locations_entity.freezed.dart';

/// Entity containing all available locations (cities/areas) for selection.
@freezed
abstract class LocationsEntity with _$LocationsEntity {
  const factory LocationsEntity({
    required List<LocationCityEntity> cities,
    required int remoteCount,
  }) = _LocationsEntity;
}
