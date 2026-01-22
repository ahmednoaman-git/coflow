import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../facility_data_provider.dart';

/// Actions section for facility profile.
/// Contains buttons for tracking updates, FAQs, and contact options.
class ActionsSection extends StatelessWidget {
  const ActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
      child: Column(
        spacing: context.spacing.s16,
        children: [
          Row(
            mainAxisAlignment: .center,
            spacing: context.spacing.s16,
            children: [
              _buildActionButton(
                context,
                icon: Assets.svgs.trackUpdates.svg(),
                text: 'Track Updates',
                color: facilityData.activityLineColor,
                onTap: () {},
              ),
              _buildActionButton(
                context,
                icon: Assets.svgs.faqs.svg(),
                text: 'FAQs',
                color: facilityData.activityLineColor,
                onTap: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: .center,
            spacing: context.spacing.s8,
            children: [
              _buildIconOnlyButton(
                context,
                icon: Assets.svgs.phone.svg(),
                color: facilityData.activityLineColor,
                onTap: () {},
              ),
              _buildIconOnlyButton(
                context,
                icon: Assets.svgs.mail.svg(),
                color: facilityData.activityLineColor,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required Widget icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 44,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: context.colors.backgroundWhite,
        shadows: context.shadows.sm,
      ),
      child: TappableScale(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        splashColor: color.withValues(alpha: 0.1),
        child: Padding(
          padding: EdgeInsets.all(context.spacing.s8),
          child: Row(
            spacing: context.spacing.s8,
            children: [
              ColorFiltered(colorFilter: color.colorFilter, child: icon),
              Padding(
                padding: EdgeInsets.only(right: context.spacing.s4),
                child: Text(text, style: context.typography.medium16.primary(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconOnlyButton(
    BuildContext context, {
    required Widget icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 44,
      width: 44,
      decoration: ShapeDecoration(
        shape: const CircleBorder(),
        color: context.colors.backgroundWhite,
        shadows: context.shadows.sm,
      ),
      child: TappableScale(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        splashColor: color.withValues(alpha: 0.1),
        child: Padding(
          padding: EdgeInsets.all(context.spacing.s8),
          child: ColorFiltered(colorFilter: color.colorFilter, child: icon),
        ),
      ),
    );
  }
}
