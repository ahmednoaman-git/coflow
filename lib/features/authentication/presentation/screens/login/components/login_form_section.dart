import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../state/state.dart';

/// Form section with email and password inputs.
class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.s16,
      children: const [_EmailField(), _PasswordField(), _ForgotPasswordLink()],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return MainTextField(
      labelText: context.l10n.email,
      hintText: context.l10n.emailHint,
      prefixIcon: LucideIcons.mail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: context.read<LoginCubit>().emailChanged,
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return MainTextField(
      labelText: context.l10n.password,
      hintText: context.l10n.passwordHint,
      prefixIcon: LucideIcons.lock,
      passwordField: true,
      textInputAction: TextInputAction.done,
      onChanged: context.read<LoginCubit>().passwordChanged,
      onSubmitted: (_) => context.read<LoginCubit>().submit(),
    );
  }
}

class _ForgotPasswordLink extends StatelessWidget {
  const _ForgotPasswordLink();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .centerRight,
      child: GestureDetector(
        onTap: () {
          // TODO: Navigate to forgot password screen
        },
        child: Text(
          context.l10n.forgotPassword,
          style: context.typography.medium12.brand(context),
        ),
      ),
    );
  }
}
