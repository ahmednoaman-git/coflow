import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/components.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';

/// Tickets/Promotions switch at the top of the Pricing tab, in the facility's
/// activity-line colours.
class PricingTabSelector extends StatelessWidget {
  const PricingTabSelector({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final FacilityPricingTab selectedTab;
  final void Function(FacilityPricingTab) onTabSelected;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);
    final l10n = context.l10n;

    return EzSlidingSelector<FacilityPricingTab>(
      segments: [
        EzSlidingSegment(
          value: FacilityPricingTab.tickets,
          label: l10n.facilityDetails_tickets.toUpperCase(),
        ),
        EzSlidingSegment(
          value: FacilityPricingTab.promotions,
          label: l10n.facilityDetails_promotions.toUpperCase(),
        ),
      ],
      selectedValue: selectedTab,
      onValueChanged: onTabSelected,
      trackColor: facilityData.activityLineColor,
      thumbColor: facilityData.activityLineBackground,
      selectedTextStyle: context.typography.bold14.primary(context),
      unselectedTextStyle: context.typography.medium14.inverse(context),
    );
  }
}
