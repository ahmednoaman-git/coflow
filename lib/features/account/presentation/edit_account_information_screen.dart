import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/navigation_root/presentation/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/edit_account_information_form.dart';
import 'cubit/cubit.dart';

/// Form for editing the user's details, opened from Account Information.
@RoutePage()
class EditAccountInformationScreen extends StatelessWidget {
  const EditAccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The fresh profile when it has loaded (it has, to reach this screen),
    // else the user cached at sign-in.
    final user = context.read<ProfileCubit>().user ?? context.user;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (_) => getIt<AccountInfoCubit>(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(title: context.l10n.accountInfo_editTitle, showBackButton: true),
          body: EditAccountInformationForm(user: user),
        ),
      ),
    );
  }
}
