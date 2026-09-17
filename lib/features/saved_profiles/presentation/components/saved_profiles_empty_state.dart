import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Shown when the list has nothing to render.
///
/// Reads differently depending on [isFiltered]: an empty line is a dead end the
/// user can back out of, an empty account is one they have to go fill.
class SavedProfilesEmptyState extends StatelessWidget {
  const SavedProfilesEmptyState({super.key, required this.isFiltered});

  final bool isFiltered;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.spacing.s48),
      child: Column(
        spacing: context.spacing.s12,
        children: [
          Assets.svgs.bookmark.svg(
            width: 40,
            height: 40,
            colorFilter: context.colors.textDisabled.colorFilter,
          ),
          Text(
            isFiltered ? l10n.savedProfiles_emptyForLine : l10n.savedProfiles_empty,
            style: context.typography.medium16.secondary(context),
            textAlign: .center,
          ),
          if (!isFiltered)
            Text(
              l10n.savedProfiles_emptyHint,
              style: context.typography.book14.tertiary(context),
              textAlign: .center,
            ),
        ],
      ),
    );
  }
}
