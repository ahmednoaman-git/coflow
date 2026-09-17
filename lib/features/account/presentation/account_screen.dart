import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_icons/solar_icons.dart';

import 'components/components.dart';

/// Account tab: the user's counters plus the management group.
@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: context.colors.backgroundTwo,
        appBar: BrandedAppBar(
          title: context.l10n.account_title,
          actions: const [_NotificationsButton()],
        ),
        body: const AccountScreenBody(),
      ),
    );
  }
}

class _NotificationsButton extends StatelessWidget {
  const _NotificationsButton();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircularButton(
          icon: SolarIconsOutline.bell,
          size: 44,
          iconSize: 24,
          backgroundColor: Colors.transparent,
          iconColor: context.colors.textWhite,
          onPressed: () {
            // TODO: Navigate to notifications
          },
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: context.colors.earthSunnyGoldPrimary,
              shape: .circle,
            ),
          ),
        ),
      ],
    );
  }
}
