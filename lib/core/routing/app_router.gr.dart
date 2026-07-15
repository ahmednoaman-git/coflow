// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:coflow_users_v2/core/core.dart' as _i12;
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart'
    as _i13;
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart'
    as _i15;
import 'package:coflow_users_v2/features/activity_line/presentation/activity_line_facilities_screen.dart'
    as _i1;
import 'package:coflow_users_v2/features/authentication/presentation/screens/login/login_screen.dart'
    as _i4;
import 'package:coflow_users_v2/features/authentication/presentation/screens/register/register_screen.dart'
    as _i7;
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart'
    as _i14;
import 'package:coflow_users_v2/features/facility/presentation/facility_details_screen.dart'
    as _i2;
import 'package:coflow_users_v2/features/home/presentation/home_screen.dart'
    as _i3;
import 'package:coflow_users_v2/features/navigation_root/presentation/navigation_root_screen.dart'
    as _i5;
import 'package:coflow_users_v2/features/purchase/presentation/promotion_purchase_screen.dart'
    as _i6;
import 'package:coflow_users_v2/features/purchase/presentation/ticket_purchase_screen.dart'
    as _i9;
import 'package:coflow_users_v2/features/splash/presentation/splash_screen.dart'
    as _i8;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.ActivityLineFacilitiesScreen]
class ActivityLineFacilitiesRoute
    extends _i10.PageRouteInfo<ActivityLineFacilitiesRouteArgs> {
  ActivityLineFacilitiesRoute({
    _i11.Key? key,
    required _i12.ActivityLineEntity activityLine,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         ActivityLineFacilitiesRoute.name,
         args: ActivityLineFacilitiesRouteArgs(
           key: key,
           activityLine: activityLine,
         ),
         initialChildren: children,
       );

  static const String name = 'ActivityLineFacilitiesRoute';

  static _i10.PageInfo page = _i10.PageInfo(
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

  final _i11.Key? key;

  final _i12.ActivityLineEntity activityLine;

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
/// [_i2.FacilityDetailsScreen]
class FacilityDetailsRoute
    extends _i10.PageRouteInfo<FacilityDetailsRouteArgs> {
  FacilityDetailsRoute({
    _i11.Key? key,
    required _i13.CollapsedFacilityEntity facility,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         FacilityDetailsRoute.name,
         args: FacilityDetailsRouteArgs(key: key, facility: facility),
         initialChildren: children,
       );

  static const String name = 'FacilityDetailsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FacilityDetailsRouteArgs>();
      return _i2.FacilityDetailsScreen(key: args.key, facility: args.facility);
    },
  );
}

class FacilityDetailsRouteArgs {
  const FacilityDetailsRouteArgs({this.key, required this.facility});

  final _i11.Key? key;

  final _i13.CollapsedFacilityEntity facility;

  @override
  String toString() {
    return 'FacilityDetailsRouteArgs{key: $key, facility: $facility}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FacilityDetailsRouteArgs) return false;
    return key == other.key && facility == other.facility;
  }

  @override
  int get hashCode => key.hashCode ^ facility.hashCode;
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.NavigationRootScreen]
class NavigationRootRoute extends _i10.PageRouteInfo<void> {
  const NavigationRootRoute({List<_i10.PageRouteInfo>? children})
    : super(NavigationRootRoute.name, initialChildren: children);

  static const String name = 'NavigationRootRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.NavigationRootScreen();
    },
  );
}

/// generated route for
/// [_i6.PromotionPurchaseScreen]
class PromotionPurchaseRoute
    extends _i10.PageRouteInfo<PromotionPurchaseRouteArgs> {
  PromotionPurchaseRoute({
    _i11.Key? key,
    required _i14.FacilityPromotionDetailsEntity promotion,
    required _i15.CollapsedFacilityEntity facility,
    required _i11.Color accentColor,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         PromotionPurchaseRoute.name,
         args: PromotionPurchaseRouteArgs(
           key: key,
           promotion: promotion,
           facility: facility,
           accentColor: accentColor,
         ),
         initialChildren: children,
       );

  static const String name = 'PromotionPurchaseRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PromotionPurchaseRouteArgs>();
      return _i6.PromotionPurchaseScreen(
        key: args.key,
        promotion: args.promotion,
        facility: args.facility,
        accentColor: args.accentColor,
      );
    },
  );
}

class PromotionPurchaseRouteArgs {
  const PromotionPurchaseRouteArgs({
    this.key,
    required this.promotion,
    required this.facility,
    required this.accentColor,
  });

  final _i11.Key? key;

  final _i14.FacilityPromotionDetailsEntity promotion;

  final _i15.CollapsedFacilityEntity facility;

  final _i11.Color accentColor;

  @override
  String toString() {
    return 'PromotionPurchaseRouteArgs{key: $key, promotion: $promotion, facility: $facility, accentColor: $accentColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PromotionPurchaseRouteArgs) return false;
    return key == other.key &&
        promotion == other.promotion &&
        facility == other.facility &&
        accentColor == other.accentColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      promotion.hashCode ^
      facility.hashCode ^
      accentColor.hashCode;
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute({List<_i10.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashScreen();
    },
  );
}

/// generated route for
/// [_i9.TicketPurchaseScreen]
class TicketPurchaseRoute extends _i10.PageRouteInfo<TicketPurchaseRouteArgs> {
  TicketPurchaseRoute({
    _i11.Key? key,
    required _i14.FacilityTicketDetailsEntity ticket,
    required _i15.CollapsedFacilityEntity facility,
    required _i11.Color accentColor,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         TicketPurchaseRoute.name,
         args: TicketPurchaseRouteArgs(
           key: key,
           ticket: ticket,
           facility: facility,
           accentColor: accentColor,
         ),
         initialChildren: children,
       );

  static const String name = 'TicketPurchaseRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketPurchaseRouteArgs>();
      return _i9.TicketPurchaseScreen(
        key: args.key,
        ticket: args.ticket,
        facility: args.facility,
        accentColor: args.accentColor,
      );
    },
  );
}

class TicketPurchaseRouteArgs {
  const TicketPurchaseRouteArgs({
    this.key,
    required this.ticket,
    required this.facility,
    required this.accentColor,
  });

  final _i11.Key? key;

  final _i14.FacilityTicketDetailsEntity ticket;

  final _i15.CollapsedFacilityEntity facility;

  final _i11.Color accentColor;

  @override
  String toString() {
    return 'TicketPurchaseRouteArgs{key: $key, ticket: $ticket, facility: $facility, accentColor: $accentColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TicketPurchaseRouteArgs) return false;
    return key == other.key &&
        ticket == other.ticket &&
        facility == other.facility &&
        accentColor == other.accentColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^ ticket.hashCode ^ facility.hashCode ^ accentColor.hashCode;
}
