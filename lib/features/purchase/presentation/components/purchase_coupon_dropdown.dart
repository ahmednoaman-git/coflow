import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// A bottom-sheet-based coupon selector, following this app's dropdown idiom
/// (see the register screen's nationality/country selector).
///
/// Presentational only: driven entirely by [couponsState]/[selectedCoupon] and
/// reported back via [onSelect].
class PurchaseCouponDropdown extends StatelessWidget {
  const PurchaseCouponDropdown({
    super.key,
    required this.couponsState,
    required this.selectedCoupon,
    required this.onSelect,
    required this.onRetry,
    this.isRejected = false,
  });

  final AsyncState<List<PurchaseCouponEntity>> couponsState;
  final PurchaseCouponEntity? selectedCoupon;
  final ValueChanged<PurchaseCouponEntity?> onSelect;
  final VoidCallback onRetry;

  /// Whether the checkout just dropped a coupon the quote refused.
  final bool isRejected;

  Future<void> _openSelector(BuildContext context, List<PurchaseCouponEntity> coupons) async {
    final result = await showMainBottomSheet<_CouponPickResult>(
      context: context,
      useSafeArea: true,
      builder: (_) => _CouponSelectorSheet(
        coupons: coupons,
        selectedCoupon: selectedCoupon,
      ),
    );

    switch (result) {
      case _CouponPickCleared():
        onSelect(null);
      case _CouponPickSelected(:final coupon):
        onSelect(coupon);
      case null:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final coupons = couponsState.dataOrNull ?? const <PurchaseCouponEntity>[];
    final isLoading = couponsState.isLoading;
    final selectedCoupon = this.selectedCoupon;

    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s8,
      children: [
        Text(
          context.l10n.purchase_couponLabel,
          style: context.typography.medium14.primary(context),
        ),
        TappableScale(
          onTap: isLoading || coupons.isEmpty
              ? (couponsState.isError ? onRetry : null)
              : () => _openSelector(context, coupons),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(context.spacing.s12),
            decoration: ShapeDecoration(
              color: context.colors.backgroundTwo,
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: context.colors.strokePrimary),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedCoupon != null
                        ? purchaseCouponLabel(context, selectedCoupon)
                        : _placeholderLabel(context, coupons, isLoading),
                    overflow: TextOverflow.ellipsis,
                    style: selectedCoupon != null
                        ? context.typography.medium12.primary(context)
                        : context.typography.medium12.tertiary(context),
                  ),
                ),
                Icon(
                  SolarIconsOutline.altArrowDown,
                  color: context.colors.textTertiary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (isRejected)
          Text(
            context.l10n.purchase_couponRejected,
            style: context.typography.book12.error(context),
          ),
      ],
    );
  }

  String _placeholderLabel(
    BuildContext context,
    List<PurchaseCouponEntity> coupons,
    bool isLoading,
  ) {
    if (isLoading) {
      return context.l10n.purchase_loadingCoupons;
    }
    return context.l10n.purchase_selectCoupon(coupons.length);
  }
}

sealed class _CouponPickResult {
  const _CouponPickResult();
}

class _CouponPickCleared extends _CouponPickResult {
  const _CouponPickCleared();
}

class _CouponPickSelected extends _CouponPickResult {
  const _CouponPickSelected(this.coupon);

  final PurchaseCouponEntity coupon;
}

class _CouponSelectorSheet extends StatelessWidget {
  const _CouponSelectorSheet({required this.coupons, required this.selectedCoupon});

  final List<PurchaseCouponEntity> coupons;
  final PurchaseCouponEntity? selectedCoupon;

  @override
  Widget build(BuildContext context) {
    final hasClearOption = selectedCoupon != null;
    final itemCount = coupons.length + (hasClearOption ? 1 : 0);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: context.spacing.s16),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              margin: EdgeInsets.only(top: context.spacing.s12),
              width: 40,
              height: 4,
              decoration: ShapeDecoration(
                color: context.colors.strokeSecondary,
                shape: const StadiumBorder(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(context.spacing.s16),
              child: Text(
                context.l10n.purchase_couponLabel,
                style: context.typography.bold18.primary(context),
              ),
            ),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
                itemCount: itemCount,
                separatorBuilder: (context, index) => SizedBox(height: context.spacing.s12),
                itemBuilder: (context, index) {
                  if (hasClearOption && index == 0) {
                    return _CouponTile(
                      label: context.l10n.purchase_noCoupon,
                      isSelected: false,
                      onTap: () => Navigator.of(context).pop(const _CouponPickCleared()),
                    );
                  }

                  final coupon = coupons[index - (hasClearOption ? 1 : 0)];
                  return _CouponTile(
                    label: purchaseCouponLabel(context, coupon),
                    isSelected: selectedCoupon?.id == coupon.id,
                    onTap: () => Navigator.of(context).pop(_CouponPickSelected(coupon)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CouponTile extends StatelessWidget {
  const _CouponTile({required this.label, required this.isSelected, required this.onTap});

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(context.spacing.s12),
        decoration: ShapeDecoration(
          color: isSelected ? context.colors.signatureBlueSecondary : context.colors.backgroundTwo,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSelected ? context.colors.signatureBlue : context.colors.strokePrimary,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(label, style: context.typography.medium14.primary(context)),
            ),
            if (isSelected)
              Icon(SolarIconsOutline.checkCircle, color: context.colors.signatureBlue, size: 20),
          ],
        ),
      ),
    );
  }
}

/// A coupon as the design words it: `10% Discount (All Promotions)`, or the
/// tickets/promotions it is limited to.
String purchaseCouponLabel(BuildContext context, PurchaseCouponEntity coupon) {
  final l10n = context.l10n;
  final tickets = coupon.coversAllTickets
      ? [l10n.facilityDetails_promotionAppliedOnAllTickets]
      : coupon.tickets.map(
          (ticket) =>
              ticket.name.isEmpty ? l10n.facilityDetails_promotionAppliedOnTickets : ticket.name,
        );
  final promotions = coupon.coversAllPromotions
      ? [l10n.facilityDetails_promotionAppliedOnAllPromotions]
      : coupon.promotions.map(
          (promotion) => promotion.name.isEmpty
              ? l10n.facilityDetails_promotionAppliedOnPromotions
              : promotion.name,
        );
  final scope = coupon.coversAllTickets && coupon.coversAllPromotions
      ? l10n.facilityDetails_promotionAppliedOnAllPurchases
      : {...tickets, ...promotions}.join(', ');

  return l10n.purchase_couponOption(coupon.percentText, scope);
}
