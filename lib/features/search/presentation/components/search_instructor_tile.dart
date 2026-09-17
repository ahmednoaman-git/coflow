import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/domain.dart';
import 'search_highlighted_text.dart';

/// An instructor result: portrait, name and title on a white card.
///
/// Not tappable — there is no instructor screen yet. The design's stack of
/// facility avatars is left out for the same reason the tap is: the search
/// payload carries no facilities for an instructor.
class SearchInstructorTile extends StatelessWidget {
  const SearchInstructorTile({super.key, required this.instructor, required this.query});

  final SearchInstructorEntity instructor;
  final String query;

  @override
  Widget build(BuildContext context) {
    final subtitle = instructor.title ?? instructor.centerName;

    return Container(
      padding: EdgeInsets.all(context.spacing.s12),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: Row(
        spacing: context.spacing.s12,
        children: [
          ShimmerImage(
            imageUrl: instructor.imageUrl,
            width: 56,
            height: 56,
            borderRadius: 100,
            errorWidget: Icon(
              SolarIconsOutline.user,
              color: context.colors.textTertiary,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              spacing: context.spacing.s4,
              children: [
                SearchHighlightedText(
                  text: instructor.name,
                  query: query,
                  style: context.typography.medium16.primary(context),
                ),
                if (subtitle != null && subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: context.typography.book14.tertiary(context),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
