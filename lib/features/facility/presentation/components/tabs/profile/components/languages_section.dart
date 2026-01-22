import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../page_section.dart';

/// Languages section for facility profile.
class LanguagesSection extends StatelessWidget {
  const LanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageSection(
      title: context.l10n.facilityDetails_languagesSectionTitle,
      svgIconPath: Assets.svgs.language.path,
      children: [
        Text(
          context.l10n.facilityDetails_comingSoon,
          style: context.typography.book12.tertiary(context),
        ),
      ],
    );
  }
}
