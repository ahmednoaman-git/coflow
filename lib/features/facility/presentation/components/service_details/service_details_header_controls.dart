import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../header/facility_header_controls.dart';

/// Back button overlay for the service details screen, placed and styled like
/// [FacilityHeaderControls]'s.
class ServiceDetailsHeaderControls extends StatelessWidget {
  const ServiceDetailsHeaderControls({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return PositionedDirectional(
      top: topPadding + (kToolbarHeight - CircularButton.standardSize) / 2,
      start: FacilityHeaderControls.buttonSpacing,
      child: MainBackButton(
        backgroundColor: Colors.black.withValues(alpha: 0.3),
        iconColor: Colors.white,
      ),
    );
  }
}
