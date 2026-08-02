import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../facility_data_provider.dart';
import 'service_details_result.dart';

/// Pinned CTA at the bottom of the service details screen. Pops the screen
/// with [FacilityServiceDetailsResult.viewPricing] so the caller can switch
/// the facility screen's main tab to Pricing.
class ServiceViewPricingButton extends StatelessWidget {
  const ServiceViewPricingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final accent = FacilityDataProvider.of(context).activityLineColor;

    return SafeArea(
      minimum: EdgeInsets.all(context.spacing.s16),
      child: MainButton(
        text: context.l10n.facilityDetails_viewPricing,
        backgroundColor: accent,
        onPressed: () => context.router.maybePop(FacilityServiceDetailsResult.viewPricing),
      ),
    );
  }
}
