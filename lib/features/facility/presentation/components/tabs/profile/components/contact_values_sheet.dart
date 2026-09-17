import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/enums/enums.dart';
import 'contact_channel_visuals.dart';

/// Value picker for a contact channel that holds more than one entry — a
/// facility publishing both a landline and a mobile, say.
///
/// A channel with a single value never reaches here; it launches directly.
class ContactValuesSheet extends StatelessWidget {
  const ContactValuesSheet({super.key, required this.contact, required this.accentColor});

  final FacilityContactEntity contact;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.spacing.s24,
          context.spacing.s24,
          context.spacing.s24,
          context.spacing.s24,
        ),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          spacing: context.spacing.s16,
          children: [
            Text(
              contact.channel == FacilityContactChannel.contactNumber
                  ? context.l10n.facilityDetails_chooseNumberTitle
                  : contact.label,
              style: context.typography.bold16.primary(context),
            ),
            for (final link in contact.links)
              _ContactValueTile(
                contact: contact,
                link: link,
                accentColor: accentColor,
              ),
          ],
        ),
      ),
    );
  }
}

class _ContactValueTile extends StatelessWidget {
  const _ContactValueTile({
    required this.contact,
    required this.link,
    required this.accentColor,
  });

  final FacilityContactEntity contact;
  final FacilityContactLinkEntity link;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      borderRadius: BorderRadius.circular(context.spacing.s12),
      splashColor: accentColor.withValues(alpha: 0.1),
      onTap: () async {
        final navigator = Navigator.of(context);
        final messengerContext = context;
        final opened = await ContactChannelVisuals.launch(contact.channel, link.value);

        if (!messengerContext.mounted) return;
        if (opened) {
          navigator.pop();
        } else {
          messengerContext.showErrorSnackBar(messengerContext.l10n.facilityDetails_linkFailed);
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(context.spacing.s16),
        decoration: ShapeDecoration(
          color: context.colors.backgroundGrey,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s12),
            side: BorderSide(color: context.colors.strokePrimary),
          ),
        ),
        child: Row(
          spacing: context.spacing.s12,
          children: [
            ContactChannelVisuals.icon(contact.channel, color: accentColor),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  if (link.label != null)
                    Text(link.label!, style: context.typography.medium12.tertiary(context)),
                  Text(link.value, style: context.typography.medium14.primary(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
