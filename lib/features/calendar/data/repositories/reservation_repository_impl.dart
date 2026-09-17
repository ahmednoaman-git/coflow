import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: ReservationRepository)
class ReservationRepositoryImpl implements ReservationRepository {
  const ReservationRepositoryImpl(this._remote);

  final ReservationRemoteDataSource _remote;

  @override
  AsyncTask<ReservationCalendarEntity> getReservations(GetReservationsDto dto) {
    return _remote.getReservations(dto).map((model) => ReservationMapper.toEntity(model, dto));
  }

  @override
  AsyncTask<ReservationDetailsEntity> getReservationDetails(GetReservationDetailsDto dto) {
    return _remote.getReservationDetails(dto).map(ReservationDetailsMapper.toEntity);
  }

  @override
  AsyncTask<ReservationDetailsEntity> withdrawReservation(WithdrawReservationDto dto) {
    return _remote.withdrawReservation(dto).map((model) {
      final details = ReservationDetailsMapper.toEntity(model);
      return details.copyWith(
        slot: details.slot.copyWith(
          viewerState: SessionViewerState.none,
          reservationId: null,
          reservationTicket: null,
          canWithdraw: false,
        ),
      );
    });
  }
}
