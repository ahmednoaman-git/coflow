import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Placeholder matching the collapsed [FaqTile] rhythm while questions load.
class FaqShimmer extends StatelessWidget {
  const FaqShimmer({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Column(
        spacing: context.spacing.s12,
        children: [
          for (var index = 0; index < itemCount; index++)
            Stack(
              children: [
                const ShimmerBox(width: double.infinity, height: 56, borderRadius: 16),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.spacing.s16,
                      vertical: context.spacing.s16,
                    ),
                    child: Row(
                      children: [
                        // Alternate the width so the stack reads as questions,
                        // not as one repeated bar.
                        Expanded(
                          flex: index.isEven ? 7 : 5,
                          child: const ShimmerBox.dark(height: 12, borderRadius: 6),
                        ),
                        const Spacer(flex: 3),
                        const ShimmerBox.dark(width: 20, height: 20, borderRadius: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
