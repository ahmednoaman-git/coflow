import 'package:freezed_annotation/freezed_annotation.dart';

import 'location_area_entity.dart';

part 'location_city_entity.freezed.dart';

/// City entity with associated areas and facility count for location selection.
@freezed
abstract class LocationCityEntity with _$LocationCityEntity {
  const factory LocationCityEntity({
    required int id,
    required String name,
    int? countryId,
    int? facilityCount,
    List<LocationAreaEntity>? areas,
  }) = _LocationCityEntity;
}
