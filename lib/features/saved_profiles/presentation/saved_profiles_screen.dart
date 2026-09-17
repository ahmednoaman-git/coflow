import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/saved_profiles_screen_body.dart';
import 'cubit/cubit.dart';

/// The facilities the user has saved.
///
/// Pushed from the Account tab's Businesses counter, so it keeps the nav bar.
@RoutePage()
class SavedProfilesScreen extends StatelessWidget {
  const SavedProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (_) => getIt<SavedProfilesCubit>(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(title: context.l10n.savedProfiles_title, showBackButton: true),
          body: const SavedProfilesScreenBody(),
        ),
      ),
    );
  }
}
