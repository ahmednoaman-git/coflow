import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:coflow_users_v2/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocProvider(
        create: (_) => getIt<NotificationsBadgeCubit>(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(
            title: context.l10n.account_title,
            actions: const [_NotificationsButton()],
          ),
          body: const AccountScreenBody(),
        ),
      ),
    );
  }
}

/// The bell: opens Notifications, with a dot while some are unseen.
class _NotificationsButton extends StatelessWidget {
  const _NotificationsButton();

  Future<void> _open(BuildContext context) async {
    final badge = context.read<NotificationsBadgeCubit>();
    await context.router.push(const NotificationsRoute());
    await badge.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final hasUnseen = context.select<NotificationsBadgeCubit, bool>((cubit) => cubit.hasUnseen);

    return Stack(
      children: [
        CircularButton(
          icon: SolarIconsOutline.bell,
          iconSize: 24,
          backgroundColor: Colors.transparent,
          iconColor: context.colors.textWhite,
          onPressed: () => _open(context),
        ),
        PositionedDirectional(
          end: 10,
          top: 10,
          child: AnimatedScale(
            scale: hasUnseen ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutBack,
            child: Container(
              width: 10,
              height: 10,
              decoration: ShapeDecoration(
                color: context.colors.earthSunnyGoldPrimary,
                shape: const CircleBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
