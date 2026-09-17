// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:coflow_users_v2/core/core.dart' as _i22;
import 'package:coflow_users_v2/core/routing/app_router.dart' as _i1;
import 'package:coflow_users_v2/features/account/presentation/account_screen.dart'
    as _i2;
import 'package:coflow_users_v2/features/account/presentation/user_profile_screen.dart'
    as _i19;
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart'
    as _i23;
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart'
    as _i26;
import 'package:coflow_users_v2/features/activity_line/presentation/activity_line_facilities_screen.dart'
    as _i3;
import 'package:coflow_users_v2/features/authentication/presentation/screens/login/login_screen.dart'
    as _i11;
import 'package:coflow_users_v2/features/authentication/presentation/screens/register/register_screen.dart'
    as _i14;
import 'package:coflow_users_v2/features/calendar/presentation/calendar_screen.dart'
    as _i4;
import 'package:coflow_users_v2/features/discounts/presentation/discounts_screen.dart'
    as _i5;
import 'package:coflow_users_v2/features/discover/presentation/discover_screen.dart'
    as _i6;
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart'
    as _i24;
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart'
    as _i25;
import 'package:coflow_users_v2/features/facility/presentation/facility_details_screen.dart'
    as _i7;
import 'package:coflow_users_v2/features/facility/presentation/facility_faq_screen.dart'
    as _i8;
import 'package:coflow_users_v2/features/facility/presentation/facility_service_details_screen.dart'
    as _i9;
import 'package:coflow_users_v2/features/home/presentation/home_screen.dart'
    as _i10;
import 'package:coflow_users_v2/features/navigation_root/presentation/navigation_root_screen.dart'
    as _i12;
import 'package:coflow_users_v2/features/purchase/presentation/promotion_purchase_screen.dart'
    as _i13;
import 'package:coflow_users_v2/features/purchase/presentation/ticket_purchase_screen.dart'
    as _i18;
import 'package:coflow_users_v2/features/saved_profiles/presentation/saved_profiles_screen.dart'
    as _i15;
import 'package:coflow_users_v2/features/search/presentation/search_screen.dart'
    as _i16;
import 'package:coflow_users_v2/features/splash/presentation/splash_screen.dart'
    as _i17;
import 'package:flutter/material.dart' as _i21;

/// generated route for
/// [_i1.AccountRouterPage]
class AccountRouter extends _i20.PageRouteInfo<void> {
  const AccountRouter({List<_i20.PageRouteInfo>? children})
    : super(AccountRouter.name, initialChildren: children);

  static const String name = 'AccountRouter';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountRouterPage();
    },
  );
}

/// generated route for
/// [_i2.AccountScreen]
class AccountRoute extends _i20.PageRouteInfo<void> {
  const AccountRoute({List<_i20.PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i2.AccountScreen();
    },
  );
}

/// generated route for
/// [_i3.ActivityLineFacilitiesScreen]
class ActivityLineFacilitiesRoute
    extends _i20.PageRouteInfo<ActivityLineFacilitiesRouteArgs> {
  ActivityLineFacilitiesRoute({
    _i21.Key? key,
    required _i22.ActivityLineEntity activityLine,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         ActivityLineFacilitiesRoute.name,
         args: ActivityLineFacilitiesRouteArgs(
           key: key,
           activityLine: activityLine,
         ),
         initialChildren: children,
       );

  static const String name = 'ActivityLineFacilitiesRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityLineFacilitiesRouteArgs>();
      return _i3.ActivityLineFacilitiesScreen(
        key: args.key,
        activityLine: args.activityLine,
      );
    },
  );
}

class ActivityLineFacilitiesRouteArgs {
  const ActivityLineFacilitiesRouteArgs({this.key, required this.activityLine});

  final _i21.Key? key;

  final _i22.ActivityLineEntity activityLine;

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
/// [_i4.CalendarScreen]
class CalendarRoute extends _i20.PageRouteInfo<void> {
  const CalendarRoute({List<_i20.PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i4.CalendarScreen();
    },
  );
}

/// generated route for
/// [_i5.DiscountsScreen]
class DiscountsRoute extends _i20.PageRouteInfo<void> {
  const DiscountsRoute({List<_i20.PageRouteInfo>? children})
    : super(DiscountsRoute.name, initialChildren: children);

