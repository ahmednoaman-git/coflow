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
    this.childPadding,
    this.trailing,
    required this.children,
  });

  final String title;
  final String svgIconPath;
  final EdgeInsets? childPadding;

  /// Optional action pinned to the end of the title row, e.g. the location
  /// section's "Link" pill.
  final Widget? trailing;
  final List<Widget> children;

  /// Around a section — shared with the skeletons standing in for one.
  static EdgeInsets padding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: context.spacing.s24, vertical: context.spacing.s32);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding(context),
      child: Column(
        crossAxisAlignment: .start,
        spacing: context.spacing.s16,
        children: [
          Row(
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
          ...children.map(
            (child) => Padding(
              padding: childPadding ?? EdgeInsets.zero,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
