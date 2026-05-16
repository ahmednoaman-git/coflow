import 'package:coflow_users_v2/core/async/async.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

/// Facility repository contract.
abstract interface class FacilityRepository {
  AsyncTask<FacilityPromotionDetailsEntity> getFacilityPromotionDetails(
    GetFacilityPromotionDetailsDto dto,
  );

  AsyncTask<List<FacilityPromotionEntity>> getFacilityPromotions(
    GetFacilityPromotionsDto dto,
  );

  AsyncTask<FacilityProfileEntity> getFacilityProfile(GetFacilityProfileDto dto);

  AsyncTask<List<FacilityTicketEntity>> getFacilityTickets(GetFacilityTicketsDto dto);

  AsyncTask<FacilityTicketDetailsEntity> getFacilityTicketDetails(
    GetFacilityTicketDetailsDto dto,
  );
}
