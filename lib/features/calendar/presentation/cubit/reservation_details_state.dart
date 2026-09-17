import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'reservation_details_state.freezed.dart';

@freezed
abstract class ReservationDetailsState with _$ReservationDetailsState {
  const ReservationDetailsState._();

  const factory ReservationDetailsState({
    /// The listing entry the sheet was opened from — what the details and
    /// withdrawal requests are keyed on.
    required ReservationEntity reservation,

    @Default(AsyncState.idle()) AsyncState<ReservationDetailsEntity> detailsRequest,
    @Default(AsyncState.idle()) AsyncState<ReservationDetailsEntity> actionRequest,
  }) = _ReservationDetailsState;

  /// The reservation as last known: the withdrawal's answer when there is one,
  /// otherwise the loaded details.
  ReservationDetailsEntity? get details => actionRequest.dataOrNull ?? detailsRequest.dataOrNull;
}
