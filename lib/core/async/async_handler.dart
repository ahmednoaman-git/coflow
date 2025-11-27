import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that declaratively handles async state from an [AsyncRequestManager].
///
/// This widget provides two modes of operation:
///
/// **Standard Mode**: Handles all states (idle, loading, success, error) with
/// dedicated builders for each state.
///
/// ```dart
/// AsyncHandler<UsersCubit, UsersState, List<User>>(
///   requestManagerGetter: (cubit) => cubit.usersManager,
///   successBuilder: (context, users) => UsersList(users: users),
///   onRetry: (cubit) => cubit.usersManager.refresh(),
/// )
/// ```
///
/// **Loading-Dependent Mode**: Simplified API for UI that only needs to react
/// to the loading state (buttons, overlays, etc.).
///
/// ```dart
/// AsyncHandler<UsersCubit, UsersState, void>.loadingDependent(
///   requestManagerGetter: (cubit) => cubit.actionManager,
///   builder: (context, isLoading) => ElevatedButton(
///     onPressed: isLoading ? null : () => ...,
///     child: isLoading ? CircularProgressIndicator() : Text('Submit'),
///   ),
/// )
/// ```
class AsyncHandler<C extends Cubit<TWholeState>, TWholeState, TPartialState>
    extends StatelessWidget {
  const AsyncHandler({
    super.key,
    this.initialBuilder,
    this.loadingBuilder,
    required this.requestManagerGetter,
    required this.successBuilder,
    this.errorBuilder,
    this.onSuccess,
    this.onError,
    this.onRetry,
  }) : _isLoadingDependent = false,
       _loadingDependentBuilder = null;

  /// Factory constructor for loading-dependent UI that only needs to know loading state.
  ///
  /// Use this when you only need to show different UI based on loading state,
  /// while handling success/error states uniformly (e.g., via [onSuccess]/[onError] callbacks).
  ///
  /// The [builder] receives a boolean indicating whether the request is loading.
  const AsyncHandler.loadingDependent({
    super.key,
    required this.requestManagerGetter,
    required Widget Function(BuildContext context, bool isLoading) builder,
    this.onSuccess,
    this.onError,
  }) : _isLoadingDependent = true,
       _loadingDependentBuilder = builder,
       initialBuilder = null,
       loadingBuilder = null,
       successBuilder = _dummySuccessBuilder,
       errorBuilder = null,
       onRetry = null;

  final AsyncRequestManager<TWholeState, TPartialState> Function(C cubit)
  requestManagerGetter;

  final Widget Function(BuildContext)? initialBuilder;
  final Widget Function(BuildContext)? loadingBuilder;
  final Widget Function(BuildContext, TPartialState) successBuilder;
  final Widget Function(BuildContext, Failure)? errorBuilder;

  /// Called when the async operation succeeds.
  /// Use for side effects like navigation or showing snackbars.
  final void Function(BuildContext, TPartialState)? onSuccess;

  /// Called when the async operation fails.
  /// Use for side effects like showing error snackbars.
  final void Function(BuildContext, Failure)? onError;

  /// Called when the user taps retry on the default error widget.
  /// If provided, the default error widget will show a retry button.
  final void Function(C cubit)? onRetry;

  // Loading-dependent mode fields
  final bool _isLoadingDependent;
  final Widget Function(BuildContext, bool)? _loadingDependentBuilder;

  // Dummy builder for loading-dependent mode (never actually called)
  static Widget _dummySuccessBuilder(BuildContext context, dynamic data) =>
      const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    final requestManager = requestManagerGetter(cubit);

    return BlocConsumer<C, TWholeState>(
      listenWhen: (previous, current) =>
          requestManager.getPartialStateFromWhole(previous) !=
          requestManager.getPartialStateFromWhole(current),
      listener: (context, state) => _handleListener(context, requestManager),
      buildWhen: (previous, current) =>
          requestManager.getPartialStateFromWhole(previous) !=
          requestManager.getPartialStateFromWhole(current),
      builder: (context, state) =>
          _buildContent(context, cubit, requestManager),
    );
  }

  void _handleListener(
    BuildContext context,
    AsyncRequestManager<TWholeState, TPartialState> requestManager,
  ) {
    final asyncState = requestManager.state;

    switch (asyncState) {
      case AsyncSuccess<TPartialState>(:final data):
        onSuccess?.call(context, data);
      case AsyncError(:final failure):
        onError?.call(context, failure);
      case AsyncIdle():
      case AsyncLoading():
        // No action needed
        break;
    }
  }

  Widget _buildContent(
    BuildContext context,
    C cubit,
    AsyncRequestManager<TWholeState, TPartialState> requestManager,
  ) {
    final asyncState = requestManager.state;

    // If in loading-dependent mode, use the specialized builder
    if (_isLoadingDependent && _loadingDependentBuilder != null) {
      return _loadingDependentBuilder(context, asyncState.isLoading);
    }

    // Default behavior for standard mode
    return switch (asyncState) {
      AsyncIdle() => _buildInitial(context),
      AsyncLoading() => _buildLoading(context),
      AsyncSuccess<TPartialState>(:final data) => successBuilder(context, data),
      AsyncError(:final failure) => _buildError(context, cubit, failure),
    };
  }

  Widget _buildInitial(BuildContext context) {
    return initialBuilder?.call(context) ?? const SizedBox.shrink();
  }

  Widget _buildLoading(BuildContext context) {
    return loadingBuilder?.call(context) ??
        const Center(child: CircularProgressIndicator());
  }

  Widget _buildError(BuildContext context, C cubit, Failure failure) {
    if (errorBuilder != null) {
      return errorBuilder!(context, failure);
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: context.colors.energyCherryPrimary,
            ),
            SizedBox(height: context.spacing.s16),
            Text(
              context.l10n.somethingWentWrong,
              textAlign: TextAlign.center,
              style: context.typography.medium18.primary(context),
            ),
            SizedBox(height: context.spacing.s8),
            Text(
              failure.message,
              textAlign: TextAlign.center,
              style: context.typography.book14.secondary(context),
            ),
            if (onRetry != null) ...[
              SizedBox(height: context.spacing.s24),
              MainButton(
                text: context.l10n.retry,
                onPressed: () => onRetry!(cubit),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
