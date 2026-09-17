import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_icons/solar_icons.dart';

/// Discounts tab.
///
/// TODO(feature): screen not designed yet — the tab exists so the nav bar has
/// its full set of destinations.
@RoutePage()
class DiscountsScreen extends StatelessWidget {
  const DiscountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: context.colors.backgroundTwo,
        appBar: BrandedAppBar(title: context.l10n.discounts_title),
        body: const ComingSoonView(icon: SolarIconsOutline.sale),
      ),
    );
  }
}
