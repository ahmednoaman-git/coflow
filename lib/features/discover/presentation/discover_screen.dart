import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_icons/solar_icons.dart';

/// Discover tab.
///
/// TODO(feature): screen not designed yet — the tab exists so the nav bar has
/// its full set of destinations. The activity lines and business listings that
/// used to sit here now live on Home, under the centre CTA.
@RoutePage()
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: context.colors.backgroundTwo,
        appBar: BrandedAppBar(title: context.l10n.nav_discover),
        body: const ComingSoonView(icon: SolarIconsOutline.compass),
      ),
    );
  }
}
