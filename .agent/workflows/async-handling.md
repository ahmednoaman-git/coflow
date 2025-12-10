---
description: Async handling and state management using AsyncState, AsyncRequestManager, and AsyncHandler
---
# Async Handling & State Management

This guide explains how to handle asynchronous operations using `AsyncState`, `AsyncRequestManager`, and `AsyncHandler`.

## Core Concepts

### 1. AsyncState<T>
A sealed class representing the lifecycle of an operation:
- `AsyncState.idle()` - Initial state, no operation started
- `AsyncState.loading()` - Operation in progress
- `AsyncState.success(T data)` - Operation completed successfully
- `AsyncState.error(Failure failure)` - Operation failed

### 2. AsyncTask<T>
Typedef for `TaskEither<Failure, T>`. Use this for all async repository/use-case methods.

### 3. Failure Types
Rich failure hierarchy for granular error handling:
- `NetworkFailure` - Connection, timeout, no internet
- `ServerFailure` - Server-side errors (5xx)
- `ValidationFailure` - Client-side validation (400, 422)
- `AuthenticationFailure` - Unauthorized (401)
- `AuthorizationFailure` - Forbidden (403)
- `NotFoundFailure` - Resource not found (404)
- `CacheFailure` - Cache-related errors
- `UnknownFailure` - Unexpected errors

## Implementation Steps

### 1. Cubit Setup
Define state with `AsyncState` fields and use `AsyncRequestManager` to manage them.

```dart
@freezed
abstract class UsersState with _$UsersState {
  const factory UsersState({
    @Default(AsyncState.idle()) AsyncState<List<User>> usersRequest,
  }) = _UsersState;
}

@injectable
class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._repo) : super(const UsersState());
  final UserRepository _repo;

  late final usersManager = AsyncRequestManager<UsersState, List<User>>(
    accessor: (
      getPartialState: (state) => state.usersRequest,
      getWholeState: () => state,
      setWholeState: (state, partial) => state.copyWith(usersRequest: partial),
    ),
    emit: emit,
    autoExecute: true, // Optional: Auto-run on init
    defaultRequest: _repo.getUsers(),
  );

  Future<void> refresh() => usersManager.refresh();
}
```

### 2. UI Implementation
Use `AsyncHandler` to declaratively handle states.

#### Standard Mode
Handles all states (Idle, Loading, Success, Error) with dedicated builders.

```dart
AsyncHandler<UsersCubit, UsersState, List<User>>(
  requestManagerGetter: (cubit) => cubit.usersManager,
  successBuilder: (context, users) => UsersList(users: users),
  // Optional: Custom builders
  loadingBuilder: (context) => const CustomLoader(),
  errorBuilder: (context, failure) => CustomError(failure: failure),
  // Optional: Retry callback (shows retry button in default error widget)
  onRetry: (cubit) => cubit.usersManager.refresh(),
  // Optional: Side effects
  onSuccess: (context, users) => print('Loaded ${users.length} users'),
  onError: (context, failure) => context.showErrorSnackBar(failure.message),
)
```

#### Loading-Dependent Mode
Use when you only need to react to the loading state (e.g., buttons, overlays).

```dart
AsyncHandler<UsersCubit, UsersState, void>.loadingDependent(
  requestManagerGetter: (cubit) => cubit.actionManager,
  builder: (context, isLoading) {
    return MainButton(
      text: context.l10n.submit,
      isLoading: isLoading,
      onPressed: isLoading ? null : () => context.read<UsersCubit>().doAction(),
    );
  },
  // Optional: Side effects for success/error
  onSuccess: (context, _) => context.router.push(const NextRoute()),
  onError: (context, failure) => context.showErrorSnackBar(failure.message),
)
```

## AsyncRequestManager API

### Properties
- `state` - Current `AsyncState<T>`
- `isLoading`, `isSuccess`, `isError`, `isIdle` - State checks
- `data` - Returns data if success, null otherwise
- `failure` - Returns failure if error, null otherwise
- `canRefresh` - Whether refresh is available

### Methods
- `execute([AsyncTask<T>? request])` - Execute an async operation
- `refresh()` - Re-execute the last request (requires previous execution)
- `reset()` - Reset state to idle

## Best Practices

1. **Always use `TaskEither`**: Avoid raw `Future`s for business logic.

2. **One Manager per Request**: Isolate async states using separate `AsyncRequestManager`s.
   ```dart
   late final usersManager = AsyncRequestManager<State, List<User>>(...);
   late final deleteManager = AsyncRequestManager<State, void>(...);
   ```

3. **Side Effects**: Use `onSuccess` and `onError` callbacks for navigation or snackbars.

4. **Refresh**: Use `manager.refresh()` for pull-to-refresh functionality.

5. **Retry**: Provide `onRetry` callback to enable retry button in error state.

6. **Loading Buttons**: Use `AsyncHandler.loadingDependent` with `MainButton.isLoading`.

## Example: Complete Flow

```dart
// cubit
@injectable
class TenantInputCubit extends Cubit<TenantInputState> {
  TenantInputCubit(this._getTenantDataUseCase) : super(const TenantInputState());
  final GetTenantDataUseCase _getTenantDataUseCase;

  late final submitManager = AsyncRequestManager<TenantInputState, TenantDataEntity>(
    accessor: (
      getPartialState: (state) => state.submitRequest,
      getWholeState: () => state,
      setWholeState: (state, partial) => state.copyWith(submitRequest: partial),
    ),
    emit: emit,
  );

  void submit(String tenantId) {
    submitManager.execute(_getTenantDataUseCase(tenantId));
  }
}

// UI
AsyncHandler<TenantInputCubit, TenantInputState, TenantDataEntity>.loadingDependent(
  requestManagerGetter: (cubit) => cubit.submitManager,
  builder: (context, isLoading) => MainButton(
    text: context.l10n.submit,
    isLoading: isLoading,
    onPressed: () => context.read<TenantInputCubit>().submit(tenantId),
  ),
  onSuccess: (context, tenant) => context.router.push(LoginRoute(tenant: tenant)),
  onError: (context, failure) => context.showErrorSnackBar(failure.message),
)
```
