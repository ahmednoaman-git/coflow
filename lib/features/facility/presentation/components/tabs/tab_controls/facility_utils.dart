import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../activity_line/domain/entities/collapsed_facility_entity.dart';
import '../../../../domain/enums/enums.dart';
import '../pricing/pricing_tab_screen.dart';
import '../profile/profile_tab_screen.dart';
import '../schedule/schedule_tab_screen.dart';
import '../services/services_tab_screen.dart';

/// Utility class for facility tab management.
///
/// Tabs are resolved dynamically from [AccountType] and [SubscriptionStatus]:
/// - **Profile** — always shown.
/// - **Activities/Flows** — shown depending on account feature.
/// - **Courses** — shown for Pro accounts.
/// - **Schedule/Calendar** — shown depending on subscription tier.
/// - **Pricing** — shown when [FacilityFeature.purchasing] is available.
///
/// [getFacilityTabs], [getFacilityTabWidgets], and [pricingTabIndex] all
/// derive their ordering from the same [FacilityFeature] checks below and
/// must be kept in sync — the tab bar and tab body lists are index-aligned.
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
        const ServicesTabScreen(type: FacilityServiceType.activity),
      if (features.contains(FacilityFeature.flows))
        const ServicesTabScreen(type: FacilityServiceType.flow),
      if (features.contains(FacilityFeature.courses))
        const ServicesTabScreen(type: FacilityServiceType.course),
      if (features.contains(FacilityFeature.schedule)) const ScheduleTabScreen(),
      if (features.contains(FacilityFeature.calendar)) const ScheduleTabScreen(),
      if (features.contains(FacilityFeature.purchasing)) const PricingTabScreen(),
    ];
  }

  /// Index of the Pricing tab within [getFacilityTabWidgets] for [facility].
  /// Used to programmatically switch the main tab (e.g. the "View Pricing"
  /// CTA on the service details screen).
  static int pricingTabIndex(CollapsedFacilityEntity facility) {
    final features = facility.accountType.features(facility.subscriptionStatus);

    var index = 0; // Profile
    if (features.contains(FacilityFeature.activities)) index++;
    if (features.contains(FacilityFeature.flows)) index++;
    if (features.contains(FacilityFeature.courses)) index++;
    if (features.contains(FacilityFeature.schedule)) index++;
    if (features.contains(FacilityFeature.calendar)) index++;
    return index;
  }
}
