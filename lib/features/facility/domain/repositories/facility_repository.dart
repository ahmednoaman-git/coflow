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

  /// The facility's published FAQ, in the order the facility sorted it.
  AsyncTask<List<FacilityFaqEntity>> getFacilityFaqs(GetFacilityFaqsDto dto);

  AsyncTask<List<FacilityTicketEntity>> getFacilityTickets(GetFacilityTicketsDto dto);

  AsyncTask<FacilityTicketDetailsEntity> getFacilityTicketDetails(
    GetFacilityTicketDetailsDto dto,
  );

  AsyncTask<FacilityServicesEntity> getFacilityServices(GetFacilityServicesDto dto);

  AsyncTask<FacilityServiceDetailsEntity> getFacilityServiceDetails(
    GetFacilityServiceDetailsDto dto,
  );

  AsyncTask<FacilityScheduleEntity> getFacilitySessions(GetFacilitySessionsDto dto);

  /// The facility's recurring weekly schedule, projected onto the days the UI
  /// is showing.
  AsyncTask<FacilityScheduleEntity> getFacilityWeeklySchedule(GetFacilityWeeklyScheduleDto dto);

  AsyncTask<FacilitySessionDetailsEntity> getFacilitySessionDetails(
    GetFacilitySessionDetailsDto dto,
  );

  /// Reserve, cancel, join or leave the waitlist — returns the updated slot.
  AsyncTask<FacilitySessionDetailsEntity> updateSessionReservation(SessionReservationDto dto);

  /// Flips the saved flag on a facility. The endpoint is a toggle and reports
  /// no resulting state, so the caller owns the flag it flips to.
  AsyncTask<void> toggleFacilitySave(ToggleFacilitySaveDto dto);

  /// Flips update-tracking on a facility. Also a toggle — see
  /// [toggleFacilitySave].
  AsyncTask<void> toggleFacilityTracking(ToggleFacilityTrackingDto dto);
}
