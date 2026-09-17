import 'package:freezed_annotation/freezed_annotation.dart';

import 'collapsed_facility_entity.dart';
import 'tag_entity.dart';

part 'activity_line_facilities_entity.freezed.dart';

/// Entity containing facilities and tags for an activity line.
@freezed
abstract class ActivityLineFacilitiesEntity with _$ActivityLineFacilitiesEntity {
  const ActivityLineFacilitiesEntity._();

  const factory ActivityLineFacilitiesEntity({
    required List<CollapsedFacilityEntity> facilities,
    required List<TagWithCountEntity> tags,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(0) int total,
  }) = _ActivityLineFacilitiesEntity;

  factory ActivityLineFacilitiesEntity.empty() => ActivityLineFacilitiesEntity(
    facilities: const [],
    tags: const [],
  );

  int? get nextPage => currentPage < lastPage ? currentPage + 1 : null;

  ActivityLineFacilitiesEntity mergedWith(ActivityLineFacilitiesEntity next) => next.copyWith(
    facilities: {
      for (final item in [...facilities, ...next.facilities]) item.id: item,
    }.values.toList(),
  );
}
