import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/purchase/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../cubit/cubit.dart';
import 'cancel_purchase_dialog.dart';
import 'purchase_sheet_sections.dart';
import 'purchase_style.dart';
import 'purchase_ticket_icons.dart';

/// Opens the detail sheet for [purchase] — on [ticket] when the card tapped
/// stands for one — over the nav bar.
///
/// Resolves true when the purchase was cancelled from the sheet, so the list
/// can re-read itself.
Future<bool?> showUserPurchaseSheet(
  BuildContext context, {
  required UserPurchaseEntity purchase,
  PurchasedTicketEntity? ticket,
  required UserPurchaseCategory category,
  required UserPurchasePeriod period,
}) {
  // The sheet mounts on the root navigator; the facility opens in this tab.
  final tabRouter = context.router;

  return showMainBottomSheet<bool>(
    context: context,
    builder: (_) => BlocProvider(
      create: (_) => getIt<UserPurchaseDetailsCubit>(param1: purchase),
      child: UserPurchaseSheet(
        ticketId: ticket?.id,
        category: category,
        period: period,
        onOpenFacility: (facility) => tabRouter.push(
          FacilityDetailsRoute(facility: facility, isPreview: purchase.isFacilityPreview),
        ),
      ),
    ),
  );
}

/// One purchase's details: the tickets left, what they give access to, the
/// promotion, the invoice — sections shown only when the row has the data —
/// then the facility and, while allowed, Cancel Purchase.
class UserPurchaseSheet extends StatelessWidget {
  const UserPurchaseSheet({
    super.key,
    required this.ticketId,
    required this.category,
    required this.period,
    required this.onOpenFacility,
  });

  /// The ticket the card stood for; null for a coupon or a row without tickets.
  final int? ticketId;
  final UserPurchaseCategory category;
  final UserPurchasePeriod period;
  final void Function(CollapsedFacilityEntity facility) onOpenFacility;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPurchaseDetailsCubit, UserPurchaseDetailsState>(
      buildWhen: (previous, current) => previous.purchaseRequest != current.purchaseRequest,
      builder: (context, state) {
        final purchase = state.purchaseRequest.dataOrNull;
        if (purchase == null) return const SizedBox.shrink();

        final ticket = purchase.tickets.where((ticket) => ticket.id == ticketId).firstOrNull;

        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.9),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              Flexible(
                child: _SheetContent(
                  purchase: purchase,
                  ticket: ticket,
                  category: category,
                  period: period,
                ),
              ),
              _SheetActions(
                purchase: purchase,
                category: category,
                onOpenFacility: onOpenFacility,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SheetContent extends StatelessWidget {
  const _SheetContent({
    required this.purchase,
    required this.ticket,
    required this.category,
    required this.period,
  });

  final UserPurchaseEntity purchase;
  final PurchasedTicketEntity? ticket;
  final UserPurchaseCategory category;
  final UserPurchasePeriod period;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final accent = category.accent(context);
    final ticket = this.ticket;
    final coupon = purchase.coupon;
    final isCurrent = period == UserPurchasePeriod.current;
    final validityDays = purchase.validityDaysOf(ticket);
    final sourcePromotion = purchase.sourcePurchase?.promotion;
    final appliedPurchase = purchase.appliedPurchase;
    final promotion = purchase.promotion;

    final sections = <Widget>[
      // Validity matters while it can still be used.
      if (isCurrent && validityDays != null && !(ticket?.isUsedUp ?? false))
        PurchaseValidityRow(days: validityDays, accent: accent),
      if (purchase.status.isExpired && ticket != null)
        PurchaseEventSection(
          title: l10n.myPurchases_expired,
          date: ticket.expireDate ?? purchase.expireDate,
          ticket: ticket,
          accent: accent,
        ),
      if (purchase.status == PurchaseStatus.refunded)
        PurchaseEventSection(
          title: l10n.myPurchases_refunded,
          date: purchase.refundedAt,
          ticket: ticket,
          accent: accent,
        ),
      if (purchase.isGift && !isCurrent && coupon == null)
        PurchaseEventSection(
          title: l10n.myPurchases_gift,
          date: purchase.createdAt,
          accent: accent,
        ),
      if (ticket != null && ticket.accessNames.isNotEmpty)
        PurchaseChipsSection(
          title: l10n.myPurchases_access,
          labels: ticket.accessNames,
          accent: accent,
        ),
      if (coupon != null && coupon.hasScope)
        PurchaseChipsSection(
          title: l10n.myPurchases_appliesOn,
          labels: coupon.appliesToAll ? [_allLabel(context, coupon.scope)] : coupon.targetNames,
          accent: accent,
        ),
      if (purchase.addOns.isNotEmpty) PurchaseAddOnsSection(addOns: purchase.addOns),
      if (promotion != null && purchase.kind.isPromotion)
        PurchasePromotionSection(
          title: l10n.myPurchases_promotionInformation,
          promotion: promotion,
          accent: accent,
        ),
      if (sourcePromotion != null)
        PurchasePromotionSection(
          title: l10n.myPurchases_fromPromotion,
          promotion: sourcePromotion,
          date: purchase.sourcePurchase?.createdAt,
          accent: accent,
        ),
      // A gift cost nothing: only what it was applied to has an invoice.
      if (!purchase.isGift)
        PurchaseInvoiceBlock(purchase: purchase, invoice: _invoice(context, purchase))
      else if (appliedPurchase != null)
        PurchaseInvoiceBlock(
          purchase: appliedPurchase,
          invoice: _invoice(context, appliedPurchase),
          titleSuffix: l10n.myPurchases_appliedIn,
        ),
    ];

    final header = Padding(
      padding: EdgeInsets.all(context.spacing.s24),
      child: Column(
        spacing: context.spacing.s12,
        children: [
          Text(
            _title(ticket, coupon),
            style: context.typography.bold20.primary(context),
            textAlign: .center,
          ),
          // Without the row's tickets there is nothing to count (brief F2).
          if (ticket != null)
            PurchaseTicketIcons(
              ticket: ticket,
              color: accent,
              usedColor: category.usedAccent(context),
            )
          else if (coupon != null)
            PurchaseSingleTicketIcon(color: accent),
        ],
      ),
    );

    final children = [
      header,
      for (final section in sections)
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing.s24,
            vertical: context.spacing.s24,
          ),
          child: section,
        ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) => Divider(
        thickness: index == 0 ? 3 : 1,
        height: index == 0 ? 3 : 1,
        color: context.colors.strokePrimary,
      ),
    );
  }

