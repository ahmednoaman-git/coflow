import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/calendar_screen_body.dart';
import 'cubit/cubit.dart';

/// The user's reservations across every facility, a week at a time.
///
/// Pushed from the Account tab's Calendar counter, so it keeps the nav bar.
@RoutePage()
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (_) => getIt<CalendarCubit>(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(title: context.l10n.calendar_title, showBackButton: true),
          body: const CalendarScreenBody(),
        ),
      ),
    );
  }
}
