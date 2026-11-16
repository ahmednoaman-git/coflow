import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import 'promotion_tile.dart';

/// Placeholder for a [PromotionTile]: its surface, the name and value row,
/// a couple of offer lines, and the footer's date, remaining count and like.
class PromotionSkeleton extends StatelessWidget {
  const PromotionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    final spacing = context.spacing;

    Widget iconAndText(double iconSize, double textWidth) => Row(
      spacing: spacing.s4,
      children: [
        SkeletonBox(width: iconSize, height: iconSize, radius: 6),
        SkeletonText(style: typography.book13, width: textWidth),
      ],
    );

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: EdgeInsets.all(spacing.s16),
            child: Column(
              crossAxisAlignment: .start,
              spacing: spacing.s16,
              children: [
                Row(
                  crossAxisAlignment: .start,
                  spacing: spacing.s12,
                  children: [
                    Expanded(child: SkeletonText(style: typography.medium16, widthFactor: 0.6)),
                    SkeletonText(style: typography.medium16, width: 56),
                  ],
                ),
                SkeletonText(style: typography.book14, lines: 2, widthFactor: 0.85),
              ],
            ),
          ),
          Divider(color: context.colors.strokeSecondary, height: 0),
          Padding(
            padding: EdgeInsets.all(spacing.s16),
            child: Row(
              children: [
                Expanded(child: iconAndText(20, 84)),
                Expanded(child: iconAndText(22, 72)),
                const SkeletonBox(width: 20, height: 20, radius: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// [count] [PromotionSkeleton]s, sized, aligned and spaced like
/// `FacilityPromotionsList`.
class PromotionSkeletonList extends StatelessWidget {
  const PromotionSkeletonList({super.key, this.count = 3});

  final int count;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final promotionWidth = constraints.maxWidth.clamp(200, 480).toDouble();

        return Skeleton(
          child: Column(
            spacing: context.spacing.s16,
            children: [
              for (var i = 0; i < count; i++)
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(width: promotionWidth, child: const PromotionSkeleton()),
                ),
            ],
          ),
        );
      },
    );
  }
}
