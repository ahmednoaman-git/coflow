import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// One read-only line of [AccountInfoCard]: an icon, a caption and the value.
class AccountInfoRow {
  const AccountInfoRow({required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;

  /// Null or empty shows a muted "Not set".
  final String? value;
}

/// The card of account details on Account Information. Same surface as
/// `AccountManagementList`, so the two groups read as one family.
class AccountInfoCard extends StatelessWidget {
  const AccountInfoCard({super.key, required this.rows});

  final List<AccountInfoRow> rows;

  @override
  Widget build(BuildContext context) {
    return _CardSurface(
      child: Column(
        children: [
          for (final (index, row) in rows.indexed) ...[
            if (index > 0) const _RowDivider(),
            _InfoRow(row: row),
          ],
        ],
      ),
    );
  }
}

/// Placeholder for [AccountInfoCard] while the profile loads.
class AccountInfoCardSkeleton extends StatelessWidget {
  const AccountInfoCardSkeleton({super.key, required this.rowCount});

  final int rowCount;

  @override
  Widget build(BuildContext context) {
    return _CardSurface(
      child: Column(
        children: [
          for (var i = 0; i < rowCount; i++) ...[
            if (i > 0) const _RowDivider(),
            Padding(
              padding: EdgeInsets.all(context.spacing.s16),
              child: Row(
                spacing: context.spacing.s12,
                children: [
                  SkeletonBox(
                    width: _IconTile.size,
                    height: _IconTile.size,
                    radius: context.spacing.s12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: 2,
                      children: [
                        SkeletonText(style: context.typography.book12, widthFactor: 0.3),
                        SkeletonText(style: context.typography.medium14, widthFactor: 0.6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CardSurface extends StatelessWidget {
  const _CardSurface({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.xs,
      ),
      child: child,
    );
  }
}

class _RowDivider extends StatelessWidget {
  const _RowDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: context.spacing.s16,
      endIndent: context.spacing.s16,
      color: context.colors.strokePrimary,
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.row});

  final AccountInfoRow row;

  @override
  Widget build(BuildContext context) {
    final value = row.value?.trim() ?? '';
    final hasValue = value.isNotEmpty;

    return Padding(
      padding: EdgeInsets.all(context.spacing.s16),
      child: Row(
        spacing: context.spacing.s12,
        children: [
          _IconTile(icon: row.icon),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 2,
              children: [
                Text(row.label, style: context.typography.book12.tertiary(context)),
                Text(
                  hasValue ? value : context.l10n.accountInfo_notSet,
                  style: hasValue
                      ? context.typography.medium14.primary(context)
                      : context.typography.medium14.disabled(context),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconTile extends StatelessWidget {
  const _IconTile({required this.icon});

  final IconData icon;

  static const double size = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        color: context.colors.backgroundGrey,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s12),
        ),
      ),
      child: Icon(icon, size: 20, color: context.colors.textSecondary),
    );
  }
}
