import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Placeholder for the services list: [ServiceTile]s — thumbnail, name and a
/// level badge — on the tile's own surface and spacing.
class ServicesSkeleton extends StatelessWidget {
  const ServicesSkeleton({super.key, this.count = 4});

  final int count;

  @override
  Widget build(BuildContext context) {
    // No padding of its own: it sits in the tab's, like the tiles.
    return Skeleton(
      child: Column(
        spacing: context.spacing.s12,
        children: [for (var i = 0; i < count; i++) const _ServiceTileSkeleton()],
      ),
    );
  }
}

class _ServiceTileSkeleton extends StatelessWidget {
  const _ServiceTileSkeleton();

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Container(
      padding: EdgeInsets.all(spacing.s12),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: Row(
        spacing: spacing.s12,
        children: [
          const SkeletonBox(width: 56, height: 56, radius: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: spacing.s8,
              children: [
                SkeletonText(style: context.typography.medium14, widthFactor: 0.55),
                SkeletonChip(
                  style: context.typography.medium11,
                  labelWidth: 64,
                  padding: EdgeInsets.symmetric(horizontal: spacing.s8, vertical: spacing.s4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
