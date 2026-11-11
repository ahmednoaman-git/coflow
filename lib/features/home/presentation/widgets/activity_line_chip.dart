import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Activity line chip widget displaying Sky, Sea, Earth, or Energy.
/// Designed as a square button for use in a grid layout.
///
/// Its icon and caption are heroes, so they fly into the line screen's app bar.
class ActivityLineChip extends StatelessWidget {
  const ActivityLineChip({
    super.key,
    required this.activityLine,
    required this.isSelected,
    this.onTap,
  });

  final ActivityLineEntity activityLine;

  /// Whether this chip is selected.
  final bool isSelected;

  /// Callback when chip is tapped.
  final VoidCallback? onTap;

  static const double _iconSize = 28;

  @override
  Widget build(BuildContext context) {
    final (lineColor, _) = activityLine.getColors(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: ShapeDecoration(
          color: isSelected ? context.colors.signatureBlue : context.colors.backgroundWhite,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s16),
            side: BorderSide(
              color: isSelected ? context.colors.signatureBlue : context.colors.strokePrimary,
            ),
          ),
          shadows: context.shadows.sm,
        ),
        child: Column(
          mainAxisAlignment: .center,
          spacing: context.spacing.s8,
          children: [
            ActivityLineIconHero(
              activityLine: activityLine,
              size: _iconSize,
              color: isSelected ? context.colors.textWhite : lineColor,
            ),
            ActivityLineNameHero(
              activityLine: activityLine,
              style: context.typography.medium12.copyWith(
                color: isSelected ? context.colors.textWhite : context.colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
