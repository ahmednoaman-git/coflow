import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/saved_profiles_screen_body.dart';
import 'cubit/cubit.dart';

/// The facilities the user has saved.
///
/// Pushed from the Account tab's Businesses counter, so it keeps the nav bar.
@RoutePage()
class SavedProfilesScreen extends StatelessWidget {
  const SavedProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (_) => getIt<SavedProfilesCubit>(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(title: context.l10n.savedProfiles_title, showBackButton: true),
          body: const _ResyncOnTabReturn(child: SavedProfilesScreenBody()),
        ),
      ),
    );
  }
}

/// Re-reads the list whenever the user comes back to this screen's tab.
///
/// The screen stays mounted on the Account tab's stack while the user saves
/// and unsaves facilities from another tab, so without this it would show the
/// list as it stood when they left.
class _ResyncOnTabReturn extends StatefulWidget {
  const _ResyncOnTabReturn({required this.child});

  final Widget child;

  @override
  State<_ResyncOnTabReturn> createState() => _ResyncOnTabReturnState();
}

class _ResyncOnTabReturnState extends State<_ResyncOnTabReturn> {
  TabsRouter? _tabsRouter;

  /// The tab this screen lives in — the active one when it was pushed.
  late int _ownIndex;
  late int _lastActiveIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final tabsRouter = context.tabsRouter;
    if (identical(tabsRouter, _tabsRouter)) return;

    _tabsRouter?.removeListener(_onTabsChanged);
    _tabsRouter = tabsRouter..addListener(_onTabsChanged);
    _ownIndex = _lastActiveIndex = tabsRouter.activeIndex;
  }

  void _onTabsChanged() {
    final activeIndex = _tabsRouter!.activeIndex;
    if (activeIndex == _lastActiveIndex) return;

    _lastActiveIndex = activeIndex;
    if (activeIndex == _ownIndex) context.read<SavedProfilesCubit>().resync();
  }

  @override
  void dispose() {
    _tabsRouter?.removeListener(_onTabsChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
