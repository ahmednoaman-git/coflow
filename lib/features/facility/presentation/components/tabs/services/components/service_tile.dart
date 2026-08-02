import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/enums/enums.dart';
import '../../../facility_data_provider.dart';
import '../../../service_details/service_details_result.dart';
import '../../tab_controls/tab_controls.dart';
import 'service_duration_chip.dart';
import 'service_level_pill.dart';

/// A single service/flow/course row: thumbnail, name, and optional
/// level/duration badges. Tapping pushes the full details screen and, if
/// the user tapped "View Pricing" there, switches the facility screen's
/// main tab to Pricing.
class ServiceTile extends StatelessWidget {
  const ServiceTile({super.key, required this.service, required this.type});

  final CollapsedFacilityServiceEntity service;
  final FacilityServiceType type;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      onTap: () => _openDetails(context),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(context.spacing.s12),
        decoration: ShapeDecoration(
          color: context.colors.backgroundWhite,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: context.colors.strokePrimary),
          ),
          shadows: context.shadows.sm,
        ),
        child: Row(
          spacing: context.spacing.s12,
          children: [
            ShimmerImage(
              imageUrl: service.imageUrl,
              width: 56,
              height: 56,
              borderRadius: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: context.spacing.s8,
                children: [
                  Text(
                    service.name,
                    style: context.typography.medium14.primary(context),
                  ),
                  Wrap(
                    spacing: context.spacing.s8,
                    runSpacing: context.spacing.s4,
                    children: [
                      if (service.level case final level?) ServiceLevelPill(level: level),
                      if (service.durationLabel case final duration?)
                        ServiceDurationChip(label: duration),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openDetails(BuildContext context) async {
    final tabController = FacilityTabController.of(context);
    final facilityData = FacilityDataProvider.of(context);
    final pricingIndex = FacilityUtils.pricingTabIndex(facilityData.facility);

    final result = await context.router.push<FacilityServiceDetailsResult>(
      FacilityServiceDetailsRoute(
        service: service,
        type: type,
        facility: facilityData.facility,
      ),
    );

    if (result == FacilityServiceDetailsResult.viewPricing && context.mounted) {
      tabController.setSelectedTab(pricingIndex);
    }
  }
}
