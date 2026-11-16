// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:coflow_users_v2/core/core.dart' as _i5;
import 'package:coflow_users_v2/core/routing/app_router.dart' as _i2;
import 'package:coflow_users_v2/features/account/presentation/account_information_screen.dart'
    as _i1;
import 'package:coflow_users_v2/features/account/presentation/account_screen.dart'
    as _i3;
import 'package:coflow_users_v2/features/account/presentation/edit_account_information_screen.dart'
    as _i9;
import 'package:coflow_users_v2/features/account/presentation/user_profile_screen.dart'
    as _i22;
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart'
    as _i26;
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart'
    as _i29;
import 'package:coflow_users_v2/features/activity_line/presentation/activity_line_facilities_screen.dart'
    as _i4;
import 'package:coflow_users_v2/features/authentication/presentation/screens/login/login_screen.dart'
    as _i14;
import 'package:coflow_users_v2/features/authentication/presentation/screens/register/register_screen.dart'
    as _i17;
import 'package:coflow_users_v2/features/calendar/presentation/calendar_screen.dart'
    as _i6;
import 'package:coflow_users_v2/features/discounts/presentation/discounts_screen.dart'
    as _i7;
import 'package:coflow_users_v2/features/discover/presentation/discover_screen.dart'
    as _i8;
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart'
    as _i27;
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart'
    as _i28;
import 'package:coflow_users_v2/features/facility/presentation/facility_details_screen.dart'
    as _i10;
import 'package:coflow_users_v2/features/facility/presentation/facility_faq_screen.dart'
    as _i11;
import 'package:coflow_users_v2/features/facility/presentation/facility_service_details_screen.dart'
    as _i12;
import 'package:coflow_users_v2/features/home/presentation/home_screen.dart'
    as _i13;
import 'package:coflow_users_v2/features/my_purchases/domain/domain.dart'
    as _i30;
import 'package:coflow_users_v2/features/my_purchases/presentation/user_purchases_screen.dart'
    as _i23;
import 'package:coflow_users_v2/features/navigation_root/presentation/navigation_root_screen.dart'
    as _i15;
import 'package:coflow_users_v2/features/purchase/presentation/promotion_purchase_screen.dart'
    as _i16;
import 'package:coflow_users_v2/features/purchase/presentation/ticket_purchase_screen.dart'
    as _i21;
import 'package:coflow_users_v2/features/saved_profiles/presentation/saved_profiles_screen.dart'
    as _i18;
import 'package:coflow_users_v2/features/search/presentation/search_screen.dart'
    as _i19;
import 'package:coflow_users_v2/features/splash/presentation/splash_screen.dart'
    as _i20;
import 'package:flutter/material.dart' as _i25;

/// generated route for
/// [_i1.AccountInformationScreen]
class AccountInformationRoute extends _i24.PageRouteInfo<void> {
  const AccountInformationRoute({List<_i24.PageRouteInfo>? children})
    : super(AccountInformationRoute.name, initialChildren: children);

  static const String name = 'AccountInformationRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountInformationScreen();
    },
  );
}

/// generated route for
/// [_i2.AccountRouterPage]
class AccountRouter extends _i24.PageRouteInfo<void> {
  const AccountRouter({List<_i24.PageRouteInfo>? children})
    : super(AccountRouter.name, initialChildren: children);

  static const String name = 'AccountRouter';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i2.AccountRouterPage();
    },
  );
}

/// generated route for
/// [_i3.AccountScreen]
class AccountRoute extends _i24.PageRouteInfo<void> {
  const AccountRoute({List<_i24.PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i3.AccountScreen();
    },
  );
}

/// generated route for
/// [_i4.ActivityLineFacilitiesScreen]
class ActivityLineFacilitiesRoute
    extends _i24.PageRouteInfo<ActivityLineFacilitiesRouteArgs> {
  ActivityLineFacilitiesRoute({
    _i25.Key? key,
    required _i5.ActivityLineEntity activityLine,
    _i5.SelectedLocation initialLocation = const _i5.SelectedLocation(),
    _i25.ValueChanged<_i5.SelectedLocation>? onLocationSelected,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         ActivityLineFacilitiesRoute.name,
         args: ActivityLineFacilitiesRouteArgs(
           key: key,
           activityLine: activityLine,
           initialLocation: initialLocation,
           onLocationSelected: onLocationSelected,
         ),
         initialChildren: children,
       );

  static const String name = 'ActivityLineFacilitiesRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityLineFacilitiesRouteArgs>();
      return _i4.ActivityLineFacilitiesScreen(
        key: args.key,
        activityLine: args.activityLine,
        initialLocation: args.initialLocation,
        onLocationSelected: args.onLocationSelected,
      );
    },
  );
}

class ActivityLineFacilitiesRouteArgs {
  const ActivityLineFacilitiesRouteArgs({
    this.key,
    required this.activityLine,
    this.initialLocation = const _i5.SelectedLocation(),
    this.onLocationSelected,
  });

