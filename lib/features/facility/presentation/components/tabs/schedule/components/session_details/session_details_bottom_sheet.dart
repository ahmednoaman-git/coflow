import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/entities/entities.dart';
import '../../../../../cubit/cubit.dart';
import '../../../../facility_data_provider.dart';
import '../../../tab_controls/facility_tab_controller.dart';
import '../../../tab_controls/facility_utils.dart';
import '../../../profile/components/facility_contact_options.dart';
import 'session_attendees_section.dart';
import 'session_cta_button.dart';
import 'session_details_header.dart';
import 'session_details_section.dart';

/// The slot sheet opened by tapping a card in the timeline.
class SessionDetailsBottomSheet extends StatelessWidget {
  const SessionDetailsBottomSheet({
    super.key,
    this.onPurchaseTickets,
    this.onContactFacility,
    this.onReservationChanged,
  });

  final VoidCallback? onPurchaseTickets;
  final VoidCallback? onContactFacility;
  final VoidCallback? onReservationChanged;

  static Future<void> show(BuildContext context, FacilitySessionEntity session) async {
    final facilityData = FacilityDataProvider.of(context);
    final tabs = FacilityTabController.of(context);
    final scheduleCubit = context.read<FacilityScheduleCubit>();
    final facilityCubit = context.read<FacilityDetailsCubit>();
    var changed = false;

    await showMainBottomSheet<void>(
      context: context,
      // The sheet paints its own rounded container below.
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => BlocProvider<SessionDetailsCubit>(
        create: (_) => getIt<SessionDetailsCubit>(param1: session),
        child: FacilityDataProvider.fromFacilityDataProvider(
          facilityDataProvider: facilityData,
          child: SessionDetailsBottomSheet(
            onReservationChanged: () => changed = true,
            onPurchaseTickets: () {
              Navigator.of(sheetContext).pop();
              tabs.setSelectedTab(FacilityUtils.pricingTabIndex(facilityData.facility));
            },
            onContactFacility: () => FacilityContactOptions.show(
              sheetContext,
              facilityId: facilityData.facility.id,
              accentColor: facilityData.activityLineColor,
              facilityCubit: facilityCubit,
            ),
          ),
        ),
      ),
    );
    if (changed && !scheduleCubit.isClosed) await scheduleCubit.refresh();
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
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),
      child: AsyncHandler<SessionDetailsCubit, SessionDetailsState, FacilitySessionDetailsEntity>(
        requestManagerGetter: (cubit) => cubit.detailsManager,
        loadingBuilder: (context) => const SizedBox(
          height: 240,
          child: Center(child: CircularProgressIndicator()),
        ),
        onRetry: (cubit) => cubit.refresh(),
        // The details request only paints the first load; afterwards every
        // action answers with a fresher slot, which `state.details` prefers.
        successBuilder: (context, _) => BlocBuilder<SessionDetailsCubit, SessionDetailsState>(
          builder: (context, state) {
            final details = state.details;
            if (details == null) return const SizedBox.shrink();

            return _SessionDetailsContent(
              session: details,
              onPurchaseTickets: onPurchaseTickets,
              onContactFacility: onContactFacility,
              onReservationChanged: onReservationChanged,
            );
          },
        ),
      ),
    );
  }
}

class _SessionDetailsContent extends StatelessWidget {
  const _SessionDetailsContent({
    required this.session,
    this.onPurchaseTickets,
    this.onContactFacility,
    this.onReservationChanged,
  });

  final FacilitySessionDetailsEntity session;
  final VoidCallback? onPurchaseTickets;
  final VoidCallback? onContactFacility;
  final VoidCallback? onReservationChanged;

  @override
  Widget build(BuildContext context) {
    final facility = FacilityDataProvider.of(context).facility;
    final accent = session.colorHex.toColorOrNull() ?? context.colors.skyBluePrimary;

    final cta = SessionCtaEntity.resolve(
      session: session,
      facilityName: facility.name,
      // TODO(product): confirm what "Premium Inactive" means before trusting
      // this — open question 1 in `schedule_feature_plan.md`.
      isFacilityPremiumActive: facility.subscriptionStatus.isPremium,
      now: DateTime.now(),
    );

    final sections = <Widget>[
      if (session.location case final location?) SessionLocationSection(location: location),
      if (!session.isRecurring) SessionCustomersSection(session: session, accent: accent),
      if (session.waitlist.isNotEmpty) SessionWaitlistSection(waitlist: session.waitlist),
      if (session.note case final note? when note.isNotEmpty) SessionNoteSection(note: note),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          SessionDetailsHeader(session: session, accent: accent),
          for (final (index, section) in sections.indexed) ...[
            if (index > 0) Divider(height: 1, color: context.colors.strokePrimary),
            section,
          ],
          Padding(
            padding:
                EdgeInsets.all(context.spacing.s24) +
                EdgeInsets.only(bottom: MediaQuery.viewPaddingOf(context).bottom),
            child: SessionCtaButton(
              cta: cta,
              session: session,
              accent: accent,
              onPurchaseTickets: onPurchaseTickets,
              onContactFacility: onContactFacility,
              onReservationChanged: onReservationChanged,
            ),
          ),
        ],
      ),
    );
  }
}
