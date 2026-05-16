import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../facility_data_provider.dart';
import 'promotion_details_bottom_sheet.dart';
import 'promotion_display_utils.dart';

class PromotionTile extends StatelessWidget {
  const PromotionTile({super.key, required this.promotion});

  final FacilityPromotionEntity promotion;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);
    final isInteractive = switch (promotion) {
      FacilityPromotionPackageEntity() || FacilityPromotionBuyGetEntity() => true,
      FacilityPromotionDiscountEntity() => false,
    };

    return TappableScale(
      onTap: isInteractive
          ? () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (sheetContext) => BlocProvider<PromotionDetailsCubit>(
                  create: (_) => getIt<PromotionDetailsCubit>(param1: promotion.id),
                  child: FacilityDataProvider.fromFacilityDataProvider(
                    facilityDataProvider: facilityData,
                    child: const PromotionDetailsBottomSheet(),
                  ),
                ),
              );
            }
          : null,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: ShapeDecoration(
          color: context.colors.backgroundWhite,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: context.colors.strokePrimary),
          ),
          shadows: context.shadows.sm,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: EdgeInsets.all(context.spacing.s16),
              child: Column(
                crossAxisAlignment: .start,
                spacing: context.spacing.s16,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          promotion.name,
                          style: context.typography.medium16.primary(context),
                        ),
                      ),
                      SizedBox(width: context.spacing.s12),
                      _ValueBadge(
                        text: promotion.trailingValueText,
                        backgroundColor: facilityData.activityLineBackground,
                        textColor: facilityData.activityLineColor,
                      ),
                    ],
                  ),
                  switch (promotion) {
                    final FacilityPromotionDiscountEntity discountPromotion => _DiscountPromotionBody(
                      promotion: discountPromotion,
                    ),
                    final FacilityPromotionPackageEntity packagePromotion => _PackagePromotionBody(
                      promotion: packagePromotion,
                    ),
                    final FacilityPromotionBuyGetEntity buyGetPromotion => _BuyGetPromotionBody(
                      promotion: buyGetPromotion,
                    ),
                  },
                ],
              ),
            ),
            Divider(color: context.colors.strokeSecondary, height: 0),
            Padding(
              padding: EdgeInsets.all(context.spacing.s16),
              child: _PromotionFooter(promotion: promotion),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiscountPromotionBody extends StatelessWidget {
  const _DiscountPromotionBody({required this.promotion});

  final FacilityPromotionDiscountEntity promotion;

  @override
  Widget build(BuildContext context) {
    return buildDiscountPromotionOfferContent(
      context,
      appliesOn: promotion.discountFor,
      accentColor: FacilityDataProvider.of(context).activityLineColor,
    );
  }
}

class _PackagePromotionBody extends StatelessWidget {
  const _PackagePromotionBody({required this.promotion});

  final FacilityPromotionPackageEntity promotion;

  @override
  Widget build(BuildContext context) {
    return buildPackagePromotionOfferContent(
      context,
      tickets: promotion.tickets,
      accentColor: FacilityDataProvider.of(context).activityLineColor,
    );
  }
}

class _BuyGetPromotionBody extends StatelessWidget {
  const _BuyGetPromotionBody({required this.promotion});

  final FacilityPromotionBuyGetEntity promotion;

  @override
  Widget build(BuildContext context) {
    return buildBuyGetPromotionOfferContent(
      context,
      buyTickets: promotion.buyTickets,
      reward: promotion.reward,
      accentColor: FacilityDataProvider.of(context).activityLineColor,
    );
  }
}

class _PromotionFooter extends StatelessWidget {
  const _PromotionFooter({required this.promotion});

  final FacilityPromotionEntity promotion;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);

    return Row(
      children: [
        Expanded(
          child: Row(
            spacing: context.spacing.s4,
            children: [
              Icon(
                SolarIconsOutline.calendar,
                size: 20,
                color: facilityData.activityLineColor,
              ),
              Expanded(
                child: Text(
                  AppDateUtils.formatDateFromContext(context, promotion.endDate),
                  style: context.typography.book13.secondary(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        if (promotion.hasRemainingInfo)
          Expanded(
            child: Row(
              spacing: context.spacing.s4,
              children: [
                Icon(
                  SolarIconsOutline.sale,
                  size: 22,
                  color: facilityData.activityLineColor,
                ),
                Text(
                  _buildRemainingText(context, promotion),
                  style: context.typography.book13.secondary(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        Icon(
          promotion.isLiked ? SolarIconsBold.heart : SolarIconsOutline.heart,
          color: promotion.isLiked ? facilityData.activityLineColor : context.colors.textDisabled,
          size: 20,
        ),
      ],
    );
  }
}

class _ValueBadge extends StatelessWidget {
  const _ValueBadge({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.typography.medium16.withColor(textColor),
    );
  }
}

String _buildRemainingText(BuildContext context, FacilityPromotionEntity promotion) {
  if (promotion.isRemainingUnlimited) {
    return context.l10n.facilityDetails_unlimited;
  }

  final remainingCount = promotion.remainingCountOrNull ?? 0;
  return '$remainingCount ${context.l10n.facilityDetails_remaining}';
}
