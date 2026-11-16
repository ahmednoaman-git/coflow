import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';

/// One notification: the facility's logo (or a bell for messages from Coflow),
/// the title, the message and the day it was sent. Tappable only when it is
/// about a facility, which it then opens.
class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.notification, this.onTap});

  final AppNotificationEntity notification;
  final VoidCallback? onTap;

  static const double leadingSize = 48;

  @override
  Widget build(BuildContext context) {
    final facility = notification.facility;
    final sentOn = notification.sentOn;
    final accent = facility?.activityLineId == null
        ? context.colors.signatureBlue
        : ActivityLineEntity.fromId(facility!.activityLineId!).getColors(context).$1;

    final content = NotificationTileSurface(
      child: Row(
        crossAxisAlignment: .start,
        spacing: context.spacing.s12,
        children: [
          if (facility != null)
            ShimmerImage(
              imageUrl: facility.logoUrl,
              width: leadingSize,
              height: leadingSize,
              borderRadius: leadingSize / 2,
              fallback: ImageFallback.business(facility.name, accent: accent),
            )
          else
            Container(
              width: leadingSize,
              height: leadingSize,
              decoration: ShapeDecoration(
                color: context.colors.signatureBlueSecondary,
                shape: const CircleBorder(),
              ),
              child: Icon(SolarIconsOutline.bell, color: context.colors.signatureBlue, size: 22),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: context.spacing.s4,
              children: [
                Row(
                  crossAxisAlignment: .start,
                  spacing: context.spacing.s8,
                  children: [
                    Expanded(
                      child: Text(
                        notification.title,
                        style: context.typography.medium16.primary(context),
                      ),
                    ),
                    if (sentOn != null)
                      Text(
                        DateFormat.MMMd(context.locale.toLanguageTag()).format(sentOn),
                        style: context.typography.book12.disabled(context),
                      ),
                  ],
                ),
                if (notification.content.isNotEmpty)
                  Text(
                    notification.content,
                    style: context.typography.book14.secondary(context).copyWith(height: 1.4),
                  ),
                if (facility != null && facility.name.isNotEmpty)
                  Text(facility.name, style: context.typography.medium12.withColor(accent)),
              ],
            ),
          ),
        ],
      ),
    );

    if (onTap == null) return content;
    return TappableScale(
      borderRadius: BorderRadius.circular(context.spacing.s16),
      onTap: onTap,
      child: content,
    );
  }
}

class NotificationTileSurface extends StatelessWidget {
  const NotificationTileSurface({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.spacing.s16),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.xs,
      ),
      child: child,
    );
  }
}

class NotificationTileSkeletons extends StatelessWidget {
  const NotificationTileSkeletons({super.key, this.count = 6});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Column(
        spacing: context.spacing.s12,
        children: [
          for (var index = 0; index < count; index++)
            NotificationTileSurface(
              child: Row(
                crossAxisAlignment: .start,
                spacing: context.spacing.s12,
                children: [
                  const SkeletonCircle(size: NotificationTile.leadingSize),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: context.spacing.s4,
                      children: [
                        SkeletonText(style: context.typography.medium16, widthFactor: 0.5),
                        SkeletonText(
                          style: context.typography.book14.copyWith(height: 1.4),
                          widthFactor: 0.9,
                        ),
                        SkeletonText(style: context.typography.medium12, width: 90),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
