import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A +/- quantity stepper rendered as a single pill with 3 joined sections:
/// minus | count | plus.
class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.accentColor,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final Color accentColor;
  final VoidCallback onIncrement;
  final VoidCallback? onDecrement;

  static const double _segmentWidth = 40;
  static const double _height = 36;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          context.l10n.purchase_quantity,
          style: context.typography.medium14.primary(context),
        ),
        Container(
          height: _height,
          decoration: ShapeDecoration(
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(_height / 3),
              side: BorderSide(color: context.colors.strokePrimary),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisSize: .min,
            children: [
              _StepperSegment(
                icon: Icons.remove,
                accentColor: accentColor,
                onTap: onDecrement,
              ),
              Container(
                width: _segmentWidth,
                height: _height,
                color: context.colors.backgroundWhite,
                alignment: Alignment.center,
                child: Text(
                  '$quantity',
                  style: context.typography.bold16.primary(context),
                ),
              ),
              _StepperSegment(
                icon: Icons.add,
                accentColor: accentColor,
                onTap: onIncrement,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StepperSegment extends StatelessWidget {
  const _StepperSegment({required this.icon, required this.accentColor, required this.onTap});

  final IconData icon;
  final Color accentColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return TappableScale(
      onTap: onTap,
      borderRadius: BorderRadius.zero,
      child: Container(
        width: QuantitySelector._segmentWidth,
        height: QuantitySelector._height,
        color: isDisabled ? accentColor.withValues(alpha: 0.4) : accentColor,
        alignment: Alignment.center,
        child: Icon(icon, size: 18, color: context.colors.textWhite),
      ),
    );
  }
}
