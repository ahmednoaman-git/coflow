import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter/material.dart';

/// Checkbox list of ticket add-ons.
class PurchaseAddOnsSelector extends StatelessWidget {
  const PurchaseAddOnsSelector({
    super.key,
    required this.addOns,
    required this.selectedIds,
    required this.currency,
    required this.accentColor,
    required this.onToggle,
  });

  final List<AddOnEntity> addOns;
  final Set<int> selectedIds;
  final String currency;
  final Color accentColor;
  final ValueChanged<int> onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s12,
      children: [
        Text(
          context.l10n.facilityDetails_addOns,
          style: context.typography.medium14.primary(context),
        ),
        for (final addOn in addOns)
          _AddOnRow(
            addOn: addOn,
            isSelected: selectedIds.contains(addOn.id),
            currency: currency,
            accentColor: accentColor,
            onTap: () => onToggle(addOn.id),
          ),
      ],
    );
  }
}

class _AddOnRow extends StatelessWidget {
  const _AddOnRow({
    required this.addOn,
    required this.isSelected,
    required this.currency,
    required this.accentColor,
    required this.onTap,
  });

  final AddOnEntity addOn;
  final bool isSelected;
  final String currency;
  final Color accentColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: ShapeDecoration(
              color: isSelected ? accentColor : Colors.transparent,
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: isSelected ? accentColor : context.colors.strokeSecondary,
                  width: 1.5,
                ),
              ),
            ),
            child: isSelected ? Icon(Icons.check, size: 16, color: context.colors.textWhite) : null,
          ),
          SizedBox(width: context.spacing.s12),
          Expanded(
            child: Text(
              addOn.name,
              style: context.typography.book14.primary(context),
            ),
          ),
          Text(
            '$currency ${addOn.price}',
            style: context.typography.medium14.withColor(accentColor),
          ),
        ],
      ),
    );
  }
}
