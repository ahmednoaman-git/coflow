import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/routing/app_router.gr.dart';
import 'package:flutter/material.dart';

/// Shell for the Home tab's nested stack. It renders nothing of its own —
/// it exists so the tab can hold a stack instead of a single page.
@RoutePage(name: 'HomeRouter')
class HomeRouterPage extends _TabStack {
  const HomeRouterPage({super.key});
}

/// Shell for the Account tab's nested stack, so drilling into the Calendar
/// keeps the bottom nav bar on screen. Renders nothing of its own.
@RoutePage(name: 'AccountRouter')
class AccountRouterPage extends _TabStack {
  const AccountRouterPage({super.key});
}

/// A tab's nested [AutoRouter], with heroes enabled.
///
/// A nested navigator gets no [HeroController] of its own — Flutter shields
/// it from the app's — and `AutoRouter` doesn't add one, so without this a
/// [Hero] between two pages of a tab never flies.
abstract class _TabStack extends StatefulWidget {
  const _TabStack({super.key});

  @override
  State<_TabStack> createState() => _TabStackState();
}

class _TabStackState extends State<_TabStack> {
  final _heroController = HeroController();

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      HeroControllerScope(controller: _heroController, child: const AutoRouter());
}

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Splash/Auth check route
    AutoRoute(page: SplashRoute.page, initial: true),
    // Authentication routes
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),

    // Main application routes — one branch per bottom nav destination.
    AutoRoute(
      page: NavigationRootRoute.page,
      // Listed in the nav bar's visual order, left to right, so a tab's index
      // here is also its slot in `CoflowBottomNavBar`.
      children: [
        AutoRoute(page: DiscoverRoute.page),
        AutoRoute(page: DiscountsRoute.page),
        // The centre CTA, and the tab the shell opens on. Keeps its own stack
        // so drilling into a facility stays inside the tab, with the nav bar
        // still on screen.
        AutoRoute(
          page: HomeRouter.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: SearchRoute.page),
            AutoRoute(page: ActivityLineFacilitiesRoute.page),
            AutoRoute(page: FacilityDetailsRoute.page),
          ],
        ),
        // Account keeps its own stack so the Calendar opens inside the tab,
        // with the nav bar still on screen.
        AutoRoute(
          page: AccountRouter.page,
          children: [
            AutoRoute(page: AccountRoute.page, initial: true),
            AutoRoute(page: AccountInformationRoute.page),
            AutoRoute(page: EditAccountInformationRoute.page),
            AutoRoute(page: CalendarRoute.page),
            AutoRoute(page: SavedProfilesRoute.page),
            AutoRoute(page: UserPurchasesRoute.page),
            AutoRoute(page: AppFaqRoute.page),
            AutoRoute(page: LegalDocumentRoute.page),
            AutoRoute(page: SupportRequestsRoute.page),
            // Registered here as well as under Home: a push only resolves
            // against the current stack and its ancestors, never a sibling
            // tab's, so a saved profile opens its facility inside this tab.
            AutoRoute(page: FacilityDetailsRoute.page),
          ],
        ),
        AutoRoute(page: UserProfileRoute.page),
      ],
    ),

    // Purchase / checkout routes
    AutoRoute(page: TicketPurchaseRoute.page),
    AutoRoute(page: PromotionPurchaseRoute.page),

    // Facility service details
    AutoRoute(page: FacilityServiceDetailsRoute.page),

    // Facility FAQ
    AutoRoute(page: FacilityFaqRoute.page),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
}
