import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/authentication/data/mappers/auth_mapper.dart';
import 'package:coflow_users_v2/features/authentication/data/models/models.dart';
import 'package:coflow_users_v2/features/authentication/domain/entities/entities.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// Helper class for providing user data throughout the app using
/// [InheritedProvider] from the provider package.
///
/// Usage:
/// ```dart
/// InheritedProvider<UserEntity>(
///   create: (_) => user,
///   child: const MyApp(),
/// )
/// ```
///
/// Access user data via:
/// ```dart
/// final user = context.user;
/// ```
abstract final class UserDataProvider {
  /// Creates a [UserEntity] from the cached user data in [AuthStateManager].
  ///
  /// Returns null if no user data is cached.
  static UserEntity? fromAuthStateManager(AuthStateManager authStateManager) {
    final userData = authStateManager.userData;
    if (userData == null) return null;

    try {
      final userModel = UserModel.fromJson(userData);
      return AuthMapper.toUserEntity(userModel);
    } catch (_) {
      return null;
    }
  }
}

/// Extension on [BuildContext] for convenient access to user data.
extension UserDataProviderExtension on BuildContext {
  /// Returns the current authenticated user.
  ///
  /// Throws if no [InheritedProvider<UserEntity>] is found in the widget tree.
  UserEntity get user => read<UserEntity>();

  /// Returns the current authenticated user, or null if not available.
  UserEntity? get maybeUser {
    try {
      return read<UserEntity>();
    } catch (_) {
      return null;
    }
  }
}
