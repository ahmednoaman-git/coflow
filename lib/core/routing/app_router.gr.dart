// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:coflow_users_v2/features/authentication/presentation/screens/login/login_screen.dart'
    as _i1;
import 'package:coflow_users_v2/features/authentication/presentation/screens/register/register_screen.dart'
    as _i3;
import 'package:coflow_users_v2/features/navigation_root/presentation/navigation_root_screen.dart'
    as _i2;
import 'package:coflow_users_v2/features/splash/presentation/splash_screen.dart'
    as _i4;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.NavigationRootScreen]
class NavigationRootRoute extends _i5.PageRouteInfo<void> {
  const NavigationRootRoute({List<_i5.PageRouteInfo>? children})
    : super(NavigationRootRoute.name, initialChildren: children);

  static const String name = 'NavigationRootRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.NavigationRootScreen();
    },
  );
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute({List<_i5.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
