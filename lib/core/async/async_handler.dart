import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
/// **Skeletons**: give a [skeletonBuilder] and it stands in while the request
/// is idle or loading, and whatever comes back fades in over it. Set [sliver]
/// when the builders return slivers.
///
/// ```dart
/// AsyncHandler<UsersCubit, UsersState, List<User>>(
///   requestManagerGetter: (cubit) => cubit.usersManager,
///   skeletonBuilder: (context) => const UsersSkeleton(),
///   successBuilder: (context, users) => UsersList(users: users),
/// )
/// ```
///
/// **Background refresh**: a manager with `refreshInBackground` keeps the
/// success UI up while it refreshes and when a refresh fails, and a rolled-back
/// optimistic update keeps it too; give [onBackgroundError] to say why the
/// data didn't change.
///
/// ```dart
/// AsyncHandler<UsersCubit, UsersState, List<User>>(
///   requestManagerGetter: (cubit) => cubit.usersManager,
///   skeletonBuilder: (context) => const UsersSkeleton(),
///   successBuilder: (context, users) => UsersList(users: users),
///   onBackgroundError: (context, failure) => context.showErrorSnackBar(failure.message),
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
    this.skeletonBuilder,
    this.sliver = false,
    required this.requestManagerGetter,
    required this.successBuilder,
    this.errorBuilder,
    this.onSuccess,
    this.onError,
    this.onBackgroundError,
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
       skeletonBuilder = null,
       sliver = false,
       successBuilder = _dummySuccessBuilder,
       errorBuilder = null,
       onBackgroundError = null,
       onRetry = null;

  final AsyncRequestManager<TWholeState, TPartialState> Function(C cubit) requestManagerGetter;

  final Widget Function(BuildContext)? initialBuilder;
  final Widget Function(BuildContext)? loadingBuilder;

  /// Placeholder for the idle and loading states, where [initialBuilder] and
  /// [loadingBuilder] aren't given — typically built from `Skeleton` bones in
  /// the content's own layout. With one, the success or error UI fades in
  /// over it rather than snapping in.
  final Widget Function(BuildContext)? skeletonBuilder;

  /// Whether the builders return slivers rather than boxes. Only changes how
  /// the fade after a [skeletonBuilder] is done.
  final bool sliver;

  final Widget Function(BuildContext, TPartialState) successBuilder;
  final Widget Function(BuildContext, Failure)? errorBuilder;

  /// Called when the async operation succeeds — including a background
  /// refresh landing, but not an optimistic edit to data already shown.
  /// Use for side effects like navigation or showing snackbars.
  final void Function(BuildContext, TPartialState)? onSuccess;

  /// Called when the async operation fails with no data to show.
  /// Use for side effects like showing error snackbars.
  final void Function(BuildContext, Failure)? onError;

  /// Called for a failure that left the data on screen: a failed background
  /// refresh (`refreshInBackground`), or an optimistic update that was rolled
  /// back. [errorBuilder] never sees these, so this is the place to say why
  /// the data didn't change — typically `context.showErrorSnackBar(...)`.
  final void Function(BuildContext, Failure)? onBackgroundError;

  /// Called when the user taps retry on the default error widget.
  /// If provided, the default error widget will show a retry button.
  final void Function(C cubit)? onRetry;

  // Loading-dependent mode fields
  final bool _isLoadingDependent;
  final Widget Function(BuildContext, bool)? _loadingDependentBuilder;

  // Dummy builder for loading-dependent mode (never actually called)
  static Widget _dummySuccessBuilder(BuildContext context, dynamic data) => const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    final requestManager = requestManagerGetter(cubit);

    return BlocConsumer<C, TWholeState>(
      listenWhen: (previous, current) => _shouldNotify(
        requestManager.getPartialStateFromWhole(previous),
        requestManager.getPartialStateFromWhole(current),
      ),
      listener: (context, state) => _handleListener(context, requestManager),
      buildWhen: (previous, current) =>
          requestManager.getPartialStateFromWhole(previous) !=
          requestManager.getPartialStateFromWhole(current),
      builder: (context, state) => _buildContent(context, cubit, requestManager),
    );
  }

  /// Whether going from [previous] to [current] is an outcome to report:
  /// a request that finished (with data or without), or a failure kept beside
  /// data. Starting a background refresh and optimistic edits to data already
  /// shown are not.
  static bool _shouldNotify<T>(AsyncState<T> previous, AsyncState<T> current) {
    if (previous == current) return false;
    return switch (current) {
      AsyncError() || AsyncSuccess(failure: _?) => true,
      AsyncSuccess(isRefreshing: true) => false,
      AsyncSuccess() => previous is! AsyncSuccess<T> || previous.isRefreshing,
      AsyncIdle() || AsyncLoading() => false,
    };
  }

  void _handleListener(
    BuildContext context,
    AsyncRequestManager<TWholeState, TPartialState> requestManager,
  ) {
    switch (requestManager.state) {
      case AsyncSuccess(:final failure?):
        onBackgroundError?.call(context, failure);
      case AsyncError(:final failure):
        onError?.call(context, failure);
      case AsyncSuccess<TPartialState>(:final data):
        onSuccess?.call(context, data);
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
    final content = switch (asyncState) {
      AsyncIdle() => _buildInitial(context),
      AsyncLoading() => _buildLoading(context),
      AsyncSuccess<TPartialState>(:final data) => successBuilder(context, data),
      AsyncError(:final failure) => _buildError(context, cubit, failure),
    };
    if (skeletonBuilder == null) return content;

    final phase = switch (asyncState) {
      AsyncIdle() || AsyncLoading() => _Phase.placeholder,
      AsyncSuccess() => _Phase.success,
      AsyncError() => _Phase.error,
    };
    return sliver
        ? _SliverPhaseFade(phase: phase, sliver: content)
        : _BoxPhaseFade(phase: phase, child: content);
  }

  Widget _buildInitial(BuildContext context) {
    return initialBuilder?.call(context) ??
        skeletonBuilder?.call(context) ??
        (sliver ? const SliverToBoxAdapter() : const SizedBox.shrink());
  }

  Widget _buildLoading(BuildContext context) {
    return loadingBuilder?.call(context) ??
        skeletonBuilder?.call(context) ??
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

/// What an [AsyncHandler] with a skeleton is showing.
enum _Phase { placeholder, success, error }

/// How long a result takes to fade in over its skeleton.
const Duration _fadeDuration = Duration(milliseconds: 300);

/// Cross-fades a box when its [phase] changes: the skeleton out as the result
/// comes in, both laid over each other from the top so neither jumps.
class _BoxPhaseFade extends StatelessWidget {
  const _BoxPhaseFade({required this.phase, required this.child});

  final _Phase phase;
  final Widget child;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
    duration: _fadeDuration,
    switchInCurve: Curves.easeOut,
    switchOutCurve: Curves.easeIn,
    layoutBuilder: (current, previous) => Stack(
      alignment: AlignmentDirectional.topStart,
      children: [...previous, ?current],
    ),
    child: KeyedSubtree(key: ValueKey(phase), child: child),
  );
}

/// Cross-fades a sliver when its [phase] changes from the skeleton to a
/// result: the skeleton fades out as the result fades in over it, stacked in
/// one place by a [SliverStack]. Going back to the skeleton — a refetch — is
/// instant.
class _SliverPhaseFade extends StatefulWidget {
  const _SliverPhaseFade({required this.phase, required this.sliver});

  final _Phase phase;
  final Widget sliver;

  @override
  State<_SliverPhaseFade> createState() => _SliverPhaseFadeState();
}

class _SliverPhaseFadeState extends State<_SliverPhaseFade> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _fadeDuration,
    value: 1,
  )..addStatusListener(_dropOutgoingWhenDone);
  late final Animation<double> _fadeIn = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );
  late final Animation<double> _fadeOut = ReverseAnimation(
    CurvedAnimation(parent: _controller, curve: Curves.easeIn),
  );

  /// The skeleton fading out, while it does.
  Widget? _outgoing;

  @override
  void didUpdateWidget(_SliverPhaseFade oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.phase == oldWidget.phase) return;
    if (oldWidget.phase == .placeholder) {
      _outgoing = oldWidget.sliver;
      _controller.forward(from: 0);
    } else {
      _outgoing = null;
      _controller.value = 1;
    }
  }

  void _dropOutgoingWhenDone(AnimationStatus status) {
    if (status.isCompleted && _outgoing != null) setState(() => _outgoing = null);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SliverStack(
    children: [
      if (_outgoing case final outgoing?)
        SliverFadeTransition(
          key: const ValueKey('outgoing'),
          opacity: _fadeOut,
          sliver: outgoing,
        ),
      // Keyed by phase so the result keeps its state when the skeleton
      // leaves the stack from under it.
      SliverFadeTransition(
        key: ValueKey(widget.phase),
        opacity: _fadeIn,
        sliver: widget.sliver,
      ),
    ],
  );
}
