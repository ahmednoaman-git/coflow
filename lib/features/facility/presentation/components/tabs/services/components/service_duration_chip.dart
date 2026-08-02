import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../facility_data_provider.dart';

/// The duration badge (e.g. "30 Minutes") shown on service tiles and details.
class ServiceDurationChip extends StatelessWidget {
  const ServiceDurationChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final accent = FacilityDataProvider.of(context).activityLineColor;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s8,
        vertical: context.spacing.s4,
      ),
      decoration: ShapeDecoration(
        shape: StadiumBorder(side: BorderSide(color: accent)),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: context.spacing.s4,
        children: [
          Icon(SolarIconsOutline.clockCircle, size: 12, color: accent),
          Text(label, style: context.typography.medium11.withColor(accent)),
        ],
      ),
    );
  }
}