  final _i25.Key? key;

  final _i5.ActivityLineEntity activityLine;

  final _i5.SelectedLocation initialLocation;

  final _i25.ValueChanged<_i5.SelectedLocation>? onLocationSelected;

  @override
  String toString() {
    return 'ActivityLineFacilitiesRouteArgs{key: $key, activityLine: $activityLine, initialLocation: $initialLocation, onLocationSelected: $onLocationSelected}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ActivityLineFacilitiesRouteArgs) return false;
    return key == other.key &&
        activityLine == other.activityLine &&
        initialLocation == other.initialLocation &&
        onLocationSelected == other.onLocationSelected;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      activityLine.hashCode ^
      initialLocation.hashCode ^
      onLocationSelected.hashCode;
}

/// generated route for
/// [_i6.CalendarScreen]
class CalendarRoute extends _i24.PageRouteInfo<void> {
  const CalendarRoute({List<_i24.PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i6.CalendarScreen();
    },
  );
}

/// generated route for
/// [_i7.DiscountsScreen]
class DiscountsRoute extends _i24.PageRouteInfo<void> {
  const DiscountsRoute({List<_i24.PageRouteInfo>? children})
    : super(DiscountsRoute.name, initialChildren: children);

  static const String name = 'DiscountsRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i7.DiscountsScreen();
    },
  );
}

/// generated route for
/// [_i8.DiscoverScreen]
class DiscoverRoute extends _i24.PageRouteInfo<void> {
  const DiscoverRoute({List<_i24.PageRouteInfo>? children})
    : super(DiscoverRoute.name, initialChildren: children);

  static const String name = 'DiscoverRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i8.DiscoverScreen();
    },
  );
}

/// generated route for
/// [_i9.EditAccountInformationScreen]
class EditAccountInformationRoute extends _i24.PageRouteInfo<void> {
  const EditAccountInformationRoute({List<_i24.PageRouteInfo>? children})
    : super(EditAccountInformationRoute.name, initialChildren: children);

  static const String name = 'EditAccountInformationRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i9.EditAccountInformationScreen();
    },
  );
}

/// generated route for
/// [_i10.FacilityDetailsScreen]
class FacilityDetailsRoute
    extends _i24.PageRouteInfo<FacilityDetailsRouteArgs> {
  FacilityDetailsRoute({
    _i25.Key? key,
    required _i26.CollapsedFacilityEntity facility,
    bool isPreview = false,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         FacilityDetailsRoute.name,
         args: FacilityDetailsRouteArgs(
           key: key,
           facility: facility,
           isPreview: isPreview,
         ),
         initialChildren: children,
       );

  static const String name = 'FacilityDetailsRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FacilityDetailsRouteArgs>();
      return _i10.FacilityDetailsScreen(
        key: args.key,
        facility: args.facility,
        isPreview: args.isPreview,
      );
    },
  );
}

class FacilityDetailsRouteArgs {
  const FacilityDetailsRouteArgs({
    this.key,
    required this.facility,
    this.isPreview = false,
  });

  final _i25.Key? key;

  final _i26.CollapsedFacilityEntity facility;

  final bool isPreview;

  @override
  String toString() {
    return 'FacilityDetailsRouteArgs{key: $key, facility: $facility, isPreview: $isPreview}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FacilityDetailsRouteArgs) return false;
    return key == other.key &&
        facility == other.facility &&
        isPreview == other.isPreview;
  }

  @override
  int get hashCode => key.hashCode ^ facility.hashCode ^ isPreview.hashCode;
}

/// generated route for
/// [_i11.FacilityFaqScreen]
class FacilityFaqRoute extends _i24.PageRouteInfo<FacilityFaqRouteArgs> {
  FacilityFaqRoute({
    _i25.Key? key,
    required _i26.CollapsedFacilityEntity facility,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         FacilityFaqRoute.name,
         args: FacilityFaqRouteArgs(key: key, facility: facility),
         initialChildren: children,
       );

  static const String name = 'FacilityFaqRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FacilityFaqRouteArgs>();
      return _i11.FacilityFaqScreen(key: args.key, facility: args.facility);
    },
  );
}

class FacilityFaqRouteArgs {
  const FacilityFaqRouteArgs({this.key, required this.facility});

  final _i25.Key? key;

