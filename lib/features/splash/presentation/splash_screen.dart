import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/core/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state/state.dart';

/// Splash screen that checks authentication status on app startup.
///
/// This is the app's initial route. It checks if the user has a saved
/// authentication token and navigates to either:
/// - [NavigationRootRoute] if authenticated
/// - [LoginRoute] if not authenticated
@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashCubit>(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          switch (state) {
            case SplashInitial():
              // Still checking, do nothing
              break;
            case SplashAuthenticated():
              context.router.replaceAll([const NavigationRootRoute()]);
            case SplashUnauthenticated():
              context.router.replaceAll([const LoginRoute()]);
          }
        },
        child: Scaffold(
          backgroundColor: context.colors.signatureBlue,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: context.spacing.s16,
              children: [
                Logo(size: 45),
                // Loading indicator
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.colors.textWhite,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
