import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../facility/domain/entities/entities.dart';
import '../../../facility_data_provider.dart';
import '../../../page_section.dart';

/// Actions section for facility profile.
/// Contains buttons for tracking updates, FAQs, and contact options.
class ActionsSection extends StatelessWidget {
  const ActionsSection({super.key, required this.contacts});

  final List<ReservationContactEntity> contacts;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);

    return PageSection(
      title: context.l10n.facilityDetails_actionsSectionTitle,
      svgIconPath: Assets.svgs.phone.path,
      children: [
        Column(
          spacing: context.spacing.s16,
          children: [
            Row(
              mainAxisAlignment: .center,
              spacing: context.spacing.s16,
              children: [
                _ElevatedActionButton(
                  icon: Assets.svgs.trackUpdates.svg(),
                  text: context.l10n.facilityDetails_trackUpdates,
                  color: facilityData.activityLineColor,
                  onTap: () {},
                ),
                _ElevatedActionButton(
                  icon: Assets.svgs.faqs.svg(),
                  text: context.l10n.facilityDetails_faqs,
                  color: facilityData.activityLineColor,
                  onTap: () {},
                ),
              ],
            ),
            if (contacts.isNotEmpty)
              Row(
                mainAxisAlignment: .center,
                spacing: context.spacing.s16,
                children: [
                  for (final contact in contacts)
                    _ElevatedIconButton(
                      icon: SvgPicture.asset(_getSocialIcon(contact.type)),
                      color: facilityData.activityLineColor,
                      onTap: () {
                        // TODO: Handle contact action
                      },
                    ),
                ],
              ),
          ],
        ),
      ],
    );
  }

  String _getSocialIcon(String social) {
    return switch (social) {
      'Contact Number' => Assets.svgs.phone.path,
      _ => Assets.svgs.mail.path,
    };
  }
}

class _ElevatedActionButton extends StatelessWidget {
  const _ElevatedActionButton({
    required this.icon,
    required this.text,
    required this.color,
    required this.onTap,
  });

  final Widget icon;
  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
}

class _ElevatedIconButton extends StatelessWidget {
  const _ElevatedIconButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final Widget icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
