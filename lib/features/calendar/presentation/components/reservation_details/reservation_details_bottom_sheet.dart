import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/tabs/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../cubit/cubit.dart';
import 'reservation_cta_row.dart';
import 'reservation_details_header.dart';

/// The reservation sheet opened by tapping a card in the Calendar timeline.
///
/// The body below the header is the facility feature's slot sections — a
/// reservation is the same slot seen from the customer's side, so location,
/// customers, waitlist and note are rendered by the same widgets.
class ReservationDetailsBottomSheet extends StatelessWidget {
  const ReservationDetailsBottomSheet({super.key});

  static Future<bool?> show(BuildContext context, ReservationEntity reservation) {
    return showMainBottomSheet<bool>(
      context: context,
      // The sheet paints its own rounded container below.
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider<ReservationDetailsCubit>(
        create: (_) => getIt<ReservationDetailsCubit>(param1: reservation),
        child: const ReservationDetailsBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .antiAlias,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
      ),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: const RoundedSuperellipseBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),
      child:
          AsyncHandler<ReservationDetailsCubit, ReservationDetailsState, ReservationDetailsEntity>(
            requestManagerGetter: (cubit) => cubit.detailsManager,
            loadingBuilder: (context) => const SizedBox(
              height: 240,
              child: Center(child: CircularProgressIndicator()),
            ),
            onRetry: (cubit) => cubit.refresh(),
            // The details request only paints the first load; afterwards every
            // withdrawal answers with a fresher slot, which `state.details`
            // prefers.
            successBuilder: (context, _) =>
                BlocBuilder<ReservationDetailsCubit, ReservationDetailsState>(
                  builder: (context, state) {
                    final details = state.details;
                    if (details == null) return const SizedBox.shrink();

                    return _ReservationDetailsContent(reservation: details);
                  },
                ),
          ),
    );
  }
}

class _ReservationDetailsContent extends StatelessWidget {
  const _ReservationDetailsContent({required this.reservation});

  final ReservationDetailsEntity reservation;

  @override
  Widget build(BuildContext context) {
    final slot = reservation.slot;
    final accent = slot.colorHex.toColorOrNull() ?? context.colors.skyBluePrimary;

    // Location leads every reservation. Its heading follows the facility's own
    // setting: "Facility Location", or plain "Location" once a Pro facility
    // runs the activity/course somewhere else.
    final sections = <Widget>[
      if (slot.location case final location?) SessionLocationSection(location: location),
      SessionCustomersSection(session: slot, accent: accent),
      if (slot.waitlist.isNotEmpty) SessionWaitlistSection(waitlist: slot.waitlist),
      if (slot.note case final note? when note.isNotEmpty) SessionNoteSection(note: note),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          ReservationDetailsHeader(reservation: reservation, accent: accent),
          for (final (index, section) in sections.indexed) ...[
            if (index > 0) Divider(height: 1, color: context.colors.strokePrimary),
            section,
          ],
          Padding(
            padding:
                EdgeInsets.all(context.spacing.s24) +
                EdgeInsets.only(bottom: MediaQuery.viewPaddingOf(context).bottom),
            child: ReservationCtaRow(reservation: reservation, accent: accent),
          ),
        ],
      ),
    );
  }
}
