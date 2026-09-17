import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/account/presentation/cubit/cubit.dart';
import 'package:coflow_users_v2/features/authentication/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:solar_icons/solar_icons.dart';

import 'user_data_provider.dart';

/// The root screen for authenticated users.
///
/// Owns the tab bar and two pieces of shared state:
/// - the user cached at login, exposed via [InheritedProvider] for instant paint
/// - [ProfileCubit], created here so the profile is fetched once on login and
///   on every cold start, and so the nav bar avatar and the Account screen read
///   the same instance
@RoutePage()
class NavigationRootScreen extends StatelessWidget {
  const NavigationRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authStateManager = getIt<AuthStateManager>();
    final user = UserDataProvider.fromAuthStateManager(authStateManager);

    return InheritedProvider<UserEntity>(
      // It is guaranteed that user is not null here since this screen
      // is only accessible to authenticated users.
      create: (_) => user!,
      child: BlocProvider(
        create: (_) => getIt<ProfileCubit>(),
        child: AutoTabsRouter(
          // Same order as the nav bar's slots, so a tab index needs no
          // translating on its way to `CoflowBottomNavBar`.
          routes: const [
            DiscoverRoute(),
            DiscountsRoute(),
            HomeRouter(),
            AccountRouter(),
            UserProfileRoute(),
          ],
          // Back out to Home rather than to the leftmost tab.
          homeIndex: CoflowBottomNavBar.centreSlot,
          transitionBuilder: (context, child, animation) =>
              FadeTransition(opacity: animation, child: child),
          builder: (context, child) => _NavigationScaffold(child: child),
        ),
      ),
    );
  }
}

class _NavigationScaffold extends StatelessWidget {
  const _NavigationScaffold({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    final l10n = context.l10n;

    // The freshly fetched avatar, falling back to the one cached at login so
    // the bar is never blank while the profile request is still in flight.
    final avatar =
        context.select<ProfileCubit, String?>((cubit) => cubit.user?.image) ?? context.user.image;

    return Scaffold(
      backgroundColor: context.colors.backgroundTwo,
      // The bar's bump overlaps the content behind it, so the body runs full
      // height and screens pad themselves out using MediaQuery.
      extendBody: true,
      body: child,
      bottomNavigationBar: CoflowBottomNavBar(
        currentIndex: tabsRouter.activeIndex,
        onDestinationSelected: (index) => _onDestinationSelected(context, tabsRouter, index),
        destinations: [
          CoflowNavIconDestination(
            label: l10n.nav_discover,
            icon: SolarIconsOutline.compass,
          ),
          CoflowNavIconDestination(
            label: l10n.nav_discounts,
            icon: SolarIconsOutline.sale,
          ),
          CoflowNavLogoDestination(label: l10n.nav_home),
          CoflowNavIconDestination(
            label: l10n.nav_account,
            icon: SolarIconsOutline.userCircle,
          ),
          CoflowNavAvatarDestination(
            label: l10n.nav_profile,
            imageUrl: avatar,
            fallback: SolarIconsOutline.user,
          ),
        ],
      ),
    );
  }

  void _onDestinationSelected(BuildContext context, TabsRouter tabsRouter, int index) {
    if (tabsRouter.stack[index].name == AccountRouter.name) {
      context.read<ProfileCubit>().refreshStatistics();
    }
    // Tapping the tab you are already on unwinds it back to its root, which is
    // what the platform convention leads people to expect.
    if (tabsRouter.activeIndex == index) {
      tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
      return;
    }
    tabsRouter.setActiveIndex(index);
  }
}
