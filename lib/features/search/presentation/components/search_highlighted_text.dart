import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Result title with the matched part of the query emphasised, the way the
/// design calls out why a row matched.
class SearchHighlightedText extends StatelessWidget {
  const SearchHighlightedText({
    super.key,
    required this.text,
    required this.query,
    required this.style,
    this.highlightStyle,
    this.maxLines = 1,
  });

  final String text;
  final String query;
  final TextStyle style;
  final TextStyle? highlightStyle;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final matchStart = query.isEmpty ? -1 : text.toLowerCase().indexOf(query.toLowerCase());
    final highlight = highlightStyle ?? style.withWeight(FontWeight.w700);

    if (matchStart < 0) {
      return Text(text, style: style, maxLines: maxLines, overflow: .ellipsis);
    }

    final matchEnd = matchStart + query.length;

    return Text.rich(
      TextSpan(
        children: [
          if (matchStart > 0) TextSpan(text: text.substring(0, matchStart)),
          TextSpan(text: text.substring(matchStart, matchEnd), style: highlight),
          if (matchEnd < text.length) TextSpan(text: text.substring(matchEnd)),
        ],
      ),
      style: style,
      maxLines: maxLines,
      overflow: .ellipsis,
    );
  }
}
