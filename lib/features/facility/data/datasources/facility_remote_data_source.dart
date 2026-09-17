import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// Facility API endpoints.
abstract final class FacilityEndpoints {
  static String facility(int id) => 'facility/$id';
  static String promotionDetails(int promotionId) => 'promotion/$promotionId';
  static String facilityPromotions(int id) => 'promotions/$id';
  static String facilityTickets(int id) => 'tickets/$id';
  static String ticketDetails(int ticketId) => 'ticket/$ticketId';
  static String facilityServices(int id) => 'services/$id';
  static String serviceDetails(int serviceId) => 'service/$serviceId';
  static String facilitySchedule(int id) => 'schedule/$id';
  static String facilityFaqs(int id) => 'faq/$id';

  /// Toggles: the same call saves an unsaved facility and removes a saved one.
  static String toggleSave(int id) => 'save/$id';
  static String toggleTrack(int id) => 'track/$id';
}

/// Remote data source for facility API calls.
@lazySingleton
class FacilityRemoteDataSource {
  const FacilityRemoteDataSource(this._dio);
  final DioClient _dio;

  /// Page size requested from the paginated schedule endpoint. A facility's
  /// whole week fits well inside this, so the walk below normally makes a
  /// single request — it only loops if the API caps `per_page`.
  static const int _schedulePageSize = 100;

  /// Hard stop on the page walk, so a paginator that never reports a last page
  /// cannot spin forever.
  static const int _maxSchedulePages = 20;

  AsyncTask<FacilityPromotionDetailsModel> getFacilityPromotionDetails(
    GetFacilityPromotionDetailsDto dto,
  ) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(FacilityEndpoints.promotionDetails(dto.promotionId));
      return FacilityPromotionDetailsModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  AsyncTask<List<FacilityPromotionModel>> getFacilityPromotions(
    GetFacilityPromotionsDto dto,
  ) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(FacilityEndpoints.facilityPromotions(dto.facilityId));
      final raw = response.data as List<dynamic>;
      return raw
          .cast<Map<String, dynamic>>()
          .map(FacilityPromotionModel.fromJson)
          .toList(growable: false);
    });
  }

  AsyncTask<FacilityProfileModel> getFacilityProfile(GetFacilityProfileDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(FacilityEndpoints.facility(dto.facilityId));
      return FacilityProfileModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  AsyncTask<List<FacilityFaqModel>> getFacilityFaqs(GetFacilityFaqsDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(FacilityEndpoints.facilityFaqs(dto.facilityId));
      final raw = response.data as List<dynamic>;
      return raw
          .cast<Map<String, dynamic>>()
          .map(FacilityFaqModel.fromJson)
          .toList(growable: false);
    });
  }

  /// Flips the saved flag. The endpoint answers with a bare message
  /// (`Saved.` / `Removed.`) that the response interceptor strips along with
  /// the rest of the envelope, so nothing is returned — the caller already
  /// knows which way it flipped.
  AsyncTask<void> toggleFacilitySave(ToggleFacilitySaveDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      await _dio.get(FacilityEndpoints.toggleSave(dto.facilityId));
    });
  }

  /// Flips update-tracking. Same toggle semantics as [toggleFacilitySave].
  AsyncTask<void> toggleFacilityTracking(ToggleFacilityTrackingDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      await _dio.get(FacilityEndpoints.toggleTrack(dto.facilityId));
    });
  }

  AsyncTask<List<FacilityTicketModel>> getFacilityTickets(GetFacilityTicketsDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(FacilityEndpoints.facilityTickets(dto.facilityId));
      final raw = response.data as List<dynamic>;
      return raw
          .cast<Map<String, dynamic>>()
          .map(FacilityTicketModel.fromJson)
          .toList(growable: false);
    });
  }

  AsyncTask<FacilityTicketDetailsModel> getFacilityTicketDetails(
    GetFacilityTicketDetailsDto dto,
  ) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(FacilityEndpoints.ticketDetails(dto.ticketId));
      return FacilityTicketDetailsModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  AsyncTask<FacilityServicesResponseModel> getFacilityServices(GetFacilityServicesDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(
        FacilityEndpoints.facilityServices(dto.facilityId),
        queryParameters: {'type': dto.type.queryParam},
      );
      return FacilityServicesResponseModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  AsyncTask<FacilityServiceDetailsModel> getFacilityServiceDetails(
    GetFacilityServiceDetailsDto dto,
  ) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(FacilityEndpoints.serviceDetails(dto.serviceId));
      return FacilityServiceDetailsModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  /// Every recurring slot in the facility's weekly schedule.
  ///
  /// The endpoint paginates and offers no date or type filter, so the whole
  /// pattern is pulled in one go and narrowed client-side by
  /// `FacilityWeeklyScheduleMapper`.
  AsyncTask<List<FacilityScheduleSlotModel>> getFacilitySchedule(
    GetFacilityWeeklyScheduleDto dto,
  ) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final slots = <FacilityScheduleSlotModel>[];
      var page = 1;
      var lastPage = 1;

      do {
        final response = await _dio.get(
          FacilityEndpoints.facilitySchedule(dto.facilityId),
          queryParameters: {'page': page, 'per_page': _schedulePageSize},
        );
        final pageModel = FacilitySchedulePageModel.fromJson(
          response.data as Map<String, dynamic>,
        );

        slots.addAll(pageModel.slots);
        lastPage = pageModel.lastPage;
        page++;
      } while (page <= lastPage && page <= _maxSchedulePages);

      return List.unmodifiable(slots);
    });
  }
}
