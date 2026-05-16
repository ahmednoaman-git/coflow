import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'promotion_details_state.freezed.dart';

@freezed
abstract class PromotionDetailsState with _$PromotionDetailsState {
  const factory PromotionDetailsState({
    required int promotionId,
    @Default(AsyncState.idle()) AsyncState<FacilityPromotionDetailsEntity> detailsRequest,
  }) = _PromotionDetailsState;
}
