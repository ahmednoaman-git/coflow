import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/domain.dart';

/// The colours each list draws in: Purchases in sunny gold, Gifts in
/// caribbean — the same identities as their counters on the Account screen.
extension UserPurchaseCategoryStyle on UserPurchaseCategory {
  /// Counts, chips, available tickets and the sheet's buttons.
  Color accent(BuildContext context) => switch (this) {
    UserPurchaseCategory.purchases => context.colors.earthSunnyGoldPrimary,
    UserPurchaseCategory.gifts => context.colors.seaCaribbeanPrimary,
  };

  /// Tickets already used.
  Color usedAccent(BuildContext context) => switch (this) {
    UserPurchaseCategory.purchases => context.colors.energyCherryPrimary,
    UserPurchaseCategory.gifts => context.colors.textTertiary,
  };
}

/// Dates as the design writes them: `12/12/2023` on cards, `2023-10-21` in the
/// detail sheets.
abstract final class PurchaseDateFormat {
  static String card(BuildContext context, DateTime date) =>
      DateFormat('dd/MM/yyyy', context.locale.toString()).format(date);

  static String sheet(BuildContext context, DateTime date) =>
      DateFormat('yyyy-MM-dd', context.locale.toString()).format(date);
}

/// How many tickets were bought, for a card: `12x`, or `∞` when unlimited.
/// Null when the API didn't say.
String? purchaseTicketCountLabel(PurchasedTicketEntity ticket) {
  if (ticket.unlimited) return '∞';
  final bought = ticket.bought;
  return bought == null ? null : '${bought}x';
}

/// A gifted coupon's name: its discount, e.g. `10%`.
String couponPercentLabel(GiftCouponEntity coupon) => '${coupon.discountRatio.amountText}%';
