import '../enums/enums.dart';

/// Request for a single service's details.
///
/// Plain const class (not JSON-serialized). [type] rides along so the
/// mapper can apply the same level-fallback rule used for the listing
/// (the API's own `type` field on the details response doesn't map 1:1
/// to [FacilityServiceType]).
class GetFacilityServiceDetailsDto {
  const GetFacilityServiceDetailsDto({
    required this.serviceId,
    required this.type,
  });

  final int serviceId;
  final FacilityServiceType type;
}
