import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_icons/solar_icons.dart';

/// Profile tab — the user's own public profile.
///
/// TODO(feature): screen not designed yet. The Account tab holds the profile
/// counters and management actions in the meantime.
@RoutePage()
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: context.colors.backgroundTwo,
        appBar: BrandedAppBar(title: context.l10n.nav_profile),
        body: const ComingSoonView(icon: SolarIconsOutline.userCircle),
      ),
    );
  }
}
