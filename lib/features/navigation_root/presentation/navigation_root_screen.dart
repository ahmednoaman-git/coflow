import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/authentication/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_data_provider.dart';

/// The root screen for authenticated users.
///
/// This screen wraps all child routes with [InheritedProvider] to make
/// user data available throughout the authenticated portion of the app.
@RoutePage()
class NavigationRootScreen extends StatelessWidget {
  const NavigationRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authStateManager = getIt<AuthStateManager>();
    final user = UserDataProvider.fromAuthStateManager(authStateManager);

    return InheritedProvider<UserEntity>(
      // It is guaranteed that user is not null here since this screen
      // is only accessible to authenticated users.
      create: (_) => user!,
      child: const AutoRouter(),
    );
  }
}
