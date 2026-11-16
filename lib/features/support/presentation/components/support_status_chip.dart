import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

/// The pill showing a request's status: New (blue), Pending (gold), Resolved
/// (green), as in the design.
class SupportStatusChip extends StatelessWidget {
  const SupportStatusChip({super.key, required this.request});

  final SupportRequestEntity request;

  static EdgeInsets padding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: context.spacing.s12, vertical: 6);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final (label, foreground, background) = switch (request.status) {
      SupportRequestStatus.open => (
        l10n.support_statusNew,
        colors.skyBluePrimary,
        colors.skyBlueSecondary,
      ),
      SupportRequestStatus.pending => (
        l10n.support_statusPending,
        colors.earthSunnyGoldPrimary,
        colors.earthSunnyGoldSecondary,
      ),
      SupportRequestStatus.resolved => (
        l10n.support_statusResolved,
        colors.seaCaribbeanPrimary,
        colors.seaCaribbeanSecondary,
      ),
      SupportRequestStatus.other => (
        _capitalized(request.rawStatus),
        colors.textSecondary,
        colors.backgroundGrey,
      ),
    };

    return Container(
      padding: padding(context),
      decoration: ShapeDecoration(
        color: background.withValues(alpha: 0.6),
        shape: const StadiumBorder(),
      ),
      child: Text(label, style: context.typography.medium12.withColor(foreground)),
    );
  }

  static String _capitalized(String value) =>
      value.isEmpty ? value : value[0].toUpperCase() + value.substring(1);
}
