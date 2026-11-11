import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../cubit/cubit.dart';
import 'account_stat_card.dart';

/// The 2x2 block of counters at the top of the Account screen.
class AccountStatsGrid extends StatelessWidget {
  const AccountStatsGrid({super.key, required this.stats});

  final ProfileStatsEntity stats;

  @override
  Widget build(BuildContext context) {
    final cards = [
      AccountStatCard(
        icon: Assets.svgs.calendar,
        label: context.l10n.account_calendar,
        count: stats.calendarEntries,
        accent: context.colors.energyCherryPrimary,
        accentContainer: context.colors.energyCherrySecondary,
        onTap: () => _openAndRefresh(context, const CalendarRoute()),
      ),
      AccountStatCard(
        icon: Assets.svgs.bookmark,
        label: context.l10n.businesses,
        count: stats.businesses,
        accent: context.colors.skyBluePrimary,
        accentContainer: context.colors.skyBlueSecondary,
        onTap: () => _openAndRefresh(context, const SavedProfilesRoute()),
      ),
      AccountStatCard(
        icon: Assets.svgs.ticket,
        label: context.l10n.account_purchases,
        count: stats.purchases,
        accent: context.colors.earthSunnyGoldPrimary,
        accentContainer: context.colors.earthSunnyGoldSecondary,
      ),
      AccountStatCard(
        icon: Assets.svgs.discount,
        label: context.l10n.account_gifts,
        count: stats.gifts,
        accent: context.colors.seaCaribbeanPrimary,
        accentContainer: context.colors.seaCaribbeanSecondary,
      ),
    ];

    return Column(
      spacing: context.spacing.s16,
      children: [
        for (var row = 0; row < cards.length; row += 2)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: .stretch,
              spacing: context.spacing.s16,
              children: [
                Expanded(child: cards[row]),
                Expanded(child: cards[row + 1]),
              ],
            ),
          ),
      ],
    );
  }

  Future<void> _openAndRefresh(BuildContext context, PageRouteInfo route) async {
    final cubit = context.read<ProfileCubit>();
    await context.router.push<void>(route);
    if (!cubit.isClosed) await cubit.refreshStatistics();
  }
}

/// Placeholder for [AccountStatsGrid] while the statistics load: the same
/// 2x2 cards — badge, count, label — on the cards' own surface and spacing.
class AccountStatsGridSkeleton extends StatelessWidget {
  const AccountStatsGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Skeleton(
      child: Column(
        spacing: spacing.s16,
        children: [
          for (var row = 0; row < 2; row++)
            Row(
              spacing: spacing.s16,
              children: [
                for (var column = 0; column < 2; column++)
                  const Expanded(child: _StatCardSkeleton()),
              ],
            ),
        ],
      ),
    );
  }
}

class _StatCardSkeleton extends StatelessWidget {
  const _StatCardSkeleton();

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final typography = context.typography;

    return Container(
      padding: EdgeInsets.all(spacing.s16),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(spacing.s16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: spacing.s16,
        children: [
          Row(
            children: [
              SkeletonCircle(size: AccountStatCard.badgeSize(context)),
              const Spacer(),
              SkeletonText(style: typography.book36, width: 28),
            ],
          ),
          SkeletonText(style: typography.bold18, widthFactor: 0.6),
        ],
      ),
    );
  }
}
