import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../state/state.dart';

/// Step 1: Basic information (name, email, password).
class RegisterStep1 extends StatelessWidget {
  const RegisterStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.spacing.s24),
      child: Column(
        crossAxisAlignment: .start,
        spacing: context.spacing.s24,
        children: [
          // Header
          Text(
            context.l10n.basicInfo,
            style: context.typography.bold20.primary(context),
          ),
          Text(
            context.l10n.basicInfoSubtitle,
            style: context.typography.book14.secondary(context),
          ),
          SizedBox(height: context.spacing.s8),
          // Form fields
          const _NameField(),
          const _EmailField(),
          const _PasswordField(),
          SizedBox(height: context.spacing.s16),
          // Next button
          const _NextButton(),
        ],
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    return MainTextField(
      labelText: context.l10n.fullName,
      hintText: context.l10n.fullNameHint,
      prefixIcon: LucideIcons.user,
      textInputAction: TextInputAction.next,
      onChanged: context.read<RegisterCubit>().nameChanged,
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
      onChanged: context.read<RegisterCubit>().emailChanged,
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
      onChanged: context.read<RegisterCubit>().passwordChanged,
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, curr) => prev.isStep1Valid != curr.isStep1Valid,
      builder: (context, state) {
        return MainButton(
          text: context.l10n.next,
          isDisabled: !state.isStep1Valid,
          onPressed: () => context.read<RegisterCubit>().nextPage(),
        );
      },
    );
  }
}
