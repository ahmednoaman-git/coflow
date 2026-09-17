import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Placeholder for the saved list, laid out to the same rhythm as the real
/// cards so nothing jumps when they land.
class SavedProfilesShimmer extends StatelessWidget {
  const SavedProfilesShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  static const double _cardHeight = 116;
  static const double _logoSize = 64;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Column(
        spacing: context.spacing.s16,
        children: [
          for (var index = 0; index < itemCount; index++)
            Stack(
              children: [
                ShimmerBox(height: _cardHeight, borderRadius: context.spacing.s16),
                PositionedDirectional(
                  start: context.spacing.s12,
                  top: context.spacing.s12,
                  child: ShimmerBox.dark(
                    width: _logoSize,
                    height: _logoSize,
                    borderRadius: _logoSize / 2,
                  ),
                ),
                PositionedDirectional(
                  start: context.spacing.s12 + _logoSize + context.spacing.s12,
                  top: context.spacing.s16,
                  child: ShimmerBox.dark(width: 120, height: 16, borderRadius: 4),
                ),
                PositionedDirectional(
                  start: context.spacing.s12 + _logoSize + context.spacing.s12,
                  top: context.spacing.s48,
                  child: ShimmerBox.dark(width: 160, height: 14, borderRadius: 4),
                ),
                PositionedDirectional(
                  start: context.spacing.s12 + _logoSize + context.spacing.s12,
                  bottom: context.spacing.s16,
                  child: ShimmerBox.dark(width: 110, height: 24, borderRadius: 12),
                ),
                PositionedDirectional(
                  end: context.spacing.s12,
                  bottom: context.spacing.s12,
                  child: ShimmerBox.dark(width: 40, height: 40, borderRadius: 20),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
