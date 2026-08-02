import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Shimmer placeholder matching [ServiceTile]'s layout.
class ServicesShimmer extends StatelessWidget {
  const ServicesShimmer({super.key, this.count = 4});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spacing.s16),
      child: Shimmer(
        child: Column(
          spacing: context.spacing.s12,
          children: [
            for (var i = 0; i < count; i++) const _ServiceTileShimmer(),
          ],
        ),
      ),
    );
  }
}

class _ServiceTileShimmer extends StatelessWidget {
  const _ServiceTileShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spacing.s12),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
      ),
      child: Row(
        spacing: context.spacing.s12,
        children: [
          const ShimmerBox(width: 56, height: 56, borderRadius: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: context.spacing.s8,
              children: [
                const ShimmerBox.dark(width: 140, height: 14, borderRadius: 4),
                const ShimmerBox.dark(width: 80, height: 20, borderRadius: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
