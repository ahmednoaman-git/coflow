import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/data/datasources/datasources.dart';
import 'package:coflow_users_v2/features/activity_line/data/models/models.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../mappers/mappers.dart';
import '../models/models.dart';

abstract final class ReservationEndpoints {
  static const accountReservations = 'account-reservations';
  static String details(int id) => 'account-reservations/$id';
  static String cancel(int id) => 'reservations/$id';
}

@lazySingleton
class ReservationRemoteDataSource {
  const ReservationRemoteDataSource(this._dio, this._calendar);

  final DioClient _dio;
  final FacilityCalendarRemoteDataSource _calendar;

  AsyncTask<ReservationsResponseModel> getReservations(GetReservationsDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final entries = <int, Map<String, dynamic>>{};
      for (
        var month = DateTime(dto.startDate.year, dto.startDate.month);
        !month.isAfter(dto.endDate);
        month = DateTime(month.year, month.month + 1)
      ) {
        final response = await _dio.get(
          ReservationEndpoints.accountReservations,
          queryParameters: {'date': '${month.month.toString().padLeft(2, '0')}-${month.year}'},
        );
        for (final row in AccountReservationPayloadMapper.rows(response.data)) {
          final calendar = row['calendar'] as Map<String, dynamic>?;
          if (calendar == null) continue;
          final date = DateTime.parse(calendar['date'] as String);
          if (date.isBefore(dto.startDate) || date.isAfter(dto.endDate)) continue;
          entries[(row['id'] as num).toInt()] = row;
        }
      }

      // Share context requests across reservations in this window, without
      // persisting stale facility/service data after a refresh.
      final facilities = <int, Map<String, dynamic>>{};
      final services = <int, Map<String, dynamic>>{};
      final models = <ReservationModel>[];
      for (final row in entries.values) {
        final calendar = row['calendar'] as Map<String, dynamic>;
        final facilityId = (row['facility_id'] as num).toInt();
        final serviceId = (calendar['service_id'] as num).toInt();
        if (!facilities.containsKey(facilityId)) {
          final response = await _dio.get(FacilityEndpoints.facility(facilityId));
          facilities[facilityId] = response.data as Map<String, dynamic>;
        }
        if (!services.containsKey(serviceId)) {
          final response = await _dio.get(FacilityEndpoints.serviceDetails(serviceId));
          services[serviceId] = response.data as Map<String, dynamic>;
        }
        models.add(
          AccountReservationPayloadMapper.toModel(
            row,
            facility: facilities[facilityId]!,
            service: services[serviceId]!,
          ),
        );
      }
      return ReservationsResponseModel(reservations: models);
    });
  }

  AsyncTask<ReservationDetailsModel> getReservationDetails(GetReservationDetailsDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(ReservationEndpoints.details(dto.reservationId));
      final row = response.data as Map<String, dynamic>;
      final facility = await _dio.get(
        FacilityEndpoints.facility((row['facility_id'] as num).toInt()),
      );
      return (row: row, facility: facility.data as Map<String, dynamic>);
    }).flatMap((payload) {
      final (:row, :facility) = payload;
      return _calendar
          .loadDetails(
            calendarId: (row['calendar_id'] as num).toInt(),
            reservation: row,
            facility: facility,
          )
          .map(
            (slot) => ReservationDetailsModel(
              facilityId: dto.reservation.facilityId,
              facilityName: dto.reservation.facilityName,
              facilityLogo: dto.reservation.facilityLogoUrl,
              facility: FacilityModel.fromJson(facility),
              slot: slot,
            ),
          );
    });
  }

  AsyncTask<ReservationDetailsModel> withdrawReservation(WithdrawReservationDto dto) {
    return getReservationDetails(GetReservationDetailsDto(reservation: dto.reservation)).flatMap(
      (details) => AsyncTaskExtension.tryCatchMapDioToFailure(() async {
        await _dio.delete(ReservationEndpoints.cancel(dto.reservationId));
        // The account endpoint retains cancelled rows. Close the sheet on
        // success and reload the list, which filters those rows out.
        return details;
      }),
    );
  }
}
