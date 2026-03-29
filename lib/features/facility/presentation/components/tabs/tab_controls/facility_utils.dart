import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../activity_line/domain/entities/collapsed_facility_entity.dart';
import '../pricing/pricing_tab_screen.dart';
import '../profile/profile_tab_screen.dart';

/// Utility class for facility tab management.
///
/// Tabs are resolved dynamically from [AccountType] and [SubscriptionStatus]:
/// - **Profile** — always shown.
/// - **Activities/Flows** — shown depending on account feature.
/// - **Courses** — shown for Pro accounts.
/// - **Schedule/Calendar** — shown depending on subscription tier.
/// - **Pricing** — shown when [FacilityFeature.purchasing] is available.
class FacilityUtils {
  FacilityUtils._();

  static List<String> getFacilityTabs(
    BuildContext context,
    CollapsedFacilityEntity facility,
  ) {
    final l10n = context.l10n;
    final features = facility.accountType.features(facility.subscriptionStatus);

    return [
      l10n.facilityDetails_profileTab,
      if (features.contains(FacilityFeature.activities)) l10n.facilityDetails_activitiesTab,
      if (features.contains(FacilityFeature.flows)) l10n.facilityDetails_flowsTab,
      if (features.contains(FacilityFeature.courses)) l10n.facilityDetails_coursesTab,
      if (features.contains(FacilityFeature.schedule)) l10n.facilityDetails_scheduleTab,
      if (features.contains(FacilityFeature.calendar)) l10n.facilityDetails_calendarTab,
      if (features.contains(FacilityFeature.purchasing)) l10n.facilityDetails_pricingTab,
    ];
  }

  static List<Widget> getFacilityTabWidgets(CollapsedFacilityEntity facility) {
    final features = facility.accountType.features(facility.subscriptionStatus);

    return [
      const ProfileTabScreen(),
      if (features.contains(FacilityFeature.activities))
        const _FeaturePlaceholderTabScreen(feature: FacilityFeature.activities),
      if (features.contains(FacilityFeature.flows))
        const _FeaturePlaceholderTabScreen(feature: FacilityFeature.flows),
      if (features.contains(FacilityFeature.courses))
        const _FeaturePlaceholderTabScreen(feature: FacilityFeature.courses),
      if (features.contains(FacilityFeature.schedule))
        const _FeaturePlaceholderTabScreen(feature: FacilityFeature.schedule),
      if (features.contains(FacilityFeature.calendar))
        const _FeaturePlaceholderTabScreen(feature: FacilityFeature.calendar),
      if (features.contains(FacilityFeature.purchasing)) const PricingTabScreen(),
    ];
  }
}

class _FeaturePlaceholderTabScreen extends StatelessWidget {
  const _FeaturePlaceholderTabScreen({required this.feature});

  final FacilityFeature feature;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final title = switch (feature) {
      FacilityFeature.activities => l10n.facilityDetails_activitiesTab,
      FacilityFeature.flows => l10n.facilityDetails_flowsTab,
      FacilityFeature.courses => l10n.facilityDetails_coursesTab,
      FacilityFeature.schedule => l10n.facilityDetails_scheduleTab,
      FacilityFeature.calendar => l10n.facilityDetails_calendarTab,
      FacilityFeature.purchasing => l10n.facilityDetails_pricingTab,
      FacilityFeature.onlinePayment => l10n.facilityDetails_pricingTab,
    };

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s24,
        vertical: context.spacing.s32,
      ),
      child: Column(
        spacing: context.spacing.s8,
        crossAxisAlignment: .center,
        children: [
          Text(
            title,
            style: context.typography.bold18.primary(context),
            textAlign: .center,
          ),
          Text(
            l10n.facilityDetails_comingSoon,
            style: context.typography.book14.secondary(context),
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}
