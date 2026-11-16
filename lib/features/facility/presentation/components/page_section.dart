import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'facility_data_provider.dart';

/// A section widget used in facility profile tabs.
///
/// Displays a title with an icon and a list of children widgets.
class PageSection extends StatelessWidget {
  const PageSection({
    super.key,
    required this.title,
    required this.svgIconPath,
    this.fullBleed = false,
    this.trailing,
    required this.children,
  });

  final String title;
  final String svgIconPath;

  /// Lays [children] out edge to edge instead of inside the section's side
  /// padding — for horizontal scrollers, so their items scroll out to the
  /// screen edge rather than being cut off at the margin. Such a child insets
  /// its own content by [sidePadding].
  final bool fullBleed;

  /// Optional action pinned to the end of the title row, e.g. the location
  /// section's "Link" pill.
  final Widget? trailing;
  final List<Widget> children;

  /// Around a section — shared with the skeletons standing in for one.
  static EdgeInsets padding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: sidePadding(context), vertical: context.spacing.s32);

  /// The section's margin on either side.
  static double sidePadding(BuildContext context) => context.spacing.s24;

  @override
  Widget build(BuildContext context) {
    final sides = EdgeInsets.symmetric(horizontal: sidePadding(context));
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.spacing.s32),
      child: Column(
        crossAxisAlignment: .start,
        spacing: context.spacing.s16,
        children: [
          Padding(
            padding: sides,
            child: Row(
              spacing: context.spacing.s16,
              children: [
                SvgPicture.asset(
                  svgIconPath,
                  width: 20,
                  height: 20,
                  colorFilter: FacilityDataProvider.of(context).activityLineColor.colorFilter,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: context.typography.medium14.primary(context),
                  ),
                ),
                ?trailing,
              ],
            ),
          ),
          for (final child in children) fullBleed ? child : Padding(padding: sides, child: child),
        ],
      ),
    );
  }
}
