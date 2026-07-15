import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter/material.dart';

/// Runtime arguments for [PromotionPurchaseCubit] / [PromotionPurchaseScreen].
class PromotionPurchaseArgs {
  const PromotionPurchaseArgs({
    required this.promotion,
    required this.facility,
    required this.accentColor,
  });

  final FacilityPromotionDetailsEntity promotion;
  final CollapsedFacilityEntity facility;
  final Color accentColor;
}
