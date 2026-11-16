import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dtos/dtos.dart';
import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/use_cases/use_cases.dart';
import '../../../../cubit/cubit.dart';
import 'contact_channel_visuals.dart';
import 'contact_values_sheet.dart';

/// The "Contact {facility}" action — offered wherever the facility does not
/// take the booking or the purchase in the app (slots, tickets, promotions).
///
/// Lists the channels the facility takes reservations through; a channel
/// with a single value launches straight away.
abstract final class FacilityContactOptions {
  /// Opens the channel list for [facilityId].
  ///
  /// Pass [facilityCubit] when the facility page is underneath, so the profile
  /// it already holds is reused. Screens outside that page (service details
  /// opened from search) leave it null, and the profile is fetched here — as
  /// it is when the page's own has not loaded.
  static Future<void> show(
    BuildContext context, {
    required int facilityId,
    required Color accentColor,
    FacilityDetailsCubit? facilityCubit,
  }) async {
    final contacts = await _reservationContacts(facilityId, facilityCubit);
    if (!context.mounted) return;

    if (contacts == null) {
      context.showErrorSnackBar(context.l10n.somethingWentWrong);
      return;
    }
    if (contacts.isEmpty) {
      context.showInfoSnackBar(context.l10n.facilityDetails_noContactChannels);
      return;
    }

    await showMainBottomSheet<void>(
      context: context,
      builder: (_) => _ContactOptionsSheet(contacts: contacts, accentColor: accentColor),
    );
  }

  /// Null when the profile holding them could not be loaded.
  static Future<List<FacilityContactEntity>?> _reservationContacts(
    int facilityId,
    FacilityDetailsCubit? facilityCubit,
  ) async {
    final loaded = facilityCubit?.profileManager.data;
    if (loaded != null) return loaded.actionableReservationContacts;

    final result = await getIt<GetFacilityProfileUseCase>()(
      GetFacilityProfileDto(facilityId: facilityId),
    ).run();
    return result.fold((_) => null, (profile) => profile.actionableReservationContacts);
  }
}

class _ContactOptionsSheet extends StatelessWidget {
  const _ContactOptionsSheet({required this.contacts, required this.accentColor});

  final List<FacilityContactEntity> contacts;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Column(
          mainAxisSize: .min,
          spacing: context.spacing.s12,
          children: [
            for (final contact in contacts)
              MainButton(
                text: contact.label,
                onPressed: () => _open(context, contact),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _open(BuildContext context, FacilityContactEntity contact) async {
    if (contact.needsChoice) {
      await showMainBottomSheet<void>(
        context: context,
        builder: (_) => ContactValuesSheet(contact: contact, accentColor: accentColor),
      );
      return;
    }

    final opened = await ContactChannelVisuals.launch(contact.channel, contact.links.first.value);
    if (!opened && context.mounted) {
      context.showErrorSnackBar(context.l10n.facilityDetails_linkFailed);
    }
  }
}
