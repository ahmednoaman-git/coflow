import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../activity_line/domain/domain.dart';
import 'components/components.dart';
import 'cubit/cubit.dart';

/// A facility's published questions and answers.
///
/// Pushed from the profile tab's FAQ button. It sits at the root of the router
/// rather than inside a tab, so it covers the bottom nav bar the way the other
/// facility detail screens do.
@RoutePage()
class FacilityFaqScreen extends StatelessWidget {
  const FacilityFaqScreen({super.key, required this.facility});

  final CollapsedFacilityEntity facility;

  @override
  Widget build(BuildContext context) {
    final (accentColor, _) = facility.activityLine.getColors(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider<FacilityFaqCubit>(
        create: (_) => getIt<FacilityFaqCubit>(param1: facility.id),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(title: context.l10n.facilityFaq_title, showBackButton: true),
          body: FaqScreenBody(facilityName: facility.name, accentColor: accentColor),
        ),
      ),
    );
  }
}
