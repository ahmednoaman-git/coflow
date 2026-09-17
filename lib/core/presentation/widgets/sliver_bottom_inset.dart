import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Trailing spacer that keeps the last sliver of a [CustomScrollView] clear of
/// the bottom nav bar — the sliver form of `context.bottomInset`.
///
/// Place it after the content but *before* any [SliverFillRemaining]: the
/// filler only takes up the slack a short page leaves over, so putting the
/// inset first means a short page spends that slack instead of growing an
/// extra screenful of scroll, while a long page is unaffected either way.
///
/// ```dart
/// CustomScrollView(
///   slivers: const [
///     FacilityHeader(),
///     FacilitySelectedTab(),
///     SliverBottomInset(),
///     SliverFillRemaining(),
///   ],
/// )
/// ```
class SliverBottomInset extends StatelessWidget {
  const SliverBottomInset({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: context.bottomInset));
  }
}
