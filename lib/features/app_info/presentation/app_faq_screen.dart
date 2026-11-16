import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/app_faq_body.dart';
import 'cubit/app_faq_cubit.dart';

/// Coflow's customer FAQs. Pushed from the Account tab, so it keeps the nav bar.
@RoutePage()
class AppFaqScreen extends StatelessWidget {
  const AppFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (_) => getIt<AppFaqCubit>(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(title: context.l10n.account_faqs, showBackButton: true),
          body: const AppFaqBody(),
        ),
      ),
    );
  }
}
