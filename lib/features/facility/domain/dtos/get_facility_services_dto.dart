import 'package:coflow_users_v2/core/core.dart';

import '../enums/enums.dart';

/// Request for a facility's service listing.
///
/// Plain const class (not JSON-serialized) because it carries [AccountType],
/// which decides the listing type: Go accounts list their activities under
/// `type=go`.
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
