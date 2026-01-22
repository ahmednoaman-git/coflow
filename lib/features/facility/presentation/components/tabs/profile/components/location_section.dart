import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../page_section.dart';

/// Location section for facility profile.
class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageSection(
      title: context.l10n.facilityDetails_locationSectionTitle,
      svgIconPath: Assets.svgs.location.path,
      children: [
        Text(
          context.l10n.facilityDetails_comingSoon,
          style: context.typography.book12.tertiary(context),
        ),
      ],
    );
  }
}
