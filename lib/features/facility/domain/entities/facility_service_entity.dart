import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_service_level.dart';

part 'facility_service_entity.freezed.dart';

/// A service shown in a services/flows/courses listing tile.
@freezed
abstract class CollapsedFacilityServiceEntity with _$CollapsedFacilityServiceEntity {
  const factory CollapsedFacilityServiceEntity({
    required int id,
    required String name,
    String? imageUrl,
    required int reservations,
    String? durationLabel,
    FacilityServiceLevel? level,
  }) = _CollapsedFacilityServiceEntity;
}

/// A folder grouping services within a listing.
@freezed
abstract class FacilityServiceFolderEntity with _$FacilityServiceFolderEntity {
  const factory FacilityServiceFolderEntity({
    required int id,
    required String name,
    required List<CollapsedFacilityServiceEntity> services,
  }) = _FacilityServiceFolderEntity;
}

/// Full services/flows/courses listing for a facility.
@freezed
abstract class FacilityServicesEntity with _$FacilityServicesEntity {
  const FacilityServicesEntity._();

  const factory FacilityServicesEntity({
    required List<FacilityServiceFolderEntity> folders,
    required List<CollapsedFacilityServiceEntity> rootServices,
  }) = _FacilityServicesEntity;

  bool get isEmpty => folders.isEmpty && rootServices.isEmpty;
}
