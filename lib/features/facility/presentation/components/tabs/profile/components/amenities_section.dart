import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../page_section.dart';

/// Amenities section for facility profile.
class AmenitiesSection extends StatelessWidget {
  const AmenitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageSection(
      title: context.l10n.facilityDetails_amenitiesSectionTitle,
      svgIconPath: Assets.svgs.amenities.path,
      children: [
        Text(
          context.l10n.facilityDetails_comingSoon,
          style: context.typography.book12.tertiary(context),
        ),
      ],
    );
  }
}
