import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/domain.dart';
import 'components/user_purchases_screen_body.dart';
import 'cubit/cubit.dart';

/// Account › Purchases or Account › Gifts, by [category].
///
/// Pushed from the Account tab's counters, so it keeps the nav bar.
@RoutePage()
class UserPurchasesScreen extends StatelessWidget {
  const UserPurchasesScreen({super.key, required this.category});

  final UserPurchaseCategory category;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (_) => getIt<UserPurchasesCubit>(param1: category),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(
            title: switch (category) {
              UserPurchaseCategory.purchases => l10n.account_purchases,
              UserPurchaseCategory.gifts => l10n.account_gifts,
            },
            showBackButton: true,
          ),
          body: const UserPurchasesScreenBody(),
        ),
      ),
    );
  }
}
