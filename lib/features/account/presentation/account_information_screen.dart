import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/account_information_body.dart';
import 'cubit/cubit.dart';

/// The signed-in user's details, photo and password.
///
/// Pushed from the Account tab's management list, so it keeps the nav bar.
@RoutePage()
class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (_) => getIt<AccountInfoCubit>(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(title: context.l10n.account_information, showBackButton: true),
          body: const AccountInformationBody(),
        ),
      ),
    );
  }
}