  static const String name = 'DiscountsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i5.DiscountsScreen();
    },
  );
}

/// generated route for
/// [_i6.DiscoverScreen]
class DiscoverRoute extends _i20.PageRouteInfo<void> {
  const DiscoverRoute({List<_i20.PageRouteInfo>? children})
    : super(DiscoverRoute.name, initialChildren: children);

  static const String name = 'DiscoverRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i6.DiscoverScreen();
    },
  );
}

/// generated route for
/// [_i7.FacilityDetailsScreen]
class FacilityDetailsRoute
    extends _i20.PageRouteInfo<FacilityDetailsRouteArgs> {
  FacilityDetailsRoute({
    _i21.Key? key,
    required _i23.CollapsedFacilityEntity facility,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         FacilityDetailsRoute.name,
         args: FacilityDetailsRouteArgs(key: key, facility: facility),
         initialChildren: children,
       );

  static const String name = 'FacilityDetailsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FacilityDetailsRouteArgs>();
      return _i7.FacilityDetailsScreen(key: args.key, facility: args.facility);
    },
  );
}

class FacilityDetailsRouteArgs {
  const FacilityDetailsRouteArgs({this.key, required this.facility});

  final _i21.Key? key;

  final _i23.CollapsedFacilityEntity facility;

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
/// [_i8.FacilityFaqScreen]
class FacilityFaqRoute extends _i20.PageRouteInfo<FacilityFaqRouteArgs> {
  FacilityFaqRoute({
    _i21.Key? key,
    required _i23.CollapsedFacilityEntity facility,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         FacilityFaqRoute.name,
         args: FacilityFaqRouteArgs(key: key, facility: facility),
         initialChildren: children,
       );

  static const String name = 'FacilityFaqRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FacilityFaqRouteArgs>();
      return _i8.FacilityFaqScreen(key: args.key, facility: args.facility);
    },
  );
}

class FacilityFaqRouteArgs {
  const FacilityFaqRouteArgs({this.key, required this.facility});

  final _i21.Key? key;

  final _i23.CollapsedFacilityEntity facility;

  @override
  String toString() {
    return 'FacilityFaqRouteArgs{key: $key, facility: $facility}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FacilityFaqRouteArgs) return false;
    return key == other.key && facility == other.facility;
  }

  @override
  int get hashCode => key.hashCode ^ facility.hashCode;
}

/// generated route for
/// [_i9.FacilityServiceDetailsScreen]
class FacilityServiceDetailsRoute
    extends _i20.PageRouteInfo<FacilityServiceDetailsRouteArgs> {
  FacilityServiceDetailsRoute({
    _i21.Key? key,
    required _i24.CollapsedFacilityServiceEntity service,
    required _i25.FacilityServiceType type,
    required _i23.CollapsedFacilityEntity facility,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         FacilityServiceDetailsRoute.name,
         args: FacilityServiceDetailsRouteArgs(
           key: key,
           service: service,
           type: type,
           facility: facility,
         ),
         initialChildren: children,
       );

  static const String name = 'FacilityServiceDetailsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FacilityServiceDetailsRouteArgs>();
      return _i9.FacilityServiceDetailsScreen(
        key: args.key,
        service: args.service,
        type: args.type,
        facility: args.facility,
      );
    },
  );
}

class FacilityServiceDetailsRouteArgs {
  const FacilityServiceDetailsRouteArgs({
    this.key,
    required this.service,
    required this.type,
    required this.facility,
  });

  final _i21.Key? key;

  final _i24.CollapsedFacilityServiceEntity service;

  final _i25.FacilityServiceType type;

  final _i23.CollapsedFacilityEntity facility;

  @override
  String toString() {
    return 'FacilityServiceDetailsRouteArgs{key: $key, service: $service, type: $type, facility: $facility}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FacilityServiceDetailsRouteArgs) return false;
    return key == other.key &&
        service == other.service &&
        type == other.type &&
        facility == other.facility;
  }

