import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../facility/domain/entities/entities.dart';
import '../../../page_section.dart';

/// Languages section for facility profile.
class LanguagesSection extends StatelessWidget {
  const LanguagesSection({super.key, required this.languages});

  final List<LanguageEntity> languages;

  @override
  Widget build(BuildContext context) {
    if (languages.isEmpty) {
      return const SizedBox.shrink();
    }

    return PageSection(
      title: context.l10n.facilityDetails_languagesSectionTitle,
      svgIconPath: Assets.svgs.language.path,
      children: [
        Text(
          languages.map((language) => language.name).join(' . '),
          style: context.typography.medium12.tertiary(context),
        ),
      ],
    );
  }
}
