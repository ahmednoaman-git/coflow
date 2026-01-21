import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

/// Displays tags in a single row, showing "+N" for overflow.
class TagChipSingleRowWithOverflow extends StatelessWidget {
  const TagChipSingleRowWithOverflow({
    super.key,
    required this.tags,
    required this.activityLine,
  });

  final List<TagEntity> tags;
  final ActivityLineEntity activityLine;

  static const _overflowChipWidth = 60.0;
  static const _spacing = 8.0;
  static const _minChipWidth = 40.0;
  static const _chipHorizontalPadding = 12.0;
  static const _chipVerticalPadding = 4.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final List<Widget> visibleChips = [];
        double currentWidth = 0;
        int hiddenCount = 0;
        final availableWidth = constraints.maxWidth - _overflowChipWidth;

        for (int i = 0; i < tags.length; i++) {
          final chipWidth = _getChipWidth(context, tags[i]);

          if (currentWidth + chipWidth > availableWidth) {
            hiddenCount = tags.length - i;
            if (availableWidth - currentWidth < _minChipWidth) break;
            continue;
          }

          visibleChips.add(
            Padding(
              padding: const EdgeInsets.only(right: _spacing),
              child: _TagChip(
                title: tags[i].name.capitalize(),
                activityLine: activityLine,
              ),
            ),
          );
          currentWidth += chipWidth + _spacing;
        }

        if (hiddenCount > 0) {
          visibleChips.add(
            _TagChip(
              title: '+$hiddenCount',
              activityLine: activityLine,
            ),
          );
        }

        return Row(children: visibleChips);
      },
    );
  }

  double _getChipWidth(BuildContext context, TagEntity tag) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: tag.name.capitalize(),
        style: context.typography.book10,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.width + (_chipHorizontalPadding * 2);
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({
    required this.title,
    required this.activityLine,
  });

  final String title;
  final ActivityLineEntity activityLine;

  @override
  Widget build(BuildContext context) {
    final (primaryColor, secondaryColor) = activityLine.getColors(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TagChipSingleRowWithOverflow._chipHorizontalPadding,
        vertical: TagChipSingleRowWithOverflow._chipVerticalPadding,
      ),
      decoration: ShapeDecoration(
        color: secondaryColor,
        shape: const StadiumBorder(),
      ),
      child: Text(
        title,
        style: context.typography.book10.copyWith(
          color: primaryColor.withValues(alpha: 0.75),
        ),
      ),
    );
  }
}

extension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
