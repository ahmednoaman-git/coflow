import 'package:coflow_users_v2/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../cubit/cubit.dart';

/// The sheet's actions: give the place up, or go to the facility running it.
///
/// Which withdrawal shows follows the viewer's standing, and the two are
/// styled apart on purpose — cancelling a reservation is filled in the slot's
/// colour, leaving a waitlist is the lighter, white treatment.
class ReservationCtaRow extends StatelessWidget {
  const ReservationCtaRow({
    super.key,
    required this.reservation,
    required this.accent,
  });

  final ReservationDetailsEntity reservation;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<ReservationDetailsCubit>();

    // Past the facility's cancellation window the place can no longer be given
    // up, so the action stays visible but inert.
    final canWithdraw = reservation.canWithdrawAt(DateTime.now());

    final withdrawal = switch (reservation.slot.viewerState) {
      SessionViewerState.reserved => (
        label: l10n.facilitySchedule_cancelReservation,
        isFilled: true,
        onPressed: cubit.cancelReservation,
      ),
      SessionViewerState.waitlisted => (
        label: l10n.facilitySchedule_leaveWaitlist,
        isFilled: false,
        onPressed: cubit.leaveWaitlist,
      ),
      // The place has just been given up — nothing left to withdraw from.
      SessionViewerState.none => null,
    };

    return Row(
      spacing: context.spacing.s16,
      children: [
        if (withdrawal != null)
          Expanded(
            child:
                AsyncHandler<
                  ReservationDetailsCubit,
                  ReservationDetailsState,
                  ReservationDetailsEntity
                >.loadingDependent(
                  requestManagerGetter: (cubit) => cubit.actionManager,
                  onError: (context, failure) => context.showErrorSnackBar(failure.message),
                  onSuccess: (context, _) => Navigator.of(context).pop(true),
                  builder: (context, isLoading) => MainButton(
                    text: withdrawal.label,
                    isLoading: isLoading,
                    isDisabled: !canWithdraw || isLoading,
                    onPressed: withdrawal.onPressed,
                    backgroundColor: withdrawal.isFilled
                        ? accent.tintedSurface()
                        : context.colors.backgroundWhite,
                    textColor: accent,
                    borderColor: withdrawal.isFilled ? null : accent,
                  ),
                ),
          ),
        Expanded(
          child: MainButton(
            text: reservation.facilityName,
            isDisabled: reservation.facility == null,
            onPressed: reservation.facility == null
                ? null
                : () {
                    final router = context.router;
                    Navigator.of(context).pop();
                    router.push(FacilityDetailsRoute(facility: reservation.facility!));
                  },
            backgroundColor: accent,
            textColor: context.colors.textWhite,
          ),
        ),
      ],
    );
  }
}
