import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// Facility API endpoints.
abstract final class FacilityEndpoints {
  static String facility(int id) => 'facility/$id';
  static String facilityTickets(int id) => 'tickets/$id';
  static String ticketDetails(int ticketId) => 'ticket/$ticketId';
}

/// Remote data source for facility API calls.
@lazySingleton
class FacilityRemoteDataSource {
  const FacilityRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<FacilityProfileModel> getFacilityProfile(GetFacilityProfileDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(FacilityEndpoints.facility(dto.facilityId));
      return FacilityProfileModel.fromJson(response.data as Map<String, dynamic>);
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
}
