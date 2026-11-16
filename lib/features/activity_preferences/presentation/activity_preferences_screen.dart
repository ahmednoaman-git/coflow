import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/account/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/activity_preferences_body.dart';
import 'cubit/activity_preferences_cubit.dart';
import 'cubit/activity_preferences_state.dart';

/// The activity tags the customer is interested in, grouped by activity line.
@RoutePage()
class ActivityPreferencesScreen extends StatelessWidget {
  const ActivityPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (_) => getIt<ActivityPreferencesCubit>(),
        child: BlocListener<ActivityPreferencesCubit, ActivityPreferencesState>(
          // The profile carries the picks too; keep the app-wide copy current.
          listenWhen: (previous, current) =>
              !previous.saveRequest.isSuccess && current.saveRequest.isSuccess,
          listener: (context, _) => context.read<ProfileCubit>().profileManager.refresh(),
          child: Scaffold(
            backgroundColor: context.colors.backgroundTwo,
            appBar: BrandedAppBar(title: context.l10n.preferences_title, showBackButton: true),
            body: const ActivityPreferencesBody(),
          ),
        ),
      ),
    );
  }
}
