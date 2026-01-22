import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../activity_line/domain/entities/collapsed_facility_entity.dart';
import '../pricing/pricing_tab_screen.dart';
import '../profile/profile_tab_screen.dart';

/// Utility class for facility tab management.
class FacilityUtils {
  FacilityUtils._();

  static List<String> getFacilityTabs(
    BuildContext context,
    CollapsedFacilityEntity facility,
  ) {
    final l10n = context.l10n;
    return [
      l10n.facilityDetails_profileTab,
      l10n.facilityDetails_pricingTab,
    ];
  }

  static List<Widget> getFacilityTabWidgets(CollapsedFacilityEntity facility) {
    return const [
      ProfileTabScreen(),
      PricingTabScreen(),
    ];
  }
}
