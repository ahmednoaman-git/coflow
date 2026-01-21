import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/routing/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Splash/Auth check route
    AutoRoute(page: SplashRoute.page, initial: true),
    // Authentication routes
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),

    // Main application routes
    AutoRoute(
      page: NavigationRootRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ActivityLineFacilitiesRoute.page),
      ],
    ),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
}
