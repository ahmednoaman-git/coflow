import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../domain/entities/entities.dart';
import '../../cubit/cubit.dart';
import '../facility_data_provider.dart';
import '../tabs/pricing/pricing.dart';

/// A tappable ticket row within the service details Pricing section.
/// Opens the same [TicketDetailsBottomSheet] used in the Pricing tab.
class ServiceTicketRow extends StatelessWidget {
  const ServiceTicketRow({super.key, required this.ticket});

  final FacilityServiceTicketEntity ticket;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);
    final accent = facilityData.activityLineColor;

    return TappableScale(
      onTap: () => _openTicketDetails(context, facilityData),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.spacing.s8),
        child: Row(
          spacing: context.spacing.s8,
          children: [
            Assets.svgs.ticket.svg(width: 20, height: 20, colorFilter: accent.colorFilter),
            Expanded(
              child: Text(
                ticket.name,
                style: context.typography.medium14.withColor(context.colors.skyBluePrimary),
              ),
            ),
            _buildPrice(context, accent),
            Icon(SolarIconsOutline.altArrowRight, size: 16, color: context.colors.textTertiary),
          ],
        ),
      ),
    );
  }

  Widget _buildPrice(BuildContext context, Color accent) {
    if (ticket.discountPrice == null) {
      return Text(
        '${ticket.currency} ${ticket.price}',
        style: context.typography.medium14.withColor(accent),
      );
    }

    return Row(
      spacing: context.spacing.s4,
      crossAxisAlignment: .end,
      children: [
        Text(
          '${ticket.currency} ${ticket.discountPrice}',
          style: context.typography.medium14.withColor(accent),
        ),
        Text(
          ticket.price.toString(),
          style: context.typography.book12
              .withColor(accent)
              .copyWith(
                decoration: TextDecoration.lineThrough,
                decorationColor: accent,
              ),
        ),
      ],
    );
  }

  void _openTicketDetails(BuildContext context, FacilityDataProvider facilityData) {
    showMainBottomSheet<void>(
      context: context,
      builder: (_) => BlocProvider<TicketDetailsCubit>(
        create: (_) => getIt<TicketDetailsCubit>(param1: ticket.id),
        child: FacilityDataProvider.fromFacilityDataProvider(
          facilityDataProvider: facilityData,
          child: TicketDetailsBottomSheet(ticketId: ticket.id),
        ),
      ),
    );
  }
}
