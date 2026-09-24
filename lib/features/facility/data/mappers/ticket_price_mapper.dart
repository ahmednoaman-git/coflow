/// Reads what a ticket sells for out of the ticket payloads, the way the
/// checkout quote (`purchase-ticket/validate`) prices it.
abstract final class TicketPriceMapper {
  /// The price after any reduction, or null when the ticket sells at [price].
  ///
  /// - An active discount promotion (the ticket's `offer`, a percentage) comes
  ///   off the full [price] and replaces the ticket's own discount — the quote
  ///   charges it even where the discount price is lower.
  /// - Otherwise the ticket's own [discountPrice]. The API sends `0` for "no
  ///   discount", and [hasDiscount] when the payload carries the flag.
  static double? reducedPrice({
    required double price,
    double? discountPrice,
    bool? hasDiscount,
    double? offerPercent,
  }) {
    if (offerPercent != null && offerPercent > 0) {
      final offered = price * (100 - offerPercent) / 100;
      return offered < price ? offered : null;
    }

    if (hasDiscount == false || discountPrice == null) return null;
    return discountPrice > 0 && discountPrice < price ? discountPrice : null;
  }
}
