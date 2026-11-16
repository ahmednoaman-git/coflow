import 'package:coflow_users_v2/features/activity_line/data/mappers/activity_line_mapper.dart';
import 'package:coflow_users_v2/features/activity_line/data/models/facility_model.dart';

import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class SavedProfileMapper {
  static const String _savedType = 'save';
  static const String _trackedType = 'track';

  /// Folds the wishlist's per-flag rows into one entity per saved facility.
  ///
  /// A facility is listed when it has a `save` row, and tracked when it also
  /// has a `track` row. Rows whose facility is gone — deleted since it was
  /// saved — are dropped: there is nothing to show on the card or to open.
  static List<SavedProfileEntity> toEntities(List<SavedProfileModel> models) {
    final saved = <int, FacilityModel>{};
    final trackedIds = <int>{};

    for (final model in models) {
      final (facilityId, facility) = (model.facilityId, model.facility);
      if (facilityId == null) continue;

      switch (model.type) {
        case _savedType when facility != null:
          saved.putIfAbsent(facilityId, () => facility);
        case _trackedType:
          trackedIds.add(facilityId);
      }
    }

    return [
      for (final MapEntry(key: facilityId, value: facility) in saved.entries)
        toEntity(facility, isTracked: trackedIds.contains(facilityId)),
    ];
  }

  static SavedProfileEntity toEntity(FacilityModel facility, {required bool isTracked}) {
    final entity = ActivityLineMapper.toFacilityEntity(facility);

    return SavedProfileEntity(
      facility: entity,
      branchLabel: entity.locationLabel,
      isTracked: isTracked,
    );
  }
}
