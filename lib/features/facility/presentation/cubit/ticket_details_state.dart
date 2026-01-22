import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'ticket_details_state.freezed.dart';

@freezed
abstract class TicketDetailsState with _$TicketDetailsState {
  const factory TicketDetailsState({
    required int ticketId,
    @Default(AsyncState.idle()) AsyncState<FacilityTicketDetailsEntity> detailsRequest,
  }) = _TicketDetailsState;
}
