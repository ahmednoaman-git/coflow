import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/purchase_app_bar.dart';
import 'components/ticket_purchase_screen_body.dart';
import 'cubit/cubit.dart';

@RoutePage()
class TicketPurchaseScreen extends StatelessWidget {
  const TicketPurchaseScreen({
    super.key,
    required this.ticket,
    required this.facility,
    required this.accentColor,
  });

  final FacilityTicketDetailsEntity ticket;
  final CollapsedFacilityEntity facility;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TicketPurchaseCubit>(
      create: (_) => getIt<TicketPurchaseCubit>(
        param1: TicketPurchaseArgs(ticket: ticket, facility: facility, accentColor: accentColor),
      ),
      child: Scaffold(
        backgroundColor: context.colors.backgroundGrey,
        appBar: PurchaseAppBar(title: facility.name, accentColor: accentColor),
        body: const TicketPurchaseScreenBody(),
      ),
    );
  }
}
