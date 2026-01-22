import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';

import '../../../facility_data_provider.dart';
import 'ticket_details_sections.dart';

class TicketDetailsBottomSheet extends StatelessWidget {
  const TicketDetailsBottomSheet({super.key, required this.ticketId});

  final int ticketId;

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<TicketDetailsCubit, TicketDetailsState, FacilityTicketDetailsEntity>(
      requestManagerGetter: (cubit) => cubit.detailsManager,
      loadingBuilder: (context) => const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      ),
      successBuilder: (context, ticketDetails) {
        return _TicketDetailsContent(ticketDetails: ticketDetails);
      },
      onRetry: (cubit) => cubit.refresh(),
    );
  }
}

class _TicketDetailsContent extends StatelessWidget {
  const _TicketDetailsContent({required this.ticketDetails});

  final FacilityTicketDetailsEntity ticketDetails;

  @override
  Widget build(BuildContext context) {
    final sections =
        const [
              PriceSection(),
              AccessSection(),
              ConditionsSection(),
              ValidityAndPurchaseSection(),
            ]
            .map(
              (w) => Padding(
                padding: EdgeInsets.all(context.spacing.s16),
                child: w,
              ),
            )
            .toList();

    final children = [
      Padding(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Center(
          child: Text(
            ticketDetails.name,
            style: context.typography.bold16.primary(context),
          ),
        ),
      ),
      ...sections,
    ];

    return TicketDetailsProvider(
      facilityData: FacilityDataProvider.of(context),
      data: ticketDetails,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (context, index) => Divider(
          thickness: index == 0 ? 2 : 1,
          height: 0,
          color: context.colors.strokePrimary,
        ),
      ),
    );
  }
}

/// Provides ticket details data down the widget tree.
class TicketDetailsProvider extends InheritedWidget {
  const TicketDetailsProvider({
    super.key,
    required this.facilityData,
    required this.data,
    required super.child,
  });

  final FacilityDataProvider facilityData;
  final FacilityTicketDetailsEntity data;

  static TicketDetailsProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TicketDetailsProvider>()!;
  }

  @override
  bool updateShouldNotify(TicketDetailsProvider oldWidget) {
    return data != oldWidget.data;
  }
}
