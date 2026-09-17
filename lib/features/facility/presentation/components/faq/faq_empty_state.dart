import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// Shown when a facility has published no questions.
class FaqEmptyState extends StatelessWidget {
  const FaqEmptyState({super.key, required this.accentColor});

  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // The body's column is start-aligned for the lead-in text, so the empty
      // state has to claim the full width to centre itself in it.
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
              color: accentColor.withValues(alpha: 0.1),
            ),
            child: Icon(SolarIconsOutline.questionCircle, size: 32, color: accentColor),
          ),
          Text(
            context.l10n.facilityFaq_empty,
            style: context.typography.bold16.primary(context),
          ),
          Text(
            context.l10n.facilityFaq_emptyHint,
            textAlign: .center,
            style: context.typography.book13.tertiary(context),
          ),
        ],
      ),
    );
  }
}
