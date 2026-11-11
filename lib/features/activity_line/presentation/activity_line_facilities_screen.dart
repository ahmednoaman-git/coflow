import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/activity_line_facilities_cubit.dart';
import 'widgets/widgets.dart';

/// Screen displaying facilities for a specific activity line.
@RoutePage()
class ActivityLineFacilitiesScreen extends StatelessWidget {
  const ActivityLineFacilitiesScreen({
    super.key,
    required this.activityLine,
    this.initialLocation = const SelectedLocation(),
    this.onLocationSelected,
  });

  /// The activity line to display facilities for.
  final ActivityLineEntity activityLine;

  /// Location the screen starts filtered by, typically the dashboard's
  /// selection. Dropped if this line has nothing there.
  final SelectedLocation initialLocation;

  /// Called with each location the user confirms here — not with the reset to
  /// every location when this line lacks [initialLocation] — so the screen
  /// that opened this one can follow along.
  final ValueChanged<SelectedLocation>? onLocationSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ActivityLineFacilitiesCubit>(
        param1: activityLine,
        param2: initialLocation,
      ),
      child: _ActivityLineFacilitiesView(onLocationSelected: onLocationSelected),
    );
  }
}

class _ActivityLineFacilitiesView extends StatelessWidget {
  const _ActivityLineFacilitiesView({required this.onLocationSelected});

  final ValueChanged<SelectedLocation>? onLocationSelected;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActivityLineFacilitiesCubit>();
    final (primaryColor, _) = cubit.state.activityLine.getColors(context);

    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: context.colors.textWhite,
          iconTheme: IconThemeData(color: context.colors.textWhite),
        ),
      ),
      child: Scaffold(
        appBar: ActivityLineFacilitiesAppBar(onLocationSelected: onLocationSelected),
        body: const ActivityLineFacilitiesBody(),
      ),
    );
  }
}
