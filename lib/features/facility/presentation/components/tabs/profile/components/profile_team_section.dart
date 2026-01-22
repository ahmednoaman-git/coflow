import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../page_section.dart';

/// Team section for facility profile.
/// 
/// Note: This section requires team data from a detailed FacilityProfileEntity.
/// Currently showing a placeholder until the backend provides team data.
class ProfileTeamSection extends StatelessWidget {
  const ProfileTeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageSection(
      title: context.l10n.facilityDetails_teamSectionTitle,
      svgIconPath: Assets.svgs.team.path,
      children: [
        Text(
          context.l10n.facilityDetails_comingSoon,
          style: context.typography.book12.tertiary(context),
        ),
      ],
    );
  }
}
