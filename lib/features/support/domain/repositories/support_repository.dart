import 'package:coflow_users_v2/core/core.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

abstract interface class SupportRepository {
  /// Newest first, as the server orders them.
  AsyncTask<PaginatedEntity<SupportRequestEntity>> getSupportRequests(GetSupportRequestsDto dto);

  AsyncTask<void> createSupportRequest(CreateSupportRequestDto dto);
}
