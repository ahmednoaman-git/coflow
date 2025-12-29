import 'package:freezed_annotation/freezed_annotation.dart';

part 'area_entity.freezed.dart';

/// Area entity for location display.
@freezed
abstract class AreaEntity with _$AreaEntity {
  const factory AreaEntity({
    required int id,
    required String name,
    required int countryId,
    required int cityId,
  }) = _AreaEntity;
}
