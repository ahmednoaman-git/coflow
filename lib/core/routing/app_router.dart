import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/routing/app_router.gr.dart';

/// Shell for the Home tab's nested stack. It renders nothing of its own —
/// it exists so the tab can hold a stack instead of a single page.
@RoutePage(name: 'HomeRouter')
class HomeRouterPage extends AutoRouter {
  const HomeRouterPage({super.key});
}

/// Shell for the Account tab's nested stack, so drilling into the Calendar
/// keeps the bottom nav bar on screen. Renders nothing of its own.
@RoutePage(name: 'AccountRouter')
class AccountRouterPage extends AutoRouter {
  const AccountRouterPage({super.key});
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
            AutoRoute(page: CalendarRoute.page),
            AutoRoute(page: SavedProfilesRoute.page),
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
