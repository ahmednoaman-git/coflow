import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../cubit/activity_line_facilities_cubit.dart';
import '../cubit/activity_line_facilities_state.dart';

/// App bar for the activity line facilities screen.
class ActivityLineFacilitiesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ActivityLineFacilitiesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActivityLineFacilitiesCubit>();
    final activityLine = cubit.state.activityLine;
    final (primaryColor, _) = activityLine.getColors(context);

    return AppBar(
      backgroundColor: primaryColor,
      foregroundColor: context.colors.textWhite,
      title: Row(
        spacing: context.spacing.s8,
        children: [
          SvgPicture.asset(
            activityLine.iconPath,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              context.colors.textWhite,
              BlendMode.srcIn,
            ),
          ),
          Text(
            activityLine.getName(context.l10n),
            style: context.typography.medium14.inverse(context),
          ),
        ],
      ),
      actions: [
        BlocBuilder<ActivityLineFacilitiesCubit, ActivityLineFacilitiesState>(
          buildWhen: (previous, current) =>
              previous.locationsRequest != current.locationsRequest ||
              previous.selectedLocation != current.selectedLocation,
          builder: (context, state) {
            final isLoading = state.locationsRequest.isLoading;
            final locations = state.locationsRequest.isSuccess
                ? (state.locationsRequest as AsyncSuccess<LocationsEntity>).data
                : null;

            return LocationButton(
              selection: state.selectedLocation,
              isLoading: isLoading,
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
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.backgroundWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.spacing.s24),
        ),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<ActivityLineFacilitiesCubit>(),
        child: LocationSelectorBottomSheet(
          locations: locations,
          initialSelection: currentSelection,
          onConfirm: (location) =>
              context.read<ActivityLineFacilitiesCubit>().selectLocation(location),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
