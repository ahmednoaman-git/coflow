import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Centred icon + message used for the screen's two quiet states: a query that
/// is still too short, and a query that matched nothing.
class SearchMessageView extends StatelessWidget {
  const SearchMessageView({
    super.key,
    required this.icon,
    required this.message,
    this.hint,
  });

  final IconData icon;
  final String message;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Column(
          mainAxisSize: .min,
          spacing: context.spacing.s8,
          children: [
            Icon(icon, size: 48, color: context.colors.textDisabled),
            SizedBox(height: context.spacing.s4),
            Text(
              message,
              textAlign: .center,
              style: context.typography.medium16.secondary(context),
            ),
            if (hint case final hint?)
              Text(
                hint,
                textAlign: .center,
                style: context.typography.book14.tertiary(context),
              ),
          ],
        ),
      ),
    );
  }
}
