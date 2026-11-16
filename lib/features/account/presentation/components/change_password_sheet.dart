import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../cubit/cubit.dart';

/// Bottom sheet that sets a new password: the new one twice, then save.
///
/// The endpoint takes only the new password (no current one), so there is
/// nothing else to ask for.
class ChangePasswordSheet extends StatefulWidget {
  const ChangePasswordSheet({super.key});

  /// The backend doesn't document a rule; this keeps obvious mistakes local
  /// and leaves anything stricter to the server's message.
  static const int minLength = 6;

  /// Opens the sheet on the root navigator, re-providing [AccountInfoCubit]
  /// from [context] (the sheet is built outside the tab's tree).
  static Future<void> show(BuildContext context) {
    final cubit = context.read<AccountInfoCubit>()..passwordManager.reset();

    return showMainBottomSheet<void>(
      context: context,
      useSafeArea: true,
      builder: (_) => BlocProvider.value(value: cubit, child: const ChangePasswordSheet()),
    );
  }

  @override
  State<ChangePasswordSheet> createState() => _ChangePasswordSheetState();
}

class _ChangePasswordSheetState extends State<ChangePasswordSheet> {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _confirmation = TextEditingController();

  @override
  void dispose() {
    _password.dispose();
    _confirmation.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    context.read<AccountInfoCubit>().changePassword(_password.text);
  }

  String? _validatePassword(String? value) {
    final l10n = context.l10n;
    if (value == null || value.isEmpty) return l10n.accountInfo_fieldRequired;
    if (value.length < ChangePasswordSheet.minLength) {
      return l10n.accountInfo_passwordTooShort(ChangePasswordSheet.minLength);
    }
    return null;
  }

  String? _validateConfirmation(String? value) {
    if (value != _password.text) return context.l10n.accountInfo_passwordsDontMatch;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          context.spacing.s24,
          context.spacing.s12,
          context.spacing.s24,
          context.spacing.s24,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            spacing: context.spacing.s16,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: ShapeDecoration(
                    color: context.colors.strokeSecondary,
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: .start,
                spacing: context.spacing.s4,
                children: [
                  Text(
                    l10n.accountInfo_changePassword,
                    style: context.typography.bold20.primary(context),
                  ),
                  Text(
                    l10n.accountInfo_changePasswordSubtitle,
                    style: context.typography.book14.secondary(context),
                  ),
                ],
              ),
              MainTextField(
                controller: _password,
                labelText: l10n.accountInfo_newPassword,
                hintText: l10n.accountInfo_newPasswordHint,
                prefixIcon: SolarIconsOutline.lockPassword,
                passwordField: true,
                textInputAction: .next,
                validator: _validatePassword,
              ),
              MainTextField(
                controller: _confirmation,
                labelText: l10n.accountInfo_confirmPassword,
                hintText: l10n.accountInfo_confirmPasswordHint,
                prefixIcon: SolarIconsOutline.lockPassword,
                passwordField: true,
                textInputAction: .done,
                onSubmitted: (_) => _submit(),
                validator: _validateConfirmation,
              ),
              SizedBox(height: context.spacing.s8),
              AsyncHandler<AccountInfoCubit, AccountInfoState, void>.loadingDependent(
                requestManagerGetter: (cubit) => cubit.passwordManager,
                onSuccess: (context, _) {
                  context.showSuccessSnackBar(context.l10n.accountInfo_passwordChanged);
                  Navigator.of(context).pop();
                },
                onError: (context, failure) => context.showErrorSnackBar(failure.message),
                builder: (context, isLoading) => MainButton(
                  text: l10n.accountInfo_changePassword,
                  height: 48,
                  isLoading: isLoading,
                  onPressed: isLoading ? null : _submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
