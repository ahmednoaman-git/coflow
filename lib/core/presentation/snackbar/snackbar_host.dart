import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Hosts the app-wide snackbar queue above the whole navigator stack.
///
/// Mounted once in `MaterialApp.builder`, so snackbars paint over every route
/// — bottom sheets, dialogs and the floating nav bar included — and any
/// context below the app can raise one with `context.showSuccessSnackBar(...)`
/// and friends. Snackbars drop in from the top, clear of the status bar.
class SnackbarHost extends StatelessWidget {
  const SnackbarHost({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SnackbarCubit(),
      child: Stack(
        fit: .expand,
        children: [
          child,
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  context.spacing.s16,
                  context.spacing.s8,
                  context.spacing.s16,
                  0,
                ),
                child: const SnackbarOverlay(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Raises snackbars on the app-wide queue (see [SnackbarHost]).
extension SnackbarContextExtension on BuildContext {
  void showSuccessSnackBar(String message) =>
      read<SnackbarCubit>().show(message, SnackbarType.success);

  void showErrorSnackBar(String message) => read<SnackbarCubit>().show(message, SnackbarType.error);

  void showInfoSnackBar(String message) => read<SnackbarCubit>().show(message, SnackbarType.info);

  void showWarningSnackBar(String message) =>
      read<SnackbarCubit>().show(message, SnackbarType.warning);
}
