import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/activity_line_facilities_cubit.dart';
import '../cubit/activity_line_facilities_state.dart';

/// App bar for the activity line facilities screen.
class ActivityLineFacilitiesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ActivityLineFacilitiesAppBar({super.key, this.onLocationSelected});

  /// Told about every location the user confirms in the sheet.
  final ValueChanged<SelectedLocation>? onLocationSelected;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActivityLineFacilitiesCubit>();
    final activityLine = cubit.state.activityLine;
    final (primaryColor, _) = activityLine.getColors(context);

    return AppBar(
      backgroundColor: primaryColor,
      foregroundColor: context.colors.textWhite,
      leading: Center(
        child: MainBackButton(
          backgroundColor: Colors.transparent,
          iconColor: context.colors.textWhite,
        ),
      ),
      // Both fly in from the dashboard chip the screen was opened from.
      title: Row(
        spacing: context.spacing.s8,
        children: [
          ActivityLineIconHero(
            activityLine: activityLine,
            size: 20,
            color: context.colors.textWhite,
          ),
          Flexible(
            child: ActivityLineNameHero(
              activityLine: activityLine,
              maxLines: 1,
              overflow: .ellipsis,
              style: context.typography.medium14.inverse(context),
            ),
          ),
        ],
      ),
      actions: [
        BlocBuilder<ActivityLineFacilitiesCubit, ActivityLineFacilitiesState>(
          buildWhen: (previous, current) =>
              previous.locationsRequest != current.locationsRequest ||
              previous.selectedLocation != current.selectedLocation,
          builder: (context, state) {
            final locations = state.locationsRequest.dataOrNull;

            // No spinner while the line's locations load: the selection the
            // screen opened with stands in, and the button opens once they
            // arrive.
            return LocationButton(
              selection: state.selectedLocation,
              isLoading: false,
              backgroundColor: Colors.transparent,
              textColor: context.colors.textWhite,
              iconColor: context.colors.textWhite,
              onTap: locations != null
                  ? () => _showLocationBottomSheet(
                      context,
                      locations: locations,
                      currentSelection: state.selectedLocation,
                    )
                  : null,
            );
          },
        ),
        SizedBox(width: context.spacing.s8),
      ],
    );
  }

  void _showLocationBottomSheet(
    BuildContext context, {
    required LocationsEntity locations,
    required SelectedLocation currentSelection,
  }) {
    // Captured up front: the sheet mounts on the root navigator, outside this
    // subtree, so it cannot look the cubit up for itself.
    final cubit = context.read<ActivityLineFacilitiesCubit>();

    showMainBottomSheet<void>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: LocationSelectorBottomSheet(
          locations: locations,
          initialSelection: currentSelection,
          onConfirm: (location) {
            cubit.selectLocation(location);
            onLocationSelected?.call(location);
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
