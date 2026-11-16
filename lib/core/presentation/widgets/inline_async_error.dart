import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A compact failure message with a retry button, for a request that fills
/// one part of a screen — a section, a list, a "load more" footer — where
/// `AsyncHandler`'s full-screen error would be out of place.
class InlineAsyncError extends StatelessWidget {
  const InlineAsyncError({super.key, required this.failure, required this.onRetry});

  final Failure failure;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.all(context.spacing.s24),
    child: Column(
      mainAxisSize: .min,
      spacing: context.spacing.s12,
      children: [
        Text(
          failure.message,
          textAlign: .center,
          style: context.typography.book14.secondary(context),
        ),
        MainButton(text: context.l10n.retry, onPressed: onRetry),
      ],
    ),
  );
}
