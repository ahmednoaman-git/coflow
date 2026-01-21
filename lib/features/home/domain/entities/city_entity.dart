import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_entity.freezed.dart';

/// City entity for location display.
@freezed
abstract class CityEntity with _$CityEntity {
  const factory CityEntity({
    required int id,
    required String name,
    int? countryId,
  }) = _CityEntity;
}
