import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/entities.dart';
import 'support_status_chip.dart';

/// One request in the list: its number, the issue (two lines), the date and
/// the status pill. Tapping opens the details sheet.
class SupportRequestCard extends StatelessWidget {
  const SupportRequestCard({super.key, required this.request, required this.onTap});

  final SupportRequestEntity request;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final createdAt = request.createdAt;

    return TappableScale(
      borderRadius: BorderRadius.circular(context.spacing.s16),
      onTap: onTap,
      child: SupportRequestCardSurface(
        child: Column(
          crossAxisAlignment: .start,
          spacing: context.spacing.s8,
          children: [
            Text(
              context.l10n.support_requestTitle(request.id),
              style: context.typography.medium16.primary(context),
            ),
            Text(
              request.issue,
              maxLines: 2,
              overflow: .ellipsis,
              style: context.typography.book14.secondary(context).copyWith(height: 1.5),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    createdAt == null
                        ? ''
                        : DateFormat(
                            'yyyy-MM-dd',
                            context.locale.toLanguageTag(),
                          ).format(createdAt),
                    style: context.typography.book13.disabled(context),
                  ),
                ),
                SupportStatusChip(request: request),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// The white card the list's entries (and their skeletons) sit on.
class SupportRequestCardSurface extends StatelessWidget {
  const SupportRequestCardSurface({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.spacing.s16),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: child,
    );
  }
}

/// [count] card placeholders, spaced like the list.
class SupportRequestCardSkeletons extends StatelessWidget {
  const SupportRequestCardSkeletons({super.key, this.count = 4});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Column(
        spacing: context.spacing.s16,
        children: [
          for (var index = 0; index < count; index++)
            SupportRequestCardSurface(
              child: Column(
                crossAxisAlignment: .start,
                spacing: context.spacing.s8,
                children: [
                  SkeletonText(style: context.typography.medium16, widthFactor: 0.4),
                  SkeletonText(
                    style: context.typography.book14.copyWith(height: 1.5),
                    lines: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SkeletonText(style: context.typography.book13, width: 80),
                      ),
                      SkeletonChip(
                        style: context.typography.medium12,
                        labelWidth: 48,
                        padding: SupportStatusChip.padding(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
