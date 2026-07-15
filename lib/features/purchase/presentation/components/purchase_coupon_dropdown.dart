import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// A bottom-sheet-based coupon selector, following this app's dropdown idiom
/// (see the register screen's nationality/country selector).
///
/// Presentational only: driven entirely by [coupons]/[selectedCoupon] and
/// reported back via [onSelect].
class PurchaseCouponDropdown extends StatelessWidget {
  const PurchaseCouponDropdown({
    super.key,
    required this.couponsState,
    required this.selectedCoupon,
    required this.onSelect,
    required this.onRetry,
  });

  final AsyncState<List<PurchaseCouponEntity>> couponsState;
  final PurchaseCouponEntity? selectedCoupon;
  final ValueChanged<PurchaseCouponEntity?> onSelect;
  final VoidCallback onRetry;

  Future<void> _openSelector(BuildContext context, List<PurchaseCouponEntity> coupons) async {
    final result = await showModalBottomSheet<_CouponPickResult>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colors.backgroundWhite,
      shape: RoundedSuperellipseBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(context.spacing.s24)),
      ),
      builder: (sheetContext) => _CouponSelectorSheet(
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

    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s8,
      children: [
        Text(
          context.l10n.purchase_couponLabel,
          style: context.typography.medium14.primary(context),
        ),
        GestureDetector(
          onTap: isLoading || coupons.isEmpty
              ? (couponsState.isError ? onRetry : null)
              : () => _openSelector(context, coupons),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing.s12,
              vertical: context.spacing.s12,
            ),
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
                  child: selectedCoupon != null
                      ? couponRichText(
                          context,
                          selectedCoupon!,
                          baseStyle: context.typography.medium12.primary(context),
                        )
                      : Text(
                          _placeholderLabel(context, coupons, isLoading),
                          style: context.typography.medium12.tertiary(context),
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
                      coupon: null,
                      isSelected: false,
                      isClearOption: true,
                      onTap: () => Navigator.of(context).pop(const _CouponPickCleared()),
                    );
                  }

                  final coupon = coupons[index - (hasClearOption ? 1 : 0)];
                  return _CouponTile(
                    coupon: coupon,
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
  const _CouponTile({
    required this.coupon,
    required this.isSelected,
    required this.onTap,
    this.isClearOption = false,
  });

  final PurchaseCouponEntity? coupon;
  final bool isSelected;
  final bool isClearOption;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing.s12,
            vertical: context.spacing.s12,
          ),
          decoration: ShapeDecoration(
            color: isSelected
                ? context.colors.signatureBlueSecondary
                : context.colors.backgroundTwo,
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
                child: isClearOption
                    ? Text(
                        context.l10n.purchase_noCoupon,
                        style: context.typography.medium14.primary(context),
                      )
                    : couponRichText(
                        context,
                        coupon!,
                        baseStyle: context.typography.medium14.primary(context),
                      ),
              ),
              if (isSelected)
                Icon(SolarIconsOutline.checkCircle, color: context.colors.signatureBlue, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

/// Renders a coupon as "name (percent%)" with the percentage emphasized.
Text couponRichText(
  BuildContext context,
  PurchaseCouponEntity coupon, {
  required TextStyle baseStyle,
}) {
  return Text.rich(
    TextSpan(
      style: baseStyle,
      children: [
        TextSpan(text: coupon.name),
        TextSpan(
          text: ' (${coupon.percentText})',
          style: TextStyle(fontWeight: FontWeight.bold, color: context.colors.signatureBlue),
        ),
      ],
    ),
    overflow: TextOverflow.ellipsis,
  );
}
