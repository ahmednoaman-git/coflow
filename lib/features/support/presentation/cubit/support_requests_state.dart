import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'support_requests_state.freezed.dart';

@freezed
abstract class SupportRequestsState with _$SupportRequestsState {
  const factory SupportRequestsState({
    @Default(AsyncState.idle()) AsyncState<PaginatedEntity<SupportRequestEntity>> requestsRequest,
    @Default(AsyncState.idle()) AsyncState<void> nextPageRequest,
    @Default(AsyncState.idle()) AsyncState<void> createRequest,
  }) = _SupportRequestsState;
}
