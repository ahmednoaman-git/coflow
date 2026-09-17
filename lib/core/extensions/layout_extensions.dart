import 'package:flutter/widgets.dart';

/// Screen-edge insets that content has to keep clear of.
extension LayoutInsets on BuildContext {
  /// How much of the bottom of the screen is covered by furniture the content
  /// must not end up hidden under — the floating nav bar inside the
  /// authenticated tab shell, the system gesture inset on a route pushed
  /// outside it.
  ///
  /// One number covers both cases because `NavigationRootScreen`'s `Scaffold`
  /// is built with `extendBody: true`: Flutter then republishes the body's
  /// `MediaQuery.padding.bottom` as the bottom bar's height, and that travels
  /// down the whole tab, nested navigators included. So nothing outside
  /// `CoflowBottomNavBar` should read the bar's own measurements — pad by this
  /// and a screen lays out correctly whether it is shown inside a tab or
  /// pushed on the root router.
  ///
  /// Spend it as *trailing padding* rather than by shrinking the viewport, so
  /// content still scrolls under the bar and simply comes to rest clear of it:
  ///
  /// ```dart
  /// SingleChildScrollView(
  ///   padding: EdgeInsets.only(bottom: context.bottomInset + context.spacing.s24),
  ///   ...
  /// )
  /// ```
  ///
  /// A `CustomScrollView` gets the same from a trailing `SliverBottomInset`.
  double get bottomInset => MediaQuery.paddingOf(this).bottom;
}
