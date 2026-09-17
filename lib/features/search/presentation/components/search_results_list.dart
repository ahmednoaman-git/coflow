import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import 'search_message_view.dart';

/// One page of results, with the next page requested as the list nears its end.
class SearchResultsList<T> extends StatelessWidget {
  const SearchResultsList({
    super.key,
    required this.page,
    required this.itemBuilder,
    required this.onLoadMore,
  });

  final PaginatedEntity<T> page;
  final Widget Function(BuildContext context, T item) itemBuilder;

  /// Called as the list nears its end; the cubit ignores it when a page is
  /// already on its way.
  final VoidCallback onLoadMore;

  /// How close to the end of the list triggers the next page.
  static const double _loadMoreThreshold = 320.0;

  @override
  Widget build(BuildContext context) {
    if (page.isEmpty) {
      return SearchMessageView(
        icon: SolarIconsOutline.magnifier,
        message: context.l10n.search_noResults,
        hint: context.l10n.search_noResultsHint,
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.extentAfter < _loadMoreThreshold) onLoadMore();
        return false;
      },
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: context.spacing.s8,
          bottom: context.bottomInset + context.spacing.s24,
        ),
        keyboardDismissBehavior: .onDrag,
        itemCount: page.items.length + (page.hasMore ? 1 : 0),
        separatorBuilder: (context, index) => SizedBox(height: context.spacing.s12),
        itemBuilder: (context, index) {
          if (index >= page.items.length) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: context.spacing.s16),
              child: Center(
                child: SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.colors.earthSunnyGoldPrimary,
                  ),
                ),
              ),
            );
          }

          return itemBuilder(context, page.items[index]);
        },
      ),
    );
  }
}
