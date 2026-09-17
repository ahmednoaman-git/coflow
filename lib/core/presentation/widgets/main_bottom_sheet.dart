import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Shows a modal bottom sheet on the **root** navigator, so it paints over the
/// bottom nav bar instead of behind it.
///
/// Use this instead of [showModalBottomSheet] everywhere. The raw API defaults
/// `useRootNavigator` to `false`, which is wrong for this app: the authenticated
/// shell (`NavigationRootScreen`) is a `Scaffold` whose body is an
/// `AutoTabsRouter`, so every screen inside a tab sits under a *nested*
/// navigator whose overlay is confined to that body — and a `Scaffold` paints
/// its `bottomNavigationBar` over the body. A sheet pushed on the nearest
/// navigator is therefore clipped under the bar, and the bar stays lit and
/// tappable above the sheet's own scrim. Pushing on the root navigator puts the
/// sheet above the whole shell. ([showDialog] already defaults to the root
/// navigator, which is why dialogs never showed the bug — never pass
/// `useRootNavigator: false` to it.)
///
/// The trade-off is that the sheet is built outside the tab's widget tree, so
/// it inherits none of that subtree's providers. Anything the sheet needs must
/// be captured *before* the call and re-provided inside [builder]:
///
/// ```dart
/// final cubit = context.read<HomeCubit>();
/// final facilityData = FacilityDataProvider.of(context);
///
/// showMainBottomSheet<void>(
///   context: context,
///   builder: (_) => BlocProvider.value(
///     value: cubit,
///     child: FacilityDataProvider.fromFacilityDataProvider(
///       facilityDataProvider: facilityData,
///       child: const SomeSheet(),
///     ),
///   ),
/// );
/// ```
///
/// Defaults match how sheets are built here: scroll-controlled, a white
/// background and a superellipse top radius of `spacing.s24`. Pass
/// [backgroundColor] as `Colors.transparent` when the sheet paints its own
/// container (the pattern used by the session and reservation detail sheets).
Future<T?> showMainBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = true,
  bool useSafeArea = false,
  bool isDismissible = true,
  bool enableDrag = true,
  Color? backgroundColor,
  ShapeBorder? shape,
}) {
  return showModalBottomSheet<T>(
    context: context,
    // The whole point of this helper — see the doc comment above.
    useRootNavigator: true,
    isScrollControlled: isScrollControlled,
    useSafeArea: useSafeArea,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: backgroundColor ?? context.colors.backgroundWhite,
    shape:
        shape ??
        RoundedSuperellipseBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(context.spacing.s24),
          ),
        ),
    builder: builder,
  );
}
