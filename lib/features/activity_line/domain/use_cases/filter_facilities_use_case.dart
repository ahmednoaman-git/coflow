import 'package:injectable/injectable.dart';

import '../entities/entities.dart';

/// Use case for client-side filtering of facilities by tags.
@lazySingleton
class FilterFacilitiesUseCase {
  const FilterFacilitiesUseCase();

  /// Filters facilities by tag IDs.
  ///
  /// Returns all facilities if [tagIds] is empty.
  List<CollapsedFacilityEntity> call({
    required List<CollapsedFacilityEntity> facilities,
    required List<int> tagIds,
  }) {
    if (tagIds.isEmpty) return facilities;
    return facilities.where((f) => f.tags.any((tag) => tagIds.contains(tag.id))).toList();
  }
}
