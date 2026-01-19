import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_area_entity.freezed.dart';

/// Area entity with facility count for location selection.
@freezed
abstract class LocationAreaEntity with _$LocationAreaEntity {
  const factory LocationAreaEntity({
    required int id,
    required String name,
    int? countryId,
    int? cityId,
    int? facilityCount,
  }) = _LocationAreaEntity;
}
