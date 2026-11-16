import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A price in [color] — the [reducedPrice] when there is one, followed by the
/// full [price] struck through.
class PriceText extends StatelessWidget {
  const PriceText({
    super.key,
    required this.currency,
    required this.price,
    this.reducedPrice,
    required this.color,
  });

  final String currency;
  final double price;
  final double? reducedPrice;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final reducedPrice = this.reducedPrice;
    final current = Text(
      (reducedPrice ?? price).priceText(currency),
      style: context.typography.medium14.withColor(color),
    );
    if (reducedPrice == null) return current;

    return Row(
      mainAxisSize: .min,
      crossAxisAlignment: .baseline,
      textBaseline: .alphabetic,
      spacing: context.spacing.s4,
      children: [
        current,
        Text(
          price.amountText,
          style: context.typography.book12
              .withColor(color)
              .copyWith(decoration: TextDecoration.lineThrough, decorationColor: color),
        ),
      ],
    );
  }
}
