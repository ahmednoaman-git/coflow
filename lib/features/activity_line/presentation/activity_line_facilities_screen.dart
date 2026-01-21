import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/entities.dart';
import 'cubit/activity_line_facilities_cubit.dart';
import 'cubit/activity_line_facilities_state.dart';
import 'widgets/widgets.dart';

/// Screen displaying facilities for a specific activity line.
@RoutePage()
class ActivityLineFacilitiesScreen extends StatelessWidget {
  const ActivityLineFacilitiesScreen({
    super.key,
    required this.activityLine,
  });

  /// The activity line to display facilities for.
  final ActivityLineEntity activityLine;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ActivityLineFacilitiesCubit>(
        param1: activityLine,
      ),
      child: _ActivityLineFacilitiesView(),
    );
  }
}

class _ActivityLineFacilitiesView extends StatelessWidget {
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
        appBar: const ActivityLineFacilitiesAppBar(),
        body:
            AsyncHandler<
              ActivityLineFacilitiesCubit,
              ActivityLineFacilitiesState,
              ActivityLineFacilitiesEntity
            >(
              requestManagerGetter: (cubit) => cubit.facilitiesManager,
              successBuilder: (context, data) => const ActivityLineFacilitiesBody(),
              onRetry: (cubit) => cubit.refresh(),
            ),
      ),
    );
  }
}
