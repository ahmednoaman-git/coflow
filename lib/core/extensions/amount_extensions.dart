/// Display formatting for prices and other money amounts.
extension AmountText on num {
  /// The amount as the design writes it: whole amounts drop their decimals
  /// (`1000`), anything else keeps at most two places (`12.5`, `499.99`).
  String get amountText {
    final rounded = toStringAsFixed(2);
    if (!rounded.contains('.')) return rounded;

    return rounded.replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
  }

  /// `EGP 1000` — the amount after its currency, or the bare amount when the
  /// currency is blank.
  String priceText(String currency) {
    final trimmed = currency.trim();
    return trimmed.isEmpty ? amountText : '$trimmed $amountText';
  }
}
