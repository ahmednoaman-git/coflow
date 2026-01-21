import 'package:freezed_annotation/freezed_annotation.dart';

import 'collapsed_facility_entity.dart';
import 'tag_entity.dart';

part 'activity_line_facilities_entity.freezed.dart';

/// Entity containing facilities and tags for an activity line.
@freezed
abstract class ActivityLineFacilitiesEntity with _$ActivityLineFacilitiesEntity {
  const factory ActivityLineFacilitiesEntity({
    required List<CollapsedFacilityEntity> facilities,
    required List<TagWithCountEntity> tags,
  }) = _ActivityLineFacilitiesEntity;

  factory ActivityLineFacilitiesEntity.empty() => ActivityLineFacilitiesEntity(
    facilities: const [],
    tags: const [],
  );
}