  @override
  int get hashCode =>
      key.hashCode ^ service.hashCode ^ type.hashCode ^ facility.hashCode;
}

/// generated route for
/// [_i1.HomeRouterPage]
class HomeRouter extends _i20.PageRouteInfo<void> {
  const HomeRouter({List<_i20.PageRouteInfo>? children})
    : super(HomeRouter.name, initialChildren: children);

  static const String name = 'HomeRouter';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeRouterPage();
    },
  );
}

/// generated route for
/// [_i10.HomeScreen]
class HomeRoute extends _i20.PageRouteInfo<void> {
  const HomeRoute({List<_i20.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i10.HomeScreen();
    },
  );
}

/// generated route for
/// [_i11.LoginScreen]
class LoginRoute extends _i20.PageRouteInfo<void> {
  const LoginRoute({List<_i20.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i11.LoginScreen();
    },
  );
}

/// generated route for
/// [_i12.NavigationRootScreen]
class NavigationRootRoute extends _i20.PageRouteInfo<void> {
  const NavigationRootRoute({List<_i20.PageRouteInfo>? children})
    : super(NavigationRootRoute.name, initialChildren: children);

  static const String name = 'NavigationRootRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i12.NavigationRootScreen();
    },
  );
}

/// generated route for
/// [_i13.PromotionPurchaseScreen]
class PromotionPurchaseRoute
    extends _i20.PageRouteInfo<PromotionPurchaseRouteArgs> {
  PromotionPurchaseRoute({
    _i21.Key? key,
    required _i24.FacilityPromotionDetailsEntity promotion,
    required _i26.CollapsedFacilityEntity facility,
    required _i21.Color accentColor,
    List<_i20.PageRouteInfo>? children,
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

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PromotionPurchaseRouteArgs>();
      return _i13.PromotionPurchaseScreen(
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

  final _i21.Key? key;

  final _i24.FacilityPromotionDetailsEntity promotion;

  final _i26.CollapsedFacilityEntity facility;

  final _i21.Color accentColor;

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
/// [_i14.RegisterScreen]
class RegisterRoute extends _i20.PageRouteInfo<void> {
  const RegisterRoute({List<_i20.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i14.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i15.SavedProfilesScreen]
class SavedProfilesRoute extends _i20.PageRouteInfo<void> {
  const SavedProfilesRoute({List<_i20.PageRouteInfo>? children})
    : super(SavedProfilesRoute.name, initialChildren: children);

  static const String name = 'SavedProfilesRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i15.SavedProfilesScreen();
    },
  );
}

/// generated route for
/// [_i16.SearchScreen]
class SearchRoute extends _i20.PageRouteInfo<void> {
  const SearchRoute({List<_i20.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i16.SearchScreen();
    },
  );
}

/// generated route for
/// [_i17.SplashScreen]
class SplashRoute extends _i20.PageRouteInfo<void> {
  const SplashRoute({List<_i20.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i17.SplashScreen();
    },
  );
}

/// generated route for
/// [_i18.TicketPurchaseScreen]
class TicketPurchaseRoute extends _i20.PageRouteInfo<TicketPurchaseRouteArgs> {
  TicketPurchaseRoute({
    _i21.Key? key,
    required _i24.FacilityTicketDetailsEntity ticket,
    required _i26.CollapsedFacilityEntity facility,
    required _i21.Color accentColor,
    List<_i20.PageRouteInfo>? children,
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

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketPurchaseRouteArgs>();
      return _i18.TicketPurchaseScreen(
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

  final _i21.Key? key;

  final _i24.FacilityTicketDetailsEntity ticket;

  final _i26.CollapsedFacilityEntity facility;

  final _i21.Color accentColor;

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

/// generated route for
/// [_i19.UserProfileScreen]
class UserProfileRoute extends _i20.PageRouteInfo<void> {
  const UserProfileRoute({List<_i20.PageRouteInfo>? children})
    : super(UserProfileRoute.name, initialChildren: children);

  static const String name = 'UserProfileRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i19.UserProfileScreen();
    },
  );
}
