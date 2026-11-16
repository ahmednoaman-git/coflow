import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/app_info/presentation/legal_document_screen.dart';
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
/// own. Account counters refresh when the user selects this tab — in the
/// background once loaded, so the skeleton only shows on the first load.
class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LogoRefreshIndicator(
      onRefresh: () => context.read<ProfileCubit>().refresh(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(context.spacing.s24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                spacing: context.spacing.s24,
                children: [
                  AsyncHandler<ProfileCubit, ProfileState, ProfileStatsEntity>(
                    requestManagerGetter: (cubit) => cubit.statisticsManager,
                    skeletonBuilder: (_) => const AccountStatsGridSkeleton(),
                    successBuilder: (context, stats) => AccountStatsGrid(stats: stats),
                    onRetry: (cubit) => cubit.refreshStatistics(),
                    // Refreshes run in the background (see ProfileCubit): a
                    // failed one keeps the counters on screen and says why here.
                    onBackgroundError: (context, failure) =>
                        context.showErrorSnackBar(failure.message),
                  ),
                  Text(
                    context.l10n.account_management,
                    style: context.typography.bold20.primary(context),
                  ),
                  const _ManagementSection(),
                ],
              ),
            ),
          ),
          const SliverBottomInset(),
        ],
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
            onTap: () => context.router.push(const AccountInformationRoute()),
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.tuning,
            label: l10n.account_activityPreferences,
            onTap: () => context.router.push(const ActivityPreferencesRoute()),
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.userSpeak,
            label: l10n.account_supportRequests,
            onTap: () => context.router.push(const SupportRequestsRoute()),
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.questionCircle,
            label: l10n.account_faqs,
            onTap: () => context.router.push(const AppFaqRoute()),
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.infoCircle,
            label: l10n.account_termsAndConditions,
            onTap: () => context.router.push(LegalDocumentRoute(document: LegalDocument.terms)),
          ),
          AccountManagementAction(
            icon: SolarIconsOutline.documentText,
            label: l10n.account_privacyPolicy,
            onTap: () =>
                context.router.push(LegalDocumentRoute(document: LegalDocument.privacyPolicy)),
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
