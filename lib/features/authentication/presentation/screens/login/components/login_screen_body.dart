import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/state.dart';
import 'login_form_section.dart';
import 'login_header_section.dart';

/// Main body content for the login screen.
class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.spacing.s24),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SizedBox(height: context.spacing.s48),
          const LoginHeaderSection(),
          SizedBox(height: context.spacing.s48),
          const LoginFormSection(),
          SizedBox(height: context.spacing.s32),
          const _LoginButton(),
          SizedBox(height: context.spacing.s24),
          const _SignUpLink(),
        ],
      ),
    );
  }
}

/// Login submit button with loading state.
class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<LoginCubit, LoginState, void>.loadingDependent(
      requestManagerGetter: (cubit) => cubit.loginManager,
      builder: (context, isLoading) {
        return BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (prev, curr) => prev.isFormValid != curr.isFormValid,
          builder: (context, state) {
            return MainButton(
              text: context.l10n.loginButton,
              isLoading: isLoading,
              isDisabled: !state.isFormValid,
              onPressed: () => context.read<LoginCubit>().submit(),
            );
          },
        );
      },
      onSuccess: (context, _) {
        context.router.replaceAll([const NavigationRootRoute()]);
      },
      onError: (context, failure) {
        context.showErrorSnackBar(failure.message);
      },
    );
  }
}

/// Link to registration screen.
class _SignUpLink extends StatelessWidget {
  const _SignUpLink();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.router.push(const RegisterRoute());
        },
        child: RichText(
          text: TextSpan(
            text: context.l10n.dontHaveAccount,
            style: context.typography.book14.secondary(context),
            children: [
              TextSpan(
                text: ' ${context.l10n.signUp}',
                style: context.typography.medium14.brand(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
