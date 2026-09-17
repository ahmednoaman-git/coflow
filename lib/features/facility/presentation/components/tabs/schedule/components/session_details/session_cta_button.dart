import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/entities/entities.dart';
import '../../../../../cubit/cubit.dart';
import 'reservation_confirm_dialog.dart';

/// The slot's single action, rendered from the resolved [SessionCtaEntity].
///
/// The decision of *which* CTA to show lives in `SessionCtaEntity.resolve`;
/// this widget only renders it and wires the tap.
class SessionCtaButton extends StatelessWidget {
  const SessionCtaButton({
    super.key,
    required this.cta,
    required this.session,
    required this.accent,
    this.onContactFacility,
    this.onPurchaseTickets,
    this.onReservationChanged,
  });

  final SessionCtaEntity cta;
  final FacilitySessionDetailsEntity session;
  final Color accent;
  final VoidCallback? onContactFacility;
  final VoidCallback? onPurchaseTickets;
  final VoidCallback? onReservationChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<SessionDetailsCubit>();

    final (label, isEnabled, isFilled, onPressed) = switch (cta) {
      SessionUnavailableCta() => (
        l10n.facilitySchedule_actionUnavailable,
        false,
        false,
        null,
      ),
      SessionContactFacilityCta(:final facilityName) => (
        l10n.facilitySchedule_contactFacility(facilityName),
        onContactFacility != null,
        false,
        onContactFacility,
      ),
      SessionReserveCta(:final accessibleTickets) => (
        l10n.facilitySchedule_reserveNowCta(accessibleTickets),
        true,
        true,
        () => _confirmReservation(context, cubit),
      ),
      SessionPurchaseTicketsCta(:final accessibleTickets) => (
        l10n.facilitySchedule_purchaseTicketsCta(accessibleTickets),
        onPurchaseTickets != null,
        false,
        onPurchaseTickets,
      ),
      // No confirmation step: queueing costs nothing.
      SessionJoinWaitlistCta() => (
        l10n.facilitySchedule_joinWaitlist,
        true,
        true,
        cubit.joinWaitlist,
      ),
      SessionCancelReservationCta(:final isEnabled) => (
        l10n.facilitySchedule_cancelReservation,
        isEnabled,
        false,
        cubit.cancelReservation,
      ),
      SessionLeaveWaitlistCta(:final isEnabled) => (
        l10n.facilitySchedule_leaveWaitlist,
        isEnabled,
        false,
        cubit.leaveWaitlist,
      ),
    };

    return AsyncHandler<
      SessionDetailsCubit,
      SessionDetailsState,
      FacilitySessionDetailsEntity
    >.loadingDependent(
      requestManagerGetter: (cubit) => cubit.actionManager,
      onError: (context, failure) => context.showErrorSnackBar(failure.message),
      onSuccess: (context, _) => onReservationChanged?.call(),
      builder: (context, isLoading) => MainButton(
        text: label,
        isLoading: isLoading,
        isDisabled: !isEnabled,
        onPressed: onPressed,
        backgroundColor: isFilled ? accent.tintedSurface() : context.colors.backgroundWhite,
        textColor: accent,
        borderColor: isFilled ? null : accent,
      ),
    );
  }

  Future<void> _confirmReservation(BuildContext context, SessionDetailsCubit cubit) async {
    final confirmed = await ReservationConfirmDialog.show(
      context,
      session: session,
      accent: accent,
    );

    if (confirmed ?? false) {
      await cubit.reserve();
    }
  }
}
