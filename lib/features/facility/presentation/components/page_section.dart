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
    required this.children,
  });

  final String title;
  final String svgIconPath;
  final EdgeInsets? childPadding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s8,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
          child: Row(
            spacing: context.spacing.s4,
            children: [
              SvgPicture.asset(
                svgIconPath,
                width: 20,
                height: 20,
                colorFilter: FacilityDataProvider.of(context).activityLineColor.colorFilter,
              ),
              Text(
                title,
                style: context.typography.medium14.primary(context),
              ),
            ],
          ),
        ),
        ...children.map(
          (child) => Padding(
            padding: childPadding ?? EdgeInsets.symmetric(horizontal: context.spacing.s16),
            child: child,
          ),
        ),
        SizedBox(height: context.spacing.s8),
      ],
    );
  }
}
