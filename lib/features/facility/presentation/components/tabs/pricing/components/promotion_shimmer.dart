import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

class PromotionShimmer extends StatelessWidget {
  const PromotionShimmer({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        width: width,
        padding: EdgeInsets.all(context.spacing.s16),
        decoration: ShapeDecoration(
          color: context.colors.backgroundWhite,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s16),
            side: BorderSide(color: context.colors.strokePrimary),
          ),
          shadows: context.shadows.sm,
        ),
        child: Column(
          spacing: context.spacing.s12,
          crossAxisAlignment: .start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox.dark(width: 180, height: 16, borderRadius: 6),
                      ShimmerBox.dark(width: 120, height: 12, borderRadius: 6),
                    ],
                  ),
                ),
                SizedBox(width: context.spacing.s12),
                const ShimmerBox.dark(width: 88, height: 36, borderRadius: 12),
              ],
            ),
            const ShimmerBox.dark(height: 14, width: 220, borderRadius: 6),
            const ShimmerBox.dark(height: 14, width: 170, borderRadius: 6),
            Divider(color: context.colors.strokePrimary, height: 1),
            Row(
              children: [
                const Expanded(
                  child: ShimmerBox.dark(height: 14, width: 120, borderRadius: 6),
                ),
                SizedBox(width: context.spacing.s8),
                const ShimmerBox.dark(height: 28, width: 96, borderRadius: 10),
                SizedBox(width: context.spacing.s8),
                const ShimmerBox.dark(height: 20, width: 20, borderRadius: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PromotionShimmerList extends StatelessWidget {
  const PromotionShimmerList({super.key, this.count = 3});

  final int count;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final promotionWidth = constraints.maxWidth.clamp(200, 480).toDouble();

        return Column(
          spacing: context.spacing.s16,
          children: [
            for (var i = 0; i < count; i++) PromotionShimmer(width: promotionWidth),
          ],
        );
      },
    );
  }
}
