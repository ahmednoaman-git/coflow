import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// What a list or document shows when it has nothing in it: an icon in a
/// tinted disc, a title and an optional hint, centred in the available width.
class EmptyStateView extends StatelessWidget {
  const EmptyStateView({
    super.key,
    required this.icon,
    required this.title,
    this.hint,
    this.accentColor,
  });

  final IconData icon;
  final String title;
  final String? hint;

  /// Tints the disc and the icon. Defaults to the brand colour.
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    final accent = accentColor ?? context.colors.signatureBlue;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: context.spacing.s48),
      child: Column(
        spacing: context.spacing.s16,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: accent.withValues(alpha: 0.1),
            ),
            child: Icon(icon, size: 32, color: accent),
          ),
          Text(title, textAlign: .center, style: context.typography.bold16.primary(context)),
          if (hint != null)
            Text(hint!, textAlign: .center, style: context.typography.book13.tertiary(context)),
        ],
      ),
    );
  }
}
