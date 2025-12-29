import 'package:freezed_annotation/freezed_annotation.dart';

import 'activity_line_entity.dart';
import 'area_entity.dart';
import 'city_entity.dart';

part 'profile_entity.freezed.dart';

/// Business/Facility profile entity for card display.
@freezed
abstract class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required int id,
    required String name,
    required String? logo,
    required String? cover,
    required String title,
    required ActivityLineEntity activityLine,
    required CityEntity? city,
    required AreaEntity? area,
  }) = _ProfileEntity;
}
