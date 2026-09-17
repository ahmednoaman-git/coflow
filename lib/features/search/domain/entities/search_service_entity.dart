import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:coflow_users_v2/features/facility/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_service_entity.freezed.dart';

/// A service row in the search results: the service itself plus the facility
/// that offers it, which the row shows as a subtitle and the details screen
/// needs to open.
@freezed
abstract class SearchServiceEntity with _$SearchServiceEntity {
  const factory SearchServiceEntity({
    required CollapsedFacilityServiceEntity service,
    required CollapsedFacilityEntity facility,

    /// Null when the payload reports a listing type the app does not model.
    FacilityServiceType? type,
  }) = _SearchServiceEntity;
}
