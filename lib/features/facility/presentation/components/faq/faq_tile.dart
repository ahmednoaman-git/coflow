import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../domain/entities/entities.dart';

/// One question in the FAQ list, collapsed to its question until tapped.
///
/// The chevron rotates and the answer grows in place, so the list keeps its
/// rhythm while an entry is open.
class FaqTile extends StatelessWidget {
  const FaqTile({
    super.key,
    required this.faq,
    required this.isExpanded,
    required this.accentColor,
    required this.onTap,
  });

  final FacilityFaqEntity faq;
  final bool isExpanded;
  final Color accentColor;
  final VoidCallback onTap;

  static const Duration _duration = Duration(milliseconds: 220);

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      borderRadius: BorderRadius.circular(context.spacing.s16),
      splashColor: accentColor.withValues(alpha: 0.08),
      onTap: onTap,
      child: AnimatedContainer(
        duration: _duration,
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.all(context.spacing.s16),
        decoration: ShapeDecoration(
          color: context.colors.backgroundWhite,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s16),
            side: BorderSide(
              color: isExpanded ? accentColor.withValues(alpha: 0.4) : context.colors.strokePrimary,
            ),
          ),
          shadows: context.shadows.xs,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              crossAxisAlignment: .start,
              spacing: context.spacing.s12,
              children: [
                Expanded(
                  child: Text(
                    faq.question,
                    style: context.typography.medium14.primary(context),
                  ),
                ),
                AnimatedRotation(
                  duration: _duration,
                  curve: Curves.easeOutCubic,
                  turns: isExpanded ? 0.5 : 0,
                  child: Icon(
                    SolarIconsOutline.altArrowDown,
                    size: 20,
                    color: isExpanded ? accentColor : context.colors.textTertiary,
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: _duration,
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: isExpanded
                  ? Padding(
                      padding: EdgeInsets.only(top: context.spacing.s12),
                      child: Column(
                        crossAxisAlignment: .start,
                        spacing: context.spacing.s12,
                        children: [
                          Divider(height: 1, thickness: 1, color: context.colors.strokePrimary),
                          Text(
                            faq.answer,
                            style: context.typography.book13
                                .secondary(context)
                                .copyWith(height: 1.5),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(width: double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}
