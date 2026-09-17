import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:coflow_users_v2/features/purchase/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'purchase_coupon_dropdown.dart';
import 'purchase_info_row.dart';
import 'purchase_invoice_section.dart';
import 'purchase_submit_button.dart';
import 'quantity_selector.dart';
import 'ticket_card.dart';

class PromotionPurchaseScreenBody extends StatelessWidget {
  const PromotionPurchaseScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromotionPurchaseCubit, PromotionPurchaseState>(
      builder: (context, state) {
        final cubit = context.read<PromotionPurchaseCubit>();

        return AsyncHandler<
          PromotionPurchaseCubit,
          PromotionPurchaseState,
          PurchaseReceiptEntity
        >.loadingDependent(
          requestManagerGetter: (cubit) => cubit.submitManager,
          onSuccess: (context, receipt) {
            context.showSuccessSnackBar(context.l10n.purchase_success);
            context.router.pop<bool>(true);
          },
          onError: (context, failure) => context.showErrorSnackBar(failure.message),
          builder: (context, isSubmitting) => PopScope(
            canPop: !isSubmitting,
            child: AbsorbPointer(
              absorbing: isSubmitting,
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  context.spacing.s16,
                  context.spacing.s16,
                  context.spacing.s16,
                  context.bottomInset + context.spacing.s16,
                ),
                child: _PromotionPurchaseCard(state: state, cubit: cubit),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PromotionPurchaseCard extends StatelessWidget {
  const _PromotionPurchaseCard({required this.state, required this.cubit});

  final PromotionPurchaseState state;
  final PromotionPurchaseCubit cubit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final accent = state.accentColor;
    final promotionDetails = state.promotion;
    var isFirstDivider = true;

    Widget divider() {
      final thickness = isFirstDivider ? 2.5 : 1.0;
      isFirstDivider = false;
      return Divider(height: 1, thickness: thickness, color: context.colors.strokeSecondary);
    }

    return TicketCard(
      topChildren: [
        _section(
          context,
          Text(
            promotionDetails.title,
            textAlign: .center,
            style: context.typography.bold20.primary(context),
          ),
        ),
        divider(),
        _section(
          context,
          PurchaseInfoRow(
            label: l10n.facilityDetails_promotionPrice,
            value: promotionDetails.priceText,
            accentColor: accent,
            icon: Assets.svgs.cash.svg(
              width: 24,
              height: 24,
              colorFilter: context.colors.textPrimary.colorFilter,
            ),
          ),
        ),
        divider(),
        _section(
          context,
          PurchaseInfoRow(
            label: l10n.facilityDetails_validity,
            value: promotionDetails.validityText(l10n),
            accentColor: accent,
          ),
        ),
        divider(),
        _section(
          context,
          PurchaseCouponDropdown(
            couponsState: state.couponsRequest,
            selectedCoupon: state.selectedCoupon,
            onSelect: cubit.selectCoupon,
            onRetry: cubit.refreshCoupons,
          ),
        ),
        divider(),
        _section(
          context,
          QuantitySelector(
            quantity: state.quantity,
            accentColor: accent,
            onIncrement: cubit.incrementQuantity,
            onDecrement: state.quantity > 1 ? cubit.decrementQuantity : null,
          ),
        ),
      ],
      bottomChildren: [
        _section(
          context,
          AsyncHandler<PromotionPurchaseCubit, PromotionPurchaseState, PurchaseQuoteEntity>(
            requestManagerGetter: (cubit) => cubit.quoteManager,
            onRetry: (cubit) => cubit.refreshQuote(),
            successBuilder: (context, quote) => PurchaseInvoiceSection(
              invoice: PurchaseInvoiceCalculator.fromQuote(
                quote: quote,
                currency: state.currency,
                itemLabel: promotionDetails.title,
                addOnsLabel: l10n.facilityDetails_addOns,
                quantity: state.quantity,
              ),
              accentColor: accent,
            ),
          ),
        ),
        _section(
          context,
          PurchaseSubmitButton(
            accentColor: accent,
            isLoading: cubit.submitManager.isLoading,
            onPressed: cubit.quoteManager.isSuccess && !cubit.inputsLocked ? cubit.submit : null,
          ),
        ),
      ],
    );
  }

  Widget _section(BuildContext context, Widget child) => Padding(
    padding: EdgeInsets.symmetric(horizontal: context.spacing.s16, vertical: context.spacing.s16),
    child: child,
  );
}
