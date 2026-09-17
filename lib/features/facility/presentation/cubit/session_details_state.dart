import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'session_details_state.freezed.dart';

@freezed
abstract class SessionDetailsState with _$SessionDetailsState {
  const SessionDetailsState._();

  const factory SessionDetailsState({
    /// The listing entry the sheet was opened from — renders the header before
    /// the details land.
    required FacilitySessionEntity session,
    @Default(AsyncState.idle()) AsyncState<FacilitySessionDetailsEntity> detailsRequest,
    @Default(AsyncState.idle()) AsyncState<FacilitySessionDetailsEntity> actionRequest,
  }) = _SessionDetailsState;

  /// The freshest slot we hold: every reservation action answers with the
  /// updated slot, so its result supersedes the initial load.
  FacilitySessionDetailsEntity? get details =>
      actionRequest.dataOrNull ?? detailsRequest.dataOrNull;
}
