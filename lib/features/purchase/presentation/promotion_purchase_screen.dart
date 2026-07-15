import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/promotion_purchase_screen_body.dart';
import 'components/purchase_app_bar.dart';
import 'cubit/cubit.dart';

@RoutePage()
class PromotionPurchaseScreen extends StatelessWidget {
  const PromotionPurchaseScreen({
    super.key,
    required this.promotion,
    required this.facility,
    required this.accentColor,
  });

  final FacilityPromotionDetailsEntity promotion;
  final CollapsedFacilityEntity facility;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PromotionPurchaseCubit>(
      create: (_) => getIt<PromotionPurchaseCubit>(
        param1: PromotionPurchaseArgs(
          promotion: promotion,
          facility: facility,
          accentColor: accentColor,
        ),
      ),
      child: Scaffold(
        backgroundColor: context.colors.backgroundGrey,
        appBar: PurchaseAppBar(title: facility.name, accentColor: accentColor),
        body: const PromotionPurchaseScreenBody(),
      ),
    );
  }
}
