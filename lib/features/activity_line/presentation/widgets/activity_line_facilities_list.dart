import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/activity_line_facilities_cubit.dart';
import '../cubit/activity_line_facilities_state.dart';
import 'facility_card.dart';

/// Grid/list of facilities for the activity line.
class ActivityLineFacilitiesList extends StatelessWidget {
  const ActivityLineFacilitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(context.spacing.s16),
      sliver: BlocBuilder<ActivityLineFacilitiesCubit, ActivityLineFacilitiesState>(
        buildWhen: (previous, current) => previous.facilities != current.facilities,
        builder: (context, state) {
          final facilities = state.facilities;

          if (facilities.isEmpty) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  context.l10n.search_noResults,
                  style: context.typography.book14.tertiary(context),
                ),
              ),
            );
          }

          return SliverList.separated(
            itemCount: facilities.length,
            itemBuilder: (context, index) {
              final facility = facilities[index];
              return FacilityCard(
                key: ValueKey(facility.id),
                facility: facility,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: context.spacing.s16);
            },
          );
        },
      ),
    );
  }
}
