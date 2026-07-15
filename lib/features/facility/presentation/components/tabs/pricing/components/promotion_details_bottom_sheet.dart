import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../facility_data_provider.dart';
import 'promotion_display_utils.dart';

class PromotionDetailsBottomSheet extends StatelessWidget {
  const PromotionDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<
      PromotionDetailsCubit,
      PromotionDetailsState,
      FacilityPromotionDetailsEntity
    >(
      requestManagerGetter: (cubit) => cubit.detailsManager,
      loadingBuilder: (context) => const SizedBox(
        height: 220,
        child: Center(child: CircularProgressIndicator()),
      ),
      successBuilder: (context, promotionDetails) {
        return _PromotionDetailsContent(promotionDetails: promotionDetails);
      },
      onRetry: (cubit) => cubit.refresh(),
    );
  }
}

class _PromotionDetailsContent extends StatelessWidget {
  const _PromotionDetailsContent({required this.promotionDetails});

  final FacilityPromotionDetailsEntity promotionDetails;

  @override
  Widget build(BuildContext context) {
    final sections =
        [
          _PromotionPriceSection(promotionDetails: promotionDetails),
          _PromotionOfferSection(promotionDetails: promotionDetails),
          if (promotionDetails.hasDescription)
            _PromotionTextSection(
              title: context.l10n.facilityDetails_descriptionLabel,
              body: promotionDetails.description,
            ),
          _PromotionValidityAndActionSection(promotionDetails: promotionDetails),
        ].map(
          (section) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing.s24,
              vertical: context.spacing.s12,
            ),
            child: section,
          ),
        );

    final children = [
      Padding(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Center(
          child: Text(
            promotionDetails.title,
            textAlign: .center,
            style: context.typography.bold20.primary(context),
          ),
        ),
      ),
      ...sections,
    ];

    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: MediaQuery.viewPaddingOf(context).bottom),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) => Divider(
        thickness: index == 0 ? 2.5 : 1,
        height: 0,
        color: context.colors.strokeSecondary,
      ),
    );
  }
}

class _PromotionPriceSection extends StatelessWidget {
  const _PromotionPriceSection({required this.promotionDetails});

  final FacilityPromotionDetailsEntity promotionDetails;

  @override
  Widget build(BuildContext context) {
    final accentColor = FacilityDataProvider.of(context).activityLineColor;

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          spacing: context.spacing.s8,
          children: [
            Icon(
              SolarIconsOutline.banknote,
              size: 24,
              color: context.colors.textPrimary,
            ),
            Text(
              context.l10n.facilityDetails_promotionPrice,
              style: context.typography.medium14.primary(context),
            ),
          ],
        ),
        Expanded(
          child: Text(
            promotionDetails.priceText,
            textAlign: .end,
            style: context.typography.medium14.withColor(accentColor),
          ),
        ),
      ],
    );
  }
}

class _PromotionOfferSection extends StatelessWidget {
  const _PromotionOfferSection({required this.promotionDetails});

  final FacilityPromotionDetailsEntity promotionDetails;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);

    return Column(
      spacing: context.spacing.s12,
      crossAxisAlignment: .start,
      children: [
        Text(
          context.l10n.facilityDetails_offer,
          style: context.typography.bold16.primary(context),
        ),
        switch (promotionDetails.promotion) {
          FacilityPromotionPackageEntity(:final tickets) => buildPackagePromotionOfferContent(
            context,
            tickets: tickets,
            accentColor: facilityData.activityLineColor,
          ),
          FacilityPromotionBuyGetEntity(:final buyTickets, :final reward) =>
            buildBuyGetPromotionOfferContent(
              context,
              buyTickets: buyTickets,
              reward: reward,
              accentColor: facilityData.activityLineColor,
            ),
          FacilityPromotionDiscountEntity(:final discountFor) => buildDiscountPromotionOfferContent(
            context,
            appliesOn: discountFor,
            accentColor: facilityData.activityLineColor,
          ),
        },
      ],
    );
  }
}

class _PromotionTextSection extends StatelessWidget {
  const _PromotionTextSection({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.s12,
      crossAxisAlignment: .start,
      children: [
        Text(
          title,
          style: context.typography.bold16.primary(context),
        ),
        Text(
          body,
          style: context.typography.book14.secondary(context),
        ),
      ],
    );
  }
}

class _PromotionValidityAndActionSection extends StatelessWidget {
  const _PromotionValidityAndActionSection({required this.promotionDetails});

  final FacilityPromotionDetailsEntity promotionDetails;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);
    final accentColor = facilityData.activityLineColor;

    return Column(
      spacing: context.spacing.s24,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              context.l10n.facilityDetails_validity,
              style: context.typography.medium14.primary(context),
            ),
            Text(
              promotionDetails.validityText(context.l10n),
              style: context.typography.medium14.withColor(accentColor),
            ),
          ],
        ),
        MainButton(
          height: 56,
          backgroundColor: accentColor,
          text: _resolveActionText(context, facilityData),
          onPressed: () {
            final router = context.router;

            Navigator.pop(context);

            router.push(
              PromotionPurchaseRoute(
                promotion: promotionDetails,
                facility: facilityData.facility,
                accentColor: accentColor,
              ),
            );
          },
        ),
      ],
    );
  }

  String _resolveActionText(BuildContext context, FacilityDataProvider facilityData) {
    return switch (facilityData.facility.paymentType) {
      PaymentType.directPurchase ||
      PaymentType.none => context.l10n.facilityDetails_contactFacility(
        facilityData.facility.name,
      ),
      PaymentType.fullOnline ||
      PaymentType.depositOnline => context.l10n.facilityDetails_purchaseNow,
    };
  }
}
