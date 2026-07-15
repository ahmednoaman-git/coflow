import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter/material.dart';

/// Runtime arguments for [TicketPurchaseCubit] / [TicketPurchaseScreen].
class TicketPurchaseArgs {
  const TicketPurchaseArgs({
    required this.ticket,
    required this.facility,
    required this.accentColor,
  });

  final FacilityTicketDetailsEntity ticket;
  final CollapsedFacilityEntity facility;
  final Color accentColor;
}
