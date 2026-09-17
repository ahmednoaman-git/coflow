import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Placeholder body for a tab whose screen has not been built yet.
class ComingSoonView extends StatelessWidget {
  const ComingSoonView({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        // Keeps the mark optically centred in the space the bar leaves over.
        padding: EdgeInsets.only(bottom: context.bottomInset),
        child: Column(
          mainAxisSize: .min,
          spacing: context.spacing.s16,
          children: [
            Icon(icon, size: 48, color: context.colors.textDisabled),
            Text(context.l10n.comingSoon, style: context.typography.medium16.tertiary(context)),
          ],
        ),
      ),
    );
  }
}
