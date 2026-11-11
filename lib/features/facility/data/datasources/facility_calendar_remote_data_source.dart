import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/core/network/interceptors/data_extractor_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../mappers/mappers.dart';
import '../models/models.dart';

abstract final class FacilityCalendarEndpoints {
  static const calendar = 'calendar';
  static String details(int id) => 'calendar/$id';
  static String preview(int id) => 'calendar/$id/ticket';
  static String reserve(int id) => 'reserve-slot/$id';
  static String reservation(int id) => 'reservations/$id';
  static String service(int id) => 'service/$id';
  static String facility(int id) => 'facility/$id';
}

@lazySingleton
class FacilityCalendarRemoteDataSource {
  const FacilityCalendarRemoteDataSource(this._dio, this._auth);
  final DioClient _dio;
  final AuthStateManager _auth;

  AsyncTask<FacilitySessionsResponseModel> getFacilitySessions(GetFacilitySessionsDto dto) =>
      AsyncTaskExtension.tryCatchMapDioToFailure(() async {
        final response = await _dio.post(
          FacilityCalendarEndpoints.calendar,
          data: FormData.fromMap({
            'from': DateFormat('yyyy-MM-dd').format(dto.startDate),
            'to': DateFormat('yyyy-MM-dd').format(dto.endDate),
            'facility_id': dto.facilityId,
            'type': dto.type.queryParam,
          }),
        );
        final rows = FacilityCalendarPayloadMapper.calendarRows(response.data);
        return FacilitySessionsResponseModel(
          sessions: rows
              .where((row) {
                final service = row['service'];
                final type = service is Map ? service['type'] : null;
                // The server currently ignores the type filter for some facilities.
                return row['status'] != 'private' && (type == null || type == dto.type.queryParam);
              })
              .map(FacilityCalendarPayloadMapper.session)
              .where(
                (session) =>
                    !session.startsAt.isBefore(dto.startDate) &&
                    session.startsAt.isBefore(
                      DateTime(dto.endDate.year, dto.endDate.month, dto.endDate.day + 1),
                    ),
              )
              .toList(growable: false),
        );
      });

  AsyncTask<FacilitySessionDetailsModel> getSessionDetails(GetFacilitySessionDetailsDto dto) =>
      dto.session.isRecurring
      ? AsyncTaskExtension.tryCatchMapDioToFailure(() => _recurringDetails(dto.session))
      : loadDetails(calendarId: dto.sessionId, fallback: dto.session);

  AsyncTask<FacilitySessionDetailsModel> loadDetails({
    required int calendarId,
    Map<String, dynamic> reservation = const {},
    Map<String, dynamic>? facility,
    FacilitySessionEntity? fallback,
  }) => AsyncTaskExtension.tryCatchMapDioToFailure(
    () => _loadDetails(
      calendarId: calendarId,
      reservation: reservation,
      facility: facility,
      fallback: fallback,
    ),
  );

  Future<FacilitySessionDetailsModel> _loadDetails({
    required int calendarId,
    Map<String, dynamic> reservation = const {},
    Map<String, dynamic>? facility,
    FacilitySessionEntity? fallback,
  }) async {
    final preview = await _preview(calendarId);
    final calendar = <String, dynamic>{
      ..._map(reservation['calendar']),
      ..._map(preview['calendar']),
    };
    var setting = const <String, dynamic>{};
    try {
      final response = await _dio.get(FacilityCalendarEndpoints.details(calendarId));
      calendar.addAll(_map(response.data));
      setting = _map(_map(response.extra[DataExtractorInterceptor.extraDataKey])['setting']);
    } on DioException catch (error) {
      // The dated detail endpoint excludes historical slots, while previews
      // and account reservations retain their historical context.
      if (error.response?.statusCode != 404 || calendar.isEmpty) rethrow;
    }
    final serviceId = _id(calendar['service_id']) ?? fallback?.serviceId;
    final facilityId = _id(calendar['facility_id']) ?? fallback?.facilityId;
    final service = serviceId == null
        ? const <String, dynamic>{}
        : await _get(FacilityCalendarEndpoints.service(serviceId));
    final facilityData =
        facility ??
        (facilityId == null
            ? const <String, dynamic>{}
            : await _get(FacilityCalendarEndpoints.facility(facilityId)));
    final currentUserId = _id(_auth.userData?['id']);
    var reservationData = reservation;
    if (reservationData.isEmpty && currentUserId != null) {
      final entries = [
        ...?(calendar['reserved'] as List?),
        ...?(calendar['waiting'] as List?),
        ...?(calendar['waitlists'] as List?),
      ];
      final own = entries
          .whereType<Map>()
          .where(
            (row) =>
                _id(row['user_id']) == currentUserId &&
                const {'reserved', 'waiting', 'waitlisted'}.contains(row['status']),
          )
          .firstOrNull;
      final reservationId = own == null ? null : _id(own['id']);
      if (reservationId != null) {
        // The preview selects the next usable ticket, which may differ from
        // the purchase ticket already spent on this reservation.
        reservationData = await _get('account-reservations/$reservationId');
      }
    }
    return FacilityCalendarPayloadMapper.details(
      calendar: calendar,
      preview: preview,
      service: service,
      facility: facilityData,
      reservation: reservationData,
      setting: setting,
      fallback: fallback,
      currentUserId: currentUserId,
    );
  }