  String _title(PurchasedTicketEntity? ticket, GiftCouponEntity? coupon) {
    if (ticket != null) return ticket.name;
    if (coupon != null) return couponPercentLabel(coupon);
    return purchase.name;
  }

  static String _allLabel(BuildContext context, CouponScope scope) {
    final l10n = context.l10n;
    return switch (scope) {
      CouponScope.tickets => l10n.facilityDetails_promotionAppliedOnAllTickets,
      CouponScope.promotions => l10n.facilityDetails_promotionAppliedOnAllPromotions,
      CouponScope.purchases ||
      CouponScope.unknown => l10n.facilityDetails_promotionAppliedOnAllPurchases,
    };
  }

  static PurchaseInvoiceEntity _invoice(BuildContext context, UserPurchaseEntity purchase) =>
      UserPurchaseInvoice.of(
        purchase,
        addOnLabel: context.l10n.purchase_addOnLine,
        addOnsLabel: context.l10n.purchase_addOnsPrice,
      );
}

/// The facility's button and, while the purchase can still be cancelled,
/// Cancel Purchase beside it.
class _SheetActions extends StatelessWidget {
  const _SheetActions({
    required this.purchase,
    required this.category,
    required this.onOpenFacility,
  });

  final UserPurchaseEntity purchase;
  final UserPurchaseCategory category;
  final void Function(CollapsedFacilityEntity facility) onOpenFacility;

  @override
  Widget build(BuildContext context) {
    final facility = purchase.facility;
    final canCancel = category == UserPurchaseCategory.purchases && purchase.canCancel;

    return Container(
      padding: EdgeInsets.fromLTRB(
        context.spacing.s24,
        context.spacing.s16,
        context.spacing.s24,
        context.spacing.s16 + MediaQuery.viewPaddingOf(context).bottom,
      ),
      decoration: BoxDecoration(
        color: context.colors.backgroundWhite,
        border: Border(top: BorderSide(color: context.colors.strokePrimary)),
      ),
      child: Row(
        spacing: context.spacing.s16,
        children: [
          Expanded(
            child: MainButton(
              height: 56,
              text: purchase.facilityName,
              backgroundColor: category.accent(context),
              isDisabled: facility == null,
              onPressed: facility == null
                  ? null
                  : () {
                      Navigator.of(context).pop();
                      onOpenFacility(facility);
                    },
            ),
          ),
          if (canCancel) Expanded(child: _CancelButton(purchase: purchase)),
        ],
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({required this.purchase});

  final UserPurchaseEntity purchase;

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<UserPurchaseDetailsCubit, UserPurchaseDetailsState, void>.loadingDependent(
      requestManagerGetter: (cubit) => cubit.cancelManager,
      builder: (context, isLoading) => MainButton(
        height: 56,
        text: context.l10n.myPurchases_cancelPurchase,
        backgroundColor: context.colors.energyCherryPrimary,
        isLoading: isLoading,
        onPressed: isLoading ? null : () => _confirmAndCancel(context),
      ),
      onSuccess: (context, _) {
        context.showSuccessSnackBar(context.l10n.myPurchases_cancelled);
        Navigator.of(context).pop(true);
      },
      // Until the backend implements it (brief F1), this is where it ends.
      onError: (context, failure) => context.showErrorSnackBar(failure.message),
    );
  }

  Future<void> _confirmAndCancel(BuildContext context) async {
    final cubit = context.read<UserPurchaseDetailsCubit>();
    final confirmed = await CancelPurchaseDialog.show(
      context,
      purchaseName: purchase.tickets.firstOrNull?.name ?? purchase.name,
    );
    if (confirmed ?? false) await cubit.cancel();
  }
}
