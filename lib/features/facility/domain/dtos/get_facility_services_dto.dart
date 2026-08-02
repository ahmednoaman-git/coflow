import 'package:coflow_users_v2/core/core.dart';

import '../enums/enums.dart';

/// Request for a facility's service listing.
///
/// Plain const class (not JSON-serialized) because it carries [AccountType],
/// which the repository uses to decide whether to route Go activity listings
/// through the stub data source (see [FacilityRepositoryImpl]).
class GetFacilityServicesDto {
  const GetFacilityServicesDto({
    required this.facilityId,
    required this.type,
    required this.accountType,
  });

  final int facilityId;
  final FacilityServiceType type;
  final AccountType accountType;
}
