import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/state.dart';
import 'components/register_screen_body.dart';

/// Multi-step registration screen.
@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.createAccount),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const _BackButton(),
          actions: const [_StepIndicator()],
        ),
        body: const SafeArea(child: RegisterScreenBody()),
      ),
    );
  }
}

/// Back button that navigates between steps or pops the screen.
class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, curr) => prev.pageIndex != curr.pageIndex,
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if (state.pageIndex > 0) {
              context.read<RegisterCubit>().previousPage();
            } else {
              context.router.maybePop();
            }
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: context.colors.textPrimary,
          ),
        );
      },
    );
  }
}

/// Step indicator showing current progress.
class _StepIndicator extends StatelessWidget {
  const _StepIndicator();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, curr) => prev.pageIndex != curr.pageIndex,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(right: context.spacing.s16),
          child: Row(
            mainAxisSize: .min,
            spacing: context.spacing.s8,
            children: List.generate(
              RegisterState.totalSteps,
              (index) => _StepDot(
                isActive: index == state.pageIndex,
                isCompleted: index < state.pageIndex,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StepDot extends StatelessWidget {
  const _StepDot({required this.isActive, required this.isCompleted});

  final bool isActive;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: ShapeDecoration(
        color: isActive || isCompleted
            ? context.colors.signatureBlue
            : context.colors.strokeSecondary,
        shape: const StadiumBorder(),
      ),
    );
  }
}
