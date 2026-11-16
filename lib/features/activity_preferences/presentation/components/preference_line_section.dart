import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/entities/entities.dart';

/// One activity line on the Preferences screen: its element tile (as in the
/// design's Sky / Sea / Earth / Energy tiles) and its tags as toggle chips,
/// filled with the line's colour when picked.
class PreferenceLineSection extends StatelessWidget {
  const PreferenceLineSection({
    super.key,
    required this.line,
    required this.selectedTagIds,
    required this.onToggle,
  });

  final PreferenceActivityLineEntity line;
  final Set<int> selectedTagIds;
  final ValueChanged<int> onToggle;

  static const double tileSize = 44;

  @override
  Widget build(BuildContext context) {
    final activityLine = ActivityLineEntity.fromId(line.id);
    final isKnownLine = ActivityLineEntity.all.any((known) => known.id == line.id);
    final (accent, container) = isKnownLine
        ? activityLine.getColors(context)
        : (context.colors.signatureBlue, context.colors.signatureBlueSecondary);
    final name = isKnownLine ? activityLine.getName(context.l10n) : line.name;
    final picked = line.tags.where((tag) => selectedTagIds.contains(tag.id)).length;

    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s16,
      children: [
        Row(
          spacing: context.spacing.s12,
          children: [
            Container(
              width: tileSize,
              height: tileSize,
              padding: EdgeInsets.all(context.spacing.s12),
              decoration: ShapeDecoration(
                color: container.withValues(alpha: 0.6),
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(context.spacing.s12),
                ),
              ),
              child: isKnownLine
                  ? SvgPicture.asset(activityLine.iconPath, colorFilter: accent.colorFilter)
                  : null,
            ),
            Expanded(child: Text(name, style: context.typography.bold18.primary(context))),
            if (picked > 0)
              Text(
                context.l10n.preferences_pickedCount(picked),
                style: context.typography.medium13.withColor(accent),
              ),
          ],
        ),
        Wrap(
          spacing: context.spacing.s8,
          runSpacing: context.spacing.s8,
          children: [
            for (final tag in line.tags)
              PreferenceChip(
                label: tag.name,
                isSelected: selectedTagIds.contains(tag.id),
                accent: accent,
                onTap: () => onToggle(tag.id),
              ),
          ],
        ),
      ],
    );
  }
}

class PreferenceChip extends StatelessWidget {
  const PreferenceChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.accent,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final Color accent;
  final VoidCallback onTap;

  static EdgeInsets padding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: context.spacing.s16, vertical: 10);

  @override
  Widget build(BuildContext context) {
    final style = context.typography.medium14;

    return TappableScale(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        padding: padding(context),
        decoration: ShapeDecoration(
          color: isSelected ? accent : context.colors.backgroundWhite,
          shape: StadiumBorder(
            side: BorderSide(color: isSelected ? accent : context.colors.strokeSecondary),
          ),
          shadows: isSelected ? null : context.shadows.xs,
        ),
        child: Text(
          label,
          style: isSelected ? style.inverse(context) : style.primary(context),
        ),
      ),
    );
  }
}

/// Placeholder for a [PreferenceLineSection] while the tags load.
class PreferenceLineSectionSkeleton extends StatelessWidget {
  const PreferenceLineSectionSkeleton({super.key, required this.chipWidths});

  final List<double> chipWidths;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s16,
      children: [
        Row(
          spacing: context.spacing.s12,
          children: [
            SkeletonBox(
              width: PreferenceLineSection.tileSize,
              height: PreferenceLineSection.tileSize,
              radius: context.spacing.s12,
            ),
            SkeletonText(style: context.typography.bold18, width: 80),
          ],
        ),
        Wrap(
          spacing: context.spacing.s8,
          runSpacing: context.spacing.s8,
          children: [
            for (final width in chipWidths)
              SkeletonChip(
                style: context.typography.medium14,
                labelWidth: width,
                padding: PreferenceChip.padding(context),
              ),
          ],
        ),
      ],
    );
  }
}
