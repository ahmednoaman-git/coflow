import '../entities/entities.dart';

/// Groups flat purchase rows into one section per facility.
///
/// Kept apart from the data layer on purpose: the list endpoints group by
/// facility today, but they will have to page (backend brief F8), and paged
/// rows can only be grouped once loaded. The screens group here either way.
abstract final class PurchaseGrouping {
  /// Facilities in the order their first row appears; rows keep their order
  /// within each facility.
  static List<PurchaseFacilityGroupEntity> byFacility(List<UserPurchaseEntity> purchases) {
    final groups = <int, List<UserPurchaseEntity>>{};
    for (final purchase in purchases) {
      groups.putIfAbsent(purchase.facilityId, () => []).add(purchase);
    }

    return [
      for (final MapEntry(key: facilityId, value: rows) in groups.entries)
        PurchaseFacilityGroupEntity(
          facilityId: facilityId,
          facilityName: rows.first.facilityName,
          facility: rows.map((row) => row.facility).nonNulls.firstOrNull,
          purchases: List.unmodifiable(rows),
        ),
    ];
  }
}
