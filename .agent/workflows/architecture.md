---
description: Clean Architecture implementation patterns for Domain and Data layers
---

**IMPORTANT**: This app is a rewrite of an old app, often the workspace is opened with both projects. New project root is `coflow_users_v2`. Old project is `coflow_users_app`. Make sure you to edit code only in the new project, but sometimes the user may ask to refer to the old project for comparison and references.

# Clean Architecture Implementation Guide

This guide outlines the implementation patterns for the **Domain** and **Data** layers in the application, following Clean Architecture principles.

## 1. Domain Layer
The domain layer contains business logic and is independent of external frameworks.

### Directory Structure
```
domain/
├── dtos/           # Data Transfer Objects (input/output models)
├── entities/       # Core business entities
├── repositories/   # Repository interfaces (contracts)
└── use_cases/      # Business use cases
```

### DTOs & Entities
- Use `@freezed` for immutability and value equality.
- **DTOs**: For data transfer between layers (not networking)
- **Entities**: For business logic. Can include computed properties.

```dart
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String name,
  }) = _UserEntity;
}
```

### Repositories (Interfaces)
- Define contracts using `abstract interface class`.
- Return `AsyncTask<T>` (alias for `TaskEither<Failure, T>`) for async operations.
- Use Domain Entities, not DTOs.

```dart
abstract interface class AuthRepository {
  AsyncTask<UserEntity> login(LoginDto dto);
}
```

### Use Cases
- One use case per business operation.
- Inject repositories via constructor.
- Implement `call()` method.

```dart
@lazySingleton
class LoginUseCase {
  const LoginUseCase(this._repository);
  final AuthRepository _repository;

  AsyncTask<UserEntity> call(LoginDto dto) => _repository.login(dto);
}
```

## 2. Data Layer
The data layer implements the domain contracts and handles data access.

### Directory Structure
```
data/
├── datasources/    # Remote and local data sources
├── mappers/        # Convert models to entities
├── models/        # Data transfer models
└── repositories/   # Repository implementations
```

### Data Sources
- **Remote**: Handle API calls using `DioClient`.
  - Use `AsyncTaskExtension.tryCatchMapDioToFailure` to wrap API calls.
  - Return `AsyncTask<DTO>`.
  - Define feature-specific endpoints in a nested `abstract final class` (e.g., `AuthEndpoints`).
- **Local**: Handle persistence using `CacheClient` (Hive-based).
  - Use `AsyncTaskExtension.tryCatch` to wrap cache operations.
  - Return `AsyncTask<T>`.

#### Remote Data Source with Endpoints
Each remote data source should contain its own endpoints class:

```dart
/// Authentication API endpoints.
abstract final class AuthEndpoints {
  static const String login = 'login';
  static const String register = 'register';
  static const String sendOtp = 'sendCode';
}

@lazySingleton
class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<UserModel> login(LoginDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.post(AuthEndpoints.login, data: dto.toJson());
      return UserModel.fromJson(response.data);
    });
  }
}
```

### Cache Client Usage
The `CacheClient` provides a Hive-based caching layer with optional expiry support.

#### Basic Operations
```dart
@LazySingleton(as: MyLocalDataSource)
class MyLocalDataSourceImpl implements MyLocalDataSource {
  const MyLocalDataSourceImpl(this._cache);
  final CacheClient _cache;

  static const _myKey = 'my_key';

  @override
  AsyncTask<String?> getValue() {
    return AsyncTaskExtension.tryCatch(() async {
      return _cache.get<String>(_myKey);
    });
  }

  @override
  AsyncTask<void> saveValue(String value) {
    return AsyncTaskExtension.tryCatch(() async {
      await _cache.put(_myKey, value);
    });
  }

  @override
  AsyncTask<void> saveWithExpiry(String value) {
    return AsyncTaskExtension.tryCatch(() async {
      await _cache.put(_myKey, value, expiryDuration: const Duration(hours: 24));
    });
  }
}
```

#### Available Methods
- `put(key, value, {expiryDuration})` - Store a value with optional expiry
- `get<T>(key, {defaultValue})` - Retrieve a value (returns null if expired)
- `remove(key)` - Delete a specific key
- `clear()` - Clear all cached data
- `containsKey(key)` - Check if key exists
- `getAllKeys()` - List all stored keys

### Repository Implementations
- Implement domain repository interfaces.
- Orchestrate data sources and mappers.
- Use functional chaining (`flatMap`, `map`).

