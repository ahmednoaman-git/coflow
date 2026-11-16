import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Placeholder for the FAQ list: collapsed [FaqTile]s — question and chevron —
/// on the tile's own surface and spacing.
class FaqSkeleton extends StatelessWidget {
  const FaqSkeleton({super.key, this.itemCount = 5});

  final int itemCount;

  /// Varied so the stack reads as questions, not one repeated bar.
  static const List<double> _questionWidths = [0.8, 0.55, 0.7, 0.45, 0.65];

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Column(
        spacing: context.spacing.s12,
        children: [
          for (var index = 0; index < itemCount; index++)
            Container(
              padding: EdgeInsets.all(context.spacing.s16),
              decoration: ShapeDecoration(
                color: context.colors.backgroundWhite,
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(context.spacing.s16),
                  side: BorderSide(color: context.colors.strokePrimary),
                ),
                shadows: context.shadows.xs,
              ),
              child: Row(
                crossAxisAlignment: .start,
                spacing: context.spacing.s12,
                children: [
                  Expanded(
                    child: SkeletonText(
                      style: context.typography.medium14,
                      widthFactor: _questionWidths[index % _questionWidths.length],
                    ),
                  ),
                  const SkeletonBox(width: 20, height: 20, radius: 6),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
