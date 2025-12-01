import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/routing/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Authentication routes
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: RegisterRoute.page),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
}
