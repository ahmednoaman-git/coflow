import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';

part 'service_details_state.freezed.dart';

@freezed
abstract class ServiceDetailsState with _$ServiceDetailsState {
  const factory ServiceDetailsState({
    required int serviceId,
    required FacilityServiceType type,
    @Default(AsyncState.idle()) AsyncState<FacilityServiceDetailsEntity> detailsRequest,
  }) = _ServiceDetailsState;
}
