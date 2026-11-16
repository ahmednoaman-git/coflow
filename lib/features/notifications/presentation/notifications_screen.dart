import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../domain/entities/entities.dart';
import 'components/notification_tile.dart';
import 'cubit/notifications_cubit.dart';
import 'cubit/notifications_state.dart';

/// The customer's notifications, newest first. Opened from the Account bell.
@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (_) => getIt<NotificationsCubit>(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(title: context.l10n.notifications_title, showBackButton: true),
          body: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return LogoRefreshIndicator(
      onRefresh: context.read<NotificationsCubit>().refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(context.spacing.s24),
            sliver: SliverToBoxAdapter(
              child:
                  AsyncHandler<NotificationsCubit, NotificationsState, List<AppNotificationEntity>>(
                    requestManagerGetter: (cubit) => cubit.notificationsManager,
                    skeletonBuilder: (_) => const NotificationTileSkeletons(),
                    onRetry: (cubit) => cubit.refresh(),
                    onBackgroundError: (context, failure) =>
                        context.showErrorSnackBar(failure.message),
                    successBuilder: (context, notifications) {
                      if (notifications.isEmpty) {
                        return EmptyStateView(
                          icon: SolarIconsOutline.bell,
                          title: context.l10n.notifications_empty,
                          hint: context.l10n.notifications_emptyHint,
                        );
                      }
                      return Column(
                        spacing: context.spacing.s12,
                        children: [
                          for (final notification in notifications)
                            NotificationTile(
                              notification: notification,
                              onTap: switch (notification.facility) {
                                final facility? => () => context.router.push(
                                  FacilityDetailsRoute(
                                    facility: facility.preview,
                                    isPreview: true,
                                  ),
                                ),
                                null => null,
                              },
                            ),
                        ],
                      );
                    },
                  ),
            ),
          ),
          const SliverBottomInset(),
        ],
      ),
    );
  }
}

extension on NotificationFacilityEntity {
  /// What the facility screen can show at once; it fills in the rest (status,
  /// subscription, payment type, cover) from the profile it loads.
  CollapsedFacilityEntity get preview => CollapsedFacilityEntity(
    id: id,
    name: name,
    description: '',
    logoUrl: logoUrl,
    activityLine: ActivityLineEntity.fromId(activityLineId ?? ActivityLineEntity.sky.id),
    accountType: AccountType.fromString(facilityType ?? ''),
    status: FacilityStatus.visible,
    subscriptionStatus: SubscriptionStatus.inactive,
    paymentType: PaymentType.none,
    views: 0,
  );
}
