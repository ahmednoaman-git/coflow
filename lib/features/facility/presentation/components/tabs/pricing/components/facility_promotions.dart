import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';

import 'promotion_shimmer.dart';
import 'promotion_tile.dart';

class FacilityPromotions extends StatelessWidget {
  const FacilityPromotions({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<FacilityDetailsCubit, FacilityDetailsState, List<FacilityPromotionEntity>>(
      requestManagerGetter: (cubit) => cubit.promotionsManager,
      loadingBuilder: (context) => const PromotionShimmerList(),
      successBuilder: (context, promotions) {
        if (promotions.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(context.spacing.s32),
            child: Text(
              context.l10n.facilityDetails_noPromotions,
              style: context.typography.medium14.tertiary(context),
              textAlign: .center,
            ),
          );
        }

        return FacilityPromotionsList(promotions: promotions);
      },
      onRetry: (cubit) => cubit.refreshPromotions(),
    );
  }
}

class FacilityPromotionsList extends StatelessWidget {
  const FacilityPromotionsList({super.key, required this.promotions});

  final List<FacilityPromotionEntity> promotions;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final promotionWidth = constraints.maxWidth.clamp(200, 480).toDouble();

        return Column(
          spacing: context.spacing.s16,
          children: [
            for (final promotion in promotions)
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: promotionWidth,
                  child: PromotionTile(promotion: promotion),
                ),
              ),
          ],
        );
      },
    );
  }
}
