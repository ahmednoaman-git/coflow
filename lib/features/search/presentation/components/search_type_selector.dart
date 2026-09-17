import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

/// Business / Instructor / Service switch, each segment badged with how many
/// results that tab holds. The count is omitted until its request lands.
class SearchTypeSelector extends StatelessWidget {
  const SearchTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
    required this.countFor,
  });

  final SearchType selectedType;
  final ValueChanged<SearchType> onTypeSelected;
  final int? Function(SearchType type) countFor;

  @override
  Widget build(BuildContext context) {
    return EzSlidingSelector<SearchType>(
      segments: [
        for (final type in SearchType.values)
          EzSlidingSegment(
            value: type,
            label: _labelFor(context, type).toUpperCase(),
          ),
      ],
      selectedValue: selectedType,
      onValueChanged: onTypeSelected,
      trackColor: context.colors.backgroundGreyTwo,
      thumbColor: context.colors.backgroundWhite,
      selectedTextStyle: context.typography.bold13.primary(context),
      unselectedTextStyle: context.typography.medium13.tertiary(context),
      padding: 4.0,
    );
  }

  String _labelFor(BuildContext context, SearchType type) {
    final l10n = context.l10n;
    final name = switch (type) {
      SearchType.business => l10n.search_tabBusiness,
      SearchType.instructor => l10n.search_tabInstructor,
      SearchType.service => l10n.search_tabService,
    };

    final count = countFor(type);
    return count == null ? name : l10n.search_tabLabel(name, count);
  }
}
