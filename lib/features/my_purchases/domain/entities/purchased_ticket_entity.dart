import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchased_ticket_entity.freezed.dart';

/// One ticket a purchase gave the user.
@freezed
abstract class PurchasedTicketEntity with _$PurchasedTicketEntity {
  const factory PurchasedTicketEntity({
    required int id,
    required String name,

    /// How many are **left** — the API's `quantity`, which counts down as
    /// tickets are used (verified 2026-11-16: bought 3, one collected →
    /// `quantity: 2, used: 1`). Null when [unlimited] (or not sent).
    int? quantity,

    /// How many have been reserved or used.
    @Default(0) int used,
    @Default(false) bool unlimited,

    /// How long the ticket lasts once bought, in days.
    int? validityDays,
    DateTime? expireDate,

    /// Whether the API flags this ticket itself as expired.
    @Default(false) bool isExpired,

    /// The services it gives access to.
    @Default(<String>[]) List<String> accessNames,
  }) = _PurchasedTicketEntity;

  const PurchasedTicketEntity._();

  /// How many were bought: what is left plus what was used. Null when
  /// [unlimited], or when the API sent no count.
  int? get bought => unlimited || quantity == null ? null : quantity! + used;

  /// One icon per ticket bought; an unlimited ticket draws one.
  int get iconCount => unlimited ? 1 : bought ?? used;

  /// How many of [iconCount] are used up (drawn red). An unlimited ticket's
  /// single icon stays available.
  int get usedIconCount => unlimited ? 0 : math.min(used, iconCount);

  /// Tickets still left to use; null when [unlimited].
  int? get remaining => unlimited ? null : math.max(quantity ?? 0, 0);

  /// Whether every ticket has been used.
  bool get isUsedUp => !unlimited && used > 0 && (quantity ?? 0) <= 0;

  /// Whether none of these tickets has been reserved yet.
  bool get isUntouched => used == 0;
}
