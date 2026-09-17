import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../activity_line/domain/entities/collapsed_facility_entity.dart';
import '../../domain/entities/entities.dart';

part 'facility_details_state.freezed.dart';

enum FacilityDetailsTab { profile, pricing, schedule, calendar }

enum FacilityPricingTab { tickets, promotions }

@freezed
abstract class FacilityDetailsState with _$FacilityDetailsState {
  const factory FacilityDetailsState({
    required CollapsedFacilityEntity facility,
    @Default(FacilityDetailsTab.profile) FacilityDetailsTab selectedTab,
    @Default(FacilityPricingTab.tickets) FacilityPricingTab selectedPricingTab,
    @Default(AsyncState.idle()) AsyncState<FacilityProfileEntity> profileRequest,
    @Default(AsyncState.idle()) AsyncState<List<FacilityPromotionEntity>> promotionsRequest,
    @Default(AsyncState.idle()) AsyncState<List<FacilityTicketEntity>> ticketsRequest,
    @Default(AsyncState.idle()) AsyncState<FacilityServicesEntity> activitiesRequest,
    @Default(AsyncState.idle()) AsyncState<FacilityServicesEntity> flowsRequest,
    @Default(AsyncState.idle()) AsyncState<FacilityServicesEntity> coursesRequest,

    /// In-flight state of the save toggle. The resulting flags live on the
    /// loaded profile, which the toggle updates in place.
    @Default(AsyncState.idle()) AsyncState<void> saveRequest,
  }) = _FacilityDetailsState;
}
