import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/state.dart';

/// Step 3: OTP verification.
class RegisterStep3 extends StatelessWidget {
  const RegisterStep3({super.key});

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
            context.l10n.verifyEmail,
            style: context.typography.bold20.primary(context),
          ),
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, curr) => prev.email != curr.email,
            builder: (context, state) {
              return Text(
                context.l10n.otpSentTo(state.email),
                style: context.typography.book14.secondary(context),
              );
            },
          ),
          SizedBox(height: context.spacing.s8),
          // OTP input
          const _OtpInput(),
          // Resend link
          const _ResendOtpLink(),
          SizedBox(height: context.spacing.s16),
          // Verify & Submit button
          const _SubmitButton(),
        ],
      ),
    );
  }
}

class _OtpInput extends StatelessWidget {
  const _OtpInput();

  @override
  Widget build(BuildContext context) {
    return MainTextField(
      labelText: context.l10n.otpCode,
      hintText: context.l10n.otpCodeHint,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      maxLength: 6,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: context.read<RegisterCubit>().otpCodeChanged,
      onSubmitted: (_) => context.read<RegisterCubit>().submit(),
    );
  }
}

class _ResendOtpLink extends StatelessWidget {
  const _ResendOtpLink();

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<RegisterCubit, RegisterState, void>.loadingDependent(
      requestManagerGetter: (cubit) => cubit.sendOtpManager,
      builder: (context, isLoading) {
        return Center(
          child: GestureDetector(
            onTap: isLoading
                ? null
                : () => context.read<RegisterCubit>().resendOtp(),
            child: Text(
              isLoading ? context.l10n.sending : context.l10n.resendOtp,
              style: isLoading
                  ? context.typography.medium14.tertiary(context)
                  : context.typography.medium14.brand(context),
            ),
          ),
        );
      },
      onSuccess: (context, _) {
        context.showSuccessSnackBar(context.l10n.otpSent);
      },
      onError: (context, failure) {
        context.showErrorSnackBar(failure.message);
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<RegisterCubit, RegisterState, void>.loadingDependent(
      requestManagerGetter: (cubit) => cubit.registerManager,
      builder: (context, isLoading) {
        return BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (prev, curr) => prev.isStep3Valid != curr.isStep3Valid,
          builder: (context, state) {
            return MainButton(
              text: context.l10n.createAccount,
              isLoading: isLoading,
              isDisabled: !state.isStep3Valid,
              onPressed: () => context.read<RegisterCubit>().submit(),
            );
          },
        );
      },
      onSuccess: (context, _) {
        // TODO: Navigate to login or home screen
        context.showSuccessSnackBar(context.l10n.registrationSuccess);
      },
      onError: (context, failure) {
        context.showErrorSnackBar(failure.message);
      },
    );
  }
}
