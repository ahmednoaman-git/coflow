// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:coflow_users_v2/core/core.dart' as _i9;
import 'package:coflow_users_v2/features/activity_line/presentation/activity_line_facilities_screen.dart'
    as _i1;
import 'package:coflow_users_v2/features/authentication/presentation/screens/login/login_screen.dart'
    as _i3;
import 'package:coflow_users_v2/features/authentication/presentation/screens/register/register_screen.dart'
    as _i5;
import 'package:coflow_users_v2/features/home/presentation/home_screen.dart'
    as _i2;
import 'package:coflow_users_v2/features/navigation_root/presentation/navigation_root_screen.dart'
    as _i4;
import 'package:coflow_users_v2/features/splash/presentation/splash_screen.dart'
    as _i6;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.ActivityLineFacilitiesScreen]
class ActivityLineFacilitiesRoute
    extends _i7.PageRouteInfo<ActivityLineFacilitiesRouteArgs> {
  ActivityLineFacilitiesRoute({
    _i8.Key? key,
    required _i9.ActivityLineEntity activityLine,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         ActivityLineFacilitiesRoute.name,
         args: ActivityLineFacilitiesRouteArgs(
           key: key,
           activityLine: activityLine,
         ),
         initialChildren: children,
       );

  static const String name = 'ActivityLineFacilitiesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityLineFacilitiesRouteArgs>();
      return _i1.ActivityLineFacilitiesScreen(
        key: args.key,
        activityLine: args.activityLine,
      );
    },
  );
}

class ActivityLineFacilitiesRouteArgs {
  const ActivityLineFacilitiesRouteArgs({this.key, required this.activityLine});

  final _i8.Key? key;

  final _i9.ActivityLineEntity activityLine;

  @override
  String toString() {
    return 'ActivityLineFacilitiesRouteArgs{key: $key, activityLine: $activityLine}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ActivityLineFacilitiesRouteArgs) return false;
    return key == other.key && activityLine == other.activityLine;
  }

  @override
  int get hashCode => key.hashCode ^ activityLine.hashCode;
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.NavigationRootScreen]
class NavigationRootRoute extends _i7.PageRouteInfo<void> {
  const NavigationRootRoute({List<_i7.PageRouteInfo>? children})
    : super(NavigationRootRoute.name, initialChildren: children);

  static const String name = 'NavigationRootRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.NavigationRootScreen();
    },
  );
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute({List<_i7.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashScreen();
    },
  );
}
