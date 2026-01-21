import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import 'activity_line_facilities_list.dart';
import 'activity_line_facilities_tag_list.dart';

/// Body of the activity line facilities screen.
class ActivityLineFacilitiesBody extends StatelessWidget {
  const ActivityLineFacilitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: context.spacing.s12),
        ),
        const ActivityLineFacilitiesTagList(),
        SliverToBoxAdapter(
          child: SizedBox(height: context.spacing.s12),
        ),
        const ActivityLineFacilitiesList(),
      ],
    );
  }
}
