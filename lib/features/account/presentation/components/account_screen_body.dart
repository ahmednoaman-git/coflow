import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import '../cubit/cubit.dart';
import 'account_management_list.dart';
import 'account_stats_grid.dart';
import 'logout_confirm_dialog.dart';

/// Body of the Account screen: the four counters, then the management group.
///
/// Reads the [ProfileCubit] provided above the tab bar rather than creating its
/// own. Account counters refresh when the user selects this tab.
class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<ProfileCubit>().refresh(),
      color: context.colors.signatureBlue,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          context.spacing.s24,
          context.spacing.s24,
          context.spacing.s24,
          context.bottomInset + context.spacing.s24,
        ),
        child: Column(
          crossAxisAlignment: .start,
          spacing: context.spacing.s24,
          children: [
            AsyncHandler<ProfileCubit, ProfileState, ProfileStatsEntity>(
              requestManagerGetter: (cubit) => cubit.statisticsManager,
              initialBuilder: (_) => const AccountStatsGridShimmer(),
              loadingBuilder: (_) => const AccountStatsGridShimmer(),
              successBuilder: (context, stats) => AccountStatsGrid(stats: stats),
              onRetry: (cubit) => cubit.refreshStatistics(),
            ),
            Text(
              context.l10n.account_management,
              style: context.typography.bold20.primary(context),
            ),
            const _ManagementSection(),
          ],
        ),
      ),
    );
  }
}

class _ManagementSection extends StatelessWidget {
  const _ManagementSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AsyncHandler<ProfileCubit, ProfileState, void>.loadingDependent(
      requestManagerGetter: (cubit) => cubit.logoutManager,
      onSuccess: (context, _) => context.router.replaceAll([const LoginRoute()]),
      onError: (context, failure) => context.showErrorSnackBar(failure.message),
      builder: (context, isLoggingOut) => AccountManagementList(
        actions: [
          AccountManagementAction(
            icon: SolarIconsOutline.userCircle,
            label: l10n.account_information,
            // TODO: Navigate to account information
            onTap: null,
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.tuning,
            label: l10n.account_activityPreferences,
            // TODO: Navigate to activity preferences
            onTap: null,
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.userSpeak,
            label: l10n.account_supportRequests,
            // TODO: Navigate to support requests
            onTap: null,
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.questionCircle,
            label: l10n.account_faqs,
            // TODO: Navigate to FAQs
            onTap: null,
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.infoCircle,
            label: l10n.account_termsAndConditions,
            // TODO: Navigate to terms & conditions
            onTap: null,
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.documentText,
            label: l10n.account_privacyPolicy,
            // TODO: Navigate to privacy policy
            onTap: null,
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.power,
            label: l10n.account_logout,
            onTap: isLoggingOut ? null : () => _confirmLogout(context),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmLogout(BuildContext context) async {
    final cubit = context.read<ProfileCubit>();
    final confirmed = await LogoutConfirmDialog.show(context);

    if (confirmed ?? false) await cubit.logout();
  }
}