  Future<FacilitySessionDetailsModel> _recurringDetails(FacilitySessionEntity session) async {
    final service = await _get(FacilityCalendarEndpoints.service(session.serviceId));
    final facility = session.facilityId == 0
        ? const <String, dynamic>{}
        : await _get(FacilityCalendarEndpoints.facility(session.facilityId));
    return FacilityCalendarPayloadMapper.details(
      calendar: const {},
      service: service,
      facility: facility,
      fallback: session,
      isRecurring: true,
    );
  }

  AsyncTask<FacilitySessionDetailsModel> updateReservation(SessionReservationDto dto) =>
      AsyncTaskExtension.tryCatchMapDioToFailure(() async {
        if (dto.session.isRecurring) {
          throw const FormatException('Recurring schedules cannot be reserved');
        }
        final before = await _loadDetails(calendarId: dto.sessionId, fallback: dto.session);
        final entity = FacilitySessionDetailsMapper.toEntity(before);
        switch (dto.action) {
          case SessionReservationAction.reserve:
            if (!entity.canReserve ||
                entity.isFull ||
                !entity.startsAt.isAfter(DateTime.now()) ||
                entity.accessibleTickets < 1 ||
                entity.viewerState.name != 'none') {
              throw const FormatException('This session cannot currently be reserved');
            }
            await _dio.get(FacilityCalendarEndpoints.reserve(dto.sessionId));
          case SessionReservationAction.cancelReservation:
            if (!entity.canWithdrawAt(DateTime.now()) ||
                entity.reservationId == null ||
                entity.viewerState.name != 'reserved') {
              throw const FormatException('This reservation cannot currently be cancelled');
            }
            await _dio.delete(FacilityCalendarEndpoints.reservation(entity.reservationId!));
          // There are no waitlist routes: reserving a full slot queues the
          // customer, and the queued row is cancelled like a reservation.
          case SessionReservationAction.joinWaitlist:
            if (!entity.canJoinWaitlist ||
                !entity.isFull ||
                !entity.startsAt.isAfter(DateTime.now()) ||
                entity.accessibleTickets < 1 ||
                entity.viewerState.name != 'none') {
              throw const FormatException('This waitlist cannot currently be joined');
            }
            await _dio.get(FacilityCalendarEndpoints.reserve(dto.sessionId));
          case SessionReservationAction.leaveWaitlist:
            if (!entity.canWithdrawAt(DateTime.now()) ||
                entity.reservationId == null ||
                entity.viewerState.name != 'waitlisted') {
              throw const FormatException('This waitlist entry cannot currently be removed');
            }
            await _dio.delete(FacilityCalendarEndpoints.reservation(entity.reservationId!));
        }
        return _loadDetails(calendarId: dto.sessionId, fallback: dto.session);
      });

  /// The ticket a reservation would use.
  ///
  /// When the customer holds no usable ticket the endpoint fails with a 500
  /// ("Trying to get property 'ticket' of non-object") instead of answering
  /// without one, so that failure is read as a count of zero — which offers
  /// "Purchase Tickets" rather than failing the whole sheet.
  Future<Map<String, dynamic>> _preview(int calendarId) async {
    try {
      return await _get(FacilityCalendarEndpoints.preview(calendarId));
    } on DioException catch (error) {
      if (error.response?.statusCode != 500) rethrow;
      return const {'tickets_quantity': 0};
    }
  }

  Future<Map<String, dynamic>> _get(String endpoint) async => _map((await _dio.get(endpoint)).data);
  static Map<String, dynamic> _map(dynamic value) =>
      value is Map ? Map<String, dynamic>.from(value) : const {};
  static int? _id(dynamic value) => value is num ? value.toInt() : int.tryParse('$value');
}
