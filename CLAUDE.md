# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Flutter app (`coflow_users_v2`) using Clean Architecture with a feature-first layout. Project skills for the common workflows live in `.claude/skills/` (`feature-slice`, `coflow-ui`, `add-translations`) — use them.

## Commands

```bash
flutter pub get                                          # Install dependencies
dart run build_runner build --delete-conflicting-outputs # Codegen (freezed, json, injectable, auto_route, flutter_gen)
dart run build_runner watch --delete-conflicting-outputs # Codegen in watch mode
flutter gen-l10n                                         # Regenerate localizations after editing ARB files
flutter analyze                                          # Lint (flutter_lints)
flutter test                                             # Run all tests
flutter test test/features/facility/data/mappers/facility_promotion_mapper_test.dart  # Single test file
dart format .                                            # Format (page width 100, trailing commas preserved)
flutter run                                              # Run the app
```

Run build_runner after touching anything annotated with `@freezed`, `@JsonSerializable`, `@injectable`/`@lazySingleton`, or `@RoutePage`. Never hand-edit generated files: `*.g.dart`, `*.freezed.dart`, `*.gr.dart`, `injection.config.dart`, or anything under `lib/core/gen/`.

## Architecture

Clean Architecture, feature-first. Each feature under `lib/features/<feature>/` has three layers; shared infrastructure lives in `lib/core/`.

```
lib/features/<feature>/
├── domain/          # dtos/ entities/ repositories/ (interfaces) use_cases/
├── data/            # datasources/ models/ mappers/ repositories/ (implementations)
└── presentation/    # cubit/ screens or components/ widgets/
```

**Barrel files**: every directory has a same-named export barrel (`domain.dart`, `models.dart`, `use_cases.dart`, ...). When adding a file, add it to the folder's barrel. `lib/core/core.dart` exports all of core.

### Functional error handling (the load-bearing pattern)

- All async domain/data operations return `AsyncTask<T>` — an alias for fpdart's `TaskEither<Failure, T>` (`lib/core/async/types.dart`). Never raw `Future` for business logic.
- The `Failure` hierarchy (`lib/core/async/failure.dart`): `NetworkFailure`, `ServerFailure`, `ValidationFailure`, `AuthenticationFailure`, `AuthorizationFailure`, `NotFoundFailure`, `CacheFailure`, `UnknownFailure`.
- Remote datasources wrap Dio calls in `AsyncTaskExtension.tryCatchMapDioToFailure(...)`; cache/local operations use `AsyncTaskExtension.tryCatch(...)`.
- Repositories compose with `map`/`flatMap` (e.g. `_remote.getX(dto).map(XMapper.toEntity)`).

### Async state in the UI

Cubit states are `@freezed` classes holding `AsyncState<T>` fields (`idle`/`loading`/`success`/`error`). Each request gets its own `AsyncRequestManager` inside the cubit (wires state read/write + emit, supports `autoExecute`, `execute()`, `refresh()`, `reset()`). The UI consumes managers declaratively via `AsyncHandler<Cubit, State, Data>` (full builders) or `AsyncHandler.loadingDependent` (for buttons/overlays). See the `feature-slice` skill for complete templates — follow it whenever adding an endpoint or feature.

### Dependency injection

`injectable` + `get_it` (`lib/core/di/injection.dart`, global `getIt`). Conventions:
- Use cases & remote datasources: `@lazySingleton`
- Repository implementations: `@LazySingleton(as: XRepository)`
- Cubits: `@injectable`; runtime params via `@factoryParam`, resolved as `getIt<XCubit>(param1: ...)`
- Third-party/async registrations: `lib/core/di/register_module.dart`

### Routing

`auto_route`: screens are annotated `@RoutePage()` and registered in `lib/core/routing/app_router.dart` (default route type is Cupertino). Generated routes live in `app_router.gr.dart`. Navigate with `context.router.push(XRoute(...))`. Screen widgets typically create their `BlocProvider` and delegate layout to a `components/<x>_screen_body.dart`.

### Networking & caching

- `DioClient` (`lib/core/network/`) with auth + data-extractor interceptors; base URL and timeouts in `api_constants.dart` (currently the test API).
- Endpoint paths are defined per-datasource in a nested `abstract final class XEndpoints { static const ... }`.
- `CacheClient` (`lib/core/caching/`, Hive-based) supports `put(key, value, expiryDuration:)`, `get<T>`, `remove`, `clear`.
- `LocalizationCubit` persists via `HydratedBloc`; auth tokens via `AuthStateManager` (`lib/core/data/auth/`).

### Localization

Never hardcode user-facing strings. Add keys to `lib/core/l10n/translations/app_en.arb` (template) **and** `app_ar.arb`, run `flutter gen-l10n`, then use `context.l10n.key`. Helpers: `context.locale`, `context.isRTL`, `context.isArabic`, `context.isEnglish`. Untranslated keys are reported in `lib/core/l10n/untranslated.txt`. See the `add-translations` skill.

### Theming & UI

Never hardcode colors, text styles, spacing, or shadows — always use the `ThemeExtension`-backed context getters: `context.colors.*`, `context.typography.*` (naming: `weightSize`, e.g. `medium16`), `context.spacing.*` (4px grid), `context.shadows.*`. Feedback via `context.showSuccessSnackBar/showErrorSnackBar/showInfoSnackBar/showWarningSnackBar`. Core reusable widgets live in `lib/core/presentation/widgets/` (`MainButton`, `MainTextField`, `TappableScale`, `CircularButton`, `Shimmer`/`ShimmerBox`, ...). The full token catalog and widget guidance are in the `coflow-ui` skill — consult it before writing any UI.

Key UI rules:
- All rounded rectangles use `RoundedSuperellipseBorder` (built into the Flutter SDK) with `ShapeDecoration` — not `RoundedRectangleBorder` or `BoxDecoration` + `BorderRadius`.
- Icons: prefer `SolarIconsOutline.*` (`solar_icons` package); for design-specific icons, add the SVG to `assets/svgs/` and use `Assets.svgs.<name>.svg()` (flutter_gen, output in `lib/core/gen/`).
- Tappable surfaces use `TappableScale`, not ad-hoc `InkWell`/`GestureDetector`.

### Providing data down the tree

For static/rarely-changing data needed by many widgets, wrap with `InheritedProvider<T>` (from `provider`) directly — no custom `InheritedWidget` classes — and expose a context extension getter (e.g. `context.user`). For frequently-updating state use `BlocProvider`; for one-time data use constructor params.

## Language/SDK notes (post-training-cutoff conventions used here)

- Freezed v3: classes must be `abstract` or `sealed` (e.g. `@freezed abstract class XState with _$XState`). `.map`/`.when` are gone — use Dart `switch` pattern matching. Simple class-style (non-factory) freezed classes are allowed.
- `Column`/`Row` accept `spacing:` — use it instead of `SizedBox` gaps.
- `Color.withOpacity()` is deprecated — use `.withValues(alpha: ...)`.
- Prefer Dart dot-shorthands when the type is known: `mainAxisAlignment: .center`.

## Keeping instructions in sync

The detailed workflow guidance lives in the skills under `.claude/skills/` — keep those and this file consistent when a convention changes. `.github/instructions/*.md` holds an older equivalent set for GitHub Copilot; update it too only if Copilot is still in use.