  final _i26.CollapsedFacilityEntity facility;

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
/// [_i12.FacilityServiceDetailsScreen]
class FacilityServiceDetailsRoute
    extends _i24.PageRouteInfo<FacilityServiceDetailsRouteArgs> {
  FacilityServiceDetailsRoute({
    _i25.Key? key,
    required _i27.CollapsedFacilityServiceEntity service,
    required _i28.FacilityServiceType type,
    required _i26.CollapsedFacilityEntity facility,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FacilityServiceDetailsRouteArgs>();
      return _i12.FacilityServiceDetailsScreen(
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

  final _i25.Key? key;

  final _i27.CollapsedFacilityServiceEntity service;

  final _i28.FacilityServiceType type;

  final _i26.CollapsedFacilityEntity facility;

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
/// [_i2.HomeRouterPage]
class HomeRouter extends _i24.PageRouteInfo<void> {
  const HomeRouter({List<_i24.PageRouteInfo>? children})
    : super(HomeRouter.name, initialChildren: children);

  static const String name = 'HomeRouter';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeRouterPage();
    },
  );
}

/// generated route for
/// [_i13.HomeScreen]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i13.HomeScreen();
    },
  );
}

/// generated route for
/// [_i14.LoginScreen]
class LoginRoute extends _i24.PageRouteInfo<void> {
  const LoginRoute({List<_i24.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i14.LoginScreen();
    },
  );
}

/// generated route for
/// [_i15.NavigationRootScreen]
class NavigationRootRoute extends _i24.PageRouteInfo<void> {
  const NavigationRootRoute({List<_i24.PageRouteInfo>? children})
    : super(NavigationRootRoute.name, initialChildren: children);

  static const String name = 'NavigationRootRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i15.NavigationRootScreen();
    },
  );
}

/// generated route for
/// [_i16.PromotionPurchaseScreen]
class PromotionPurchaseRoute
    extends _i24.PageRouteInfo<PromotionPurchaseRouteArgs> {
  PromotionPurchaseRoute({
    _i25.Key? key,
    required _i27.FacilityPromotionDetailsEntity promotion,
    required _i29.CollapsedFacilityEntity facility,
    required _i25.Color accentColor,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PromotionPurchaseRouteArgs>();
      return _i16.PromotionPurchaseScreen(
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

  final _i25.Key? key;

  final _i27.FacilityPromotionDetailsEntity promotion;

  final _i29.CollapsedFacilityEntity facility;

  final _i25.Color accentColor;

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
/// [_i17.RegisterScreen]
class RegisterRoute extends _i24.PageRouteInfo<void> {
  const RegisterRoute({List<_i24.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i17.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i18.SavedProfilesScreen]
class SavedProfilesRoute extends _i24.PageRouteInfo<void> {
  const SavedProfilesRoute({List<_i24.PageRouteInfo>? children})
    : super(SavedProfilesRoute.name, initialChildren: children);

  static const String name = 'SavedProfilesRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i18.SavedProfilesScreen();
    },
  );
}

/// generated route for
/// [_i19.SearchScreen]
class SearchRoute extends _i24.PageRouteInfo<void> {
  const SearchRoute({List<_i24.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i19.SearchScreen();
    },
  );
}

/// generated route for
/// [_i20.SplashScreen]
class SplashRoute extends _i24.PageRouteInfo<void> {
  const SplashRoute({List<_i24.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i20.SplashScreen();
    },
  );
}

/// generated route for
/// [_i21.TicketPurchaseScreen]
class TicketPurchaseRoute extends _i24.PageRouteInfo<TicketPurchaseRouteArgs> {
  TicketPurchaseRoute({
    _i25.Key? key,
    required _i27.FacilityTicketDetailsEntity ticket,
    required _i29.CollapsedFacilityEntity facility,
    required _i25.Color accentColor,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketPurchaseRouteArgs>();
      return _i21.TicketPurchaseScreen(
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

  final _i25.Key? key;

  final _i27.FacilityTicketDetailsEntity ticket;

  final _i29.CollapsedFacilityEntity facility;

  final _i25.Color accentColor;

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
/// [_i22.UserProfileScreen]
class UserProfileRoute extends _i24.PageRouteInfo<void> {
  const UserProfileRoute({List<_i24.PageRouteInfo>? children})
    : super(UserProfileRoute.name, initialChildren: children);

  static const String name = 'UserProfileRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i22.UserProfileScreen();
    },
  );
}

/// generated route for
/// [_i23.UserPurchasesScreen]
class UserPurchasesRoute extends _i24.PageRouteInfo<UserPurchasesRouteArgs> {
  UserPurchasesRoute({
    _i25.Key? key,
    required _i30.UserPurchaseCategory category,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         UserPurchasesRoute.name,
         args: UserPurchasesRouteArgs(key: key, category: category),
         initialChildren: children,
       );

  static const String name = 'UserPurchasesRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserPurchasesRouteArgs>();
      return _i23.UserPurchasesScreen(key: args.key, category: args.category);
    },
  );
}

class UserPurchasesRouteArgs {
  const UserPurchasesRouteArgs({this.key, required this.category});

  final _i25.Key? key;

  final _i30.UserPurchaseCategory category;

  @override
  String toString() {
    return 'UserPurchasesRouteArgs{key: $key, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserPurchasesRouteArgs) return false;
    return key == other.key && category == other.category;
  }

  @override
  int get hashCode => key.hashCode ^ category.hashCode;
}
