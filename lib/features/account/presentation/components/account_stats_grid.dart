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

/// Placeholder shown while the statistics request is in flight, laid out to the
/// same rhythm as the real grid so nothing jumps when it lands.
class AccountStatsGridShimmer extends StatelessWidget {
  const AccountStatsGridShimmer({super.key});

  static const double _cardHeight = 128;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Column(
        spacing: context.spacing.s16,
        children: [
          for (var row = 0; row < 2; row++)
            Row(
              spacing: context.spacing.s16,
              children: [
                for (var column = 0; column < 2; column++)
                  Expanded(
                    child: Stack(
                      children: [
                        ShimmerBox(
                          height: _cardHeight,
                          borderRadius: context.spacing.s16,
                        ),
                        Positioned(
                          left: context.spacing.s16,
                          top: context.spacing.s16,
                          child: ShimmerBox.dark(width: 64, height: 64, borderRadius: 32),
                        ),
                        Positioned(
                          left: context.spacing.s16,
                          bottom: context.spacing.s16,
                          child: ShimmerBox.dark(width: 96, height: 18, borderRadius: 4),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
