import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../facility_data_provider.dart';
import 'contact_channel_visuals.dart';
import 'contact_values_sheet.dart';

/// Closing block of the profile tab: how to reach the facility, its FAQ, and
/// when it last updated the page.
class ActionsSection extends StatelessWidget {
  const ActionsSection({
    super.key,
    required this.contacts,
    required this.updatedAt,
    required this.onOpenFaqs,
  });

  /// Already filtered to channels that have something behind them.
  final List<FacilityContactEntity> contacts;
  final DateTime? updatedAt;
  final VoidCallback onOpenFaqs;

  @override
  Widget build(BuildContext context) {
    final accent = FacilityDataProvider.of(context).activityLineColor;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s24,
        vertical: context.spacing.s32,
      ),
      child: Column(
        spacing: context.spacing.s24,
        children: [
          if (contacts.isNotEmpty)
            Wrap(
              alignment: .center,
              spacing: context.spacing.s16,
              runSpacing: context.spacing.s16,
              children: [
                for (final contact in contacts)
                  _ContactButton(contact: contact, accentColor: accent),
              ],
            ),
          MainButton(
            text: context.l10n.facilityDetails_faqs,
            leadingIcon: SolarIconsOutline.infoCircle,
            backgroundColor: accent,
            height: 48,
            onPressed: onOpenFaqs,
          ),
          if (updatedAt != null)
            Text(
              context.l10n.facilityDetails_lastUpdated(
                DateFormat('dd/MM/yyyy').format(updatedAt!),
              ),
              style: context.typography.book12.tertiary(context),
            ),
        ],
      ),
    );
  }
}

/// One circular channel button. Tapping launches the single value behind it, or
/// opens a picker when the facility published several.
class _ContactButton extends StatelessWidget {
  const _ContactButton({required this.contact, required this.accentColor});

  final FacilityContactEntity contact;
  final Color accentColor;

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
        onTap: () => _handleTap(context),
        splashColor: accentColor.withValues(alpha: 0.1),
        child: Padding(
          padding: EdgeInsets.all(context.spacing.s12),
          child: ContactChannelVisuals.icon(contact.channel, color: accentColor),
        ),
      ),
    );
  }

  Future<void> _handleTap(BuildContext context) async {
    if (contact.needsChoice) {
      // The sheet mounts on the root navigator, outside this tab's tree, so the
      // accent colour is read here and passed in.
      showMainBottomSheet<void>(
        context: context,
        builder: (_) => ContactValuesSheet(contact: contact, accentColor: accentColor),
      );
      return;
    }

    final opened = await ContactChannelVisuals.launch(
      contact.channel,
      contact.links.first.value,
    );
    if (!opened && context.mounted) {
      context.showErrorSnackBar(context.l10n.facilityDetails_linkFailed);
    }
  }
}
