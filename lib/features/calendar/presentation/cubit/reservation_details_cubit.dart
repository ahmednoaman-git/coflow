import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'reservation_details_state.dart';

/// Drives the reservation bottom sheet: the details load plus the two ways of
/// giving the place up.
///
/// Withdrawals run through their own manager so the CTA can show a spinner
/// while the already-loaded reservation stays on screen.
@injectable
class ReservationDetailsCubit extends Cubit<ReservationDetailsState> {
  ReservationDetailsCubit(
    this._getReservationDetails,
    this._withdrawReservation,
    @factoryParam ReservationEntity reservation,
  ) : super(ReservationDetailsState(reservation: reservation)) {
    _initManagers();
  }

  final GetReservationDetailsUseCase _getReservationDetails;
  final WithdrawReservationUseCase _withdrawReservation;

  late final AsyncRequestManager<ReservationDetailsState, ReservationDetailsEntity> detailsManager;
  late final AsyncRequestManager<ReservationDetailsState, ReservationDetailsEntity> actionManager;

  void _initManagers() {
    detailsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.detailsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(detailsRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _getReservationDetails(
        GetReservationDetailsDto(reservation: state.reservation),
      ),
    );

    actionManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.actionRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(actionRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: false,
    );
  }

  /// Returns the spent ticket. Only offered before the cancellation deadline.
  Future<void> cancelReservation() => _run(ReservationWithdrawAction.cancelReservation);

  Future<void> leaveWaitlist() => _run(ReservationWithdrawAction.leaveWaitlist);

  Future<void> _run(ReservationWithdrawAction action) async {
    if (isClosed ||
        actionManager.isLoading ||
        actionManager.isSuccess ||
        !(state.details?.canWithdrawAt(DateTime.now()) ?? false)) {
      return;
    }
    await actionManager.execute(
      _withdrawReservation(
        WithdrawReservationDto(reservation: state.reservation, action: action),
      ),
    );
  }

  Future<void> refresh() {
    // Drop the last withdrawal's snapshot so the reloaded slot is what shows.
    actionManager.reset();
    return detailsManager.refresh();
  }

  void _emitIfOpen(ReservationDetailsState next) {
    if (!isClosed) emit(next);
  }
}