```dart
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteDS);
  final AuthRemoteDataSource _remoteDS;

  @override
  AsyncTask<UserEntity> login(LoginDto dto) {
    return _remoteDS.login(dto).map(AuthMapper.toEntity);
  }
}
```

## 3. Localization (L10n)
The app uses Flutter's official localization system with ARB files.

### Directory Structure
```
core/
├── l10n/
│   └── translations/
│       ├── app_en.arb    # English translations (template)
│       └── app_ar.arb    # Arabic translations
└── gen/
    └── l10n/
        └── app_localizations.dart  # Generated localization class
```

### Configuration
Localization is configured in `l10n.yaml`:
- **Template file**: `app_en.arb`
- **Output class**: `AppLocalizations`
- **Supported locales**: English (en), Arabic (ar)

### Adding New Translations
1. Add key-value pairs to `app_en.arb` (template file):
```json
{
  "welcomeMessage": "Welcome to InoPeople",
  "loginButton": "Login"
}
```

2. Add corresponding translations to `app_ar.arb`:
```json
{
  "welcomeMessage": "مرحباً بك في InoPeople",
  "loginButton": "تسجيل الدخول"
}
```

3. Run `flutter gen-l10n` to generate localization classes (or run the app).

### Usage in Code
**ALWAYS** use `context.l10n` to access localized strings:

```dart
// ✅ Correct
Text(context.l10n.welcomeMessage)
Text(context.l10n.loginButton)

// ❌ NEVER hardcode strings
Text('Welcome to InoPeople')
Text('Login')
```

### Localization Helpers
Use the `LocalizationExtension` on `BuildContext`:

```dart
context.l10n        // Access AppLocalizations instance
context.locale      // Get current locale (e.g., Locale('en'))
context.isRTL       // Check if current locale is RTL
context.isArabic    // Check if current locale is Arabic
context.isEnglish   // Check if current locale is English
```

### Dynamic Translations with Parameters
For strings with parameters, define them in ARB files:

```json
{
  "greetUser": "Hello, {name}!",
  "@greetUser": {
    "placeholders": {
      "name": {
        "type": "String"
      }
    }
  }
}
```

Usage:
```dart
Text(context.l10n.greetUser('John'))
```

### Localization State Management
The app uses `LocalizationCubit` to manage locale changes. It's provided at the root level in `main.dart` and persists the selected locale using `HydratedBloc`.

## 4. Providing Data Down the Widget Tree

When you need to provide data (like user data, configuration, etc.) to multiple widgets down the tree, use `InheritedProvider` from the `provider` package directly as a wrapper widget.

### Why InheritedProvider?
- Less boilerplate compared to manual `InheritedWidget`
- Automatic `updateShouldNotify` handling
- Type-safe access through `context.read<T>()`
- Integrates well with the provider package ecosystem
- No need to create custom classes - use it directly

### Example: Providing User Data

```dart
import 'package:provider/provider.dart';

// Simply use InheritedProvider directly as a wrapper widget
InheritedProvider<UserEntity>(
  create: (_) => userEntity,
  child: const MyApp(),
)

// For updating data, you can optionally add updateShouldNotify
InheritedProvider<UserEntity>(
  create: (_) => userEntity,
  updateShouldNotify: (previous, current) => previous != current,
  child: const MyApp(),
)
```

### Accessing Provided Data

Create context extensions for convenient access:

```dart
extension UserDataProviderExtension on BuildContext {
  /// Returns the current user (throws if not found)
  UserEntity get user => read<UserEntity>();

  /// Returns the current user or null if not available
  UserEntity? get maybeUser {
    try {
      return read<UserEntity>();
    } catch (_) {
      return null;
    }
  }
}

// Usage in widgets:
final user = context.user;
```

### When to Use InheritedProvider
- Providing static/rarely changing data (user info, theme config, feature flags)
- Data needed by many widgets across the tree
- Replacing manual `InheritedWidget` implementations

### When NOT to Use InheritedProvider
- For state management with frequent updates → Use `BlocProvider` or `ChangeNotifierProvider`
- For one-time data passing → Use constructor parameters
- For route-specific data → Use route arguments

## 5. General Rules
- **Functional Error Handling**: Always use `AsyncTask<T>` (`TaskEither`) for async operations.
- **Dependency Injection**: Use `injectable` for registration.
- **Immutability**: Prefer immutable data structures.
- **Localization**: NEVER hardcode user-facing strings. Always use `context.l10n.key`.
- **Data Provision**: Use `InheritedProvider` directly as a wrapper widget instead of creating custom classes or manual `InheritedWidget` implementations.
