import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Header section with logo and welcome text.
class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s16,
      children: [
        // Logo
        Assets.svgs.logo.svg(width: 64, height: 64),
        // Welcome text
        Text(
          context.l10n.login,
          style: context.typography.bold24.primary(context),
        ),
        Text(
          context.l10n.loginSubtitle,
          style: context.typography.book14.secondary(context),
        ),
      ],
    );
  }
}
