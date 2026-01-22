import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../page_section.dart';

/// Branches section for facility profile.
class BranchesSection extends StatelessWidget {
  const BranchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageSection(
      title: context.l10n.facilityDetails_branchesSectionTitle,
      svgIconPath: Assets.svgs.branch.path,
      children: [
        Text(
          context.l10n.facilityDetails_comingSoon,
          style: context.typography.book12.tertiary(context),
        ),
      ],
    );
  }
}
