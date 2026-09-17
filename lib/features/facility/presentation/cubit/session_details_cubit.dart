import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'session_details_state.dart';

/// Drives the slot bottom sheet: the details load plus the four reservation
/// actions.
///
/// Actions run through their own manager so the CTA can show a spinner while
/// the already-loaded slot stays on screen.
@injectable
class SessionDetailsCubit extends Cubit<SessionDetailsState> {
  SessionDetailsCubit(
    this._getSessionDetails,
    this._updateSessionReservation,
    @factoryParam FacilitySessionEntity session,
  ) : super(SessionDetailsState(session: session)) {
    _initManagers();
  }

  final GetFacilitySessionDetailsUseCase _getSessionDetails;
  final UpdateSessionReservationUseCase _updateSessionReservation;

  late final AsyncRequestManager<SessionDetailsState, FacilitySessionDetailsEntity> detailsManager;
  late final AsyncRequestManager<SessionDetailsState, FacilitySessionDetailsEntity> actionManager;

  void _initManagers() {
    detailsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.detailsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(detailsRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _getSessionDetails(
        GetFacilitySessionDetailsDto(session: state.session),
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

  /// Confirmed from the reservation dialog — spends one accessible ticket.
  Future<void> reserve() => _run(SessionReservationAction.reserve);

  /// Returns the spent ticket. Only offered before the cancellation deadline.
  Future<void> cancelReservation() => _run(SessionReservationAction.cancelReservation);

  /// Fires straight from the CTA — no confirmation, no ticket spent.
  Future<void> joinWaitlist() => _run(SessionReservationAction.joinWaitlist);

  Future<void> leaveWaitlist() => _run(SessionReservationAction.leaveWaitlist);

  Future<void> _run(SessionReservationAction action) async {
    if (isClosed || actionManager.isLoading) return;
    await actionManager.execute(
      _updateSessionReservation(
        SessionReservationDto(session: state.session, action: action),
      ),
    );
  }

  Future<void> refresh() {
    // Drop the last action's snapshot so the reloaded slot is what shows.
    actionManager.reset();
    return detailsManager.refresh();
  }

  void _emitIfOpen(SessionDetailsState next) {
    if (!isClosed) emit(next);
  }
}
