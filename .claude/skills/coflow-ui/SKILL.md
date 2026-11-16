---
name: coflow-ui
description: Theme system and UI conventions for coflow_users_v2 — semantic colors, typography tokens, spacing, shadows, skeleton loading placeholders, core widgets (MainButton, TappableScale, CircularButton), icons, and superellipse shapes. Use before building or styling ANY widget, screen, or visual component in the app.
---

# Coflow UI & Theme System

Custom `ThemeExtension`-based design system. **Never** hardcode colors (`Colors.red`, `Color(0xFF...)`), text styles, spacing, or shadows — always the `context` getters below (they adapt to light/dark mode). Import via `package:coflow_users_v2/core/core.dart`.

## Colors — `context.colors`

```
Brand:      signatureBlue #181935 · signatureBlueSecondary #D6D7EF
Text:       textPrimary #19182A · textSecondary #434253 · textTertiary #6E6E81
            textDisabled #AFB0C1 · textWhite #FFFFFF
Identity    skyBluePrimary #5BC5F2 / skyBlueSecondary #D6F1FC          (info)
(primary/   seaCaribbeanPrimary #00BA88 / seaCaribbeanSecondary #BFEEE0 (success)
container   earthSunnyGoldPrimary #FFCE20 / earthSunnyGoldSecondary #FFF5CC (warning, main accent)
pairs):     energyCherryPrimary #FF636E / energyCherrySecondary #FFD8DA (error)
            ladiesOnlyPrimary #FF8DD4 / ladiesOnlySecondary #FFE3F5
Background: backgroundOne #F7F7F7 · backgroundTwo #FAFAFA · backgroundGrey #F5F5F6
            backgroundGreyTwo #E9E9EB · backgroundWhite #FFFFFF
Stroke:     strokePrimary #F0F0F0 (light borders) · strokeSecondary #E4E4E4 (stronger)
            strokeRed · strokeBlue · strokeGreen · strokeOrange (tinted, use *Secondary tones)
```

## Typography — `context.typography`

Circular Std font; token naming is `weightSize` matching Figma: `book*` = w400 (10,11,12,13,14,16,18,20,36), `medium*` = w500 (11,12,13,14,16,18,20,24), `bold*` = w700 (13,14,16,18,20,24). Most common: `book14` body, `medium16` emphasis, `bold24` headings.

Semantic color modifiers chain onto styles:

```dart
context.typography.book14.primary(context)     // textPrimary; also .secondary .tertiary .disabled .inverse
context.typography.bold16.error(context)       // energyCherry; also .success .warning .info
context.typography.bold18.brand(context)       // signatureBlue; also .gold .skyBlue .seaCaribbean .cherry .ladiesOnly
```

For one-off tweaks prefer the helpers in `lib/core/extensions/text_style_extensions.dart` over `copyWith`:

```dart
context.typography.medium14.withColor(context.colors.signatureBlue)
context.typography.book13.withWeight(FontWeight.w700)
```

## Spacing & shadows

- `context.spacing.*` — 4px grid: `s4 s8 s12 s16 s24 s32 s48 s64 s96 s128`; use for all padding/gaps.
- `Column`/`Row` take `spacing:` — use it instead of `SizedBox` separators.
- `context.shadows.*` — `xs sm md lg xl xxl`; shadows go transparent in dark mode, so **always pair a shadow with a `strokePrimary` border side** for dark-mode visibility.

## Shapes: superellipse everywhere

All rounded rectangles use SDK-built-in `RoundedSuperellipseBorder` + `ShapeDecoration` — never `RoundedRectangleBorder` or `BoxDecoration` with `borderRadius`:

```dart
Container(
  decoration: ShapeDecoration(
    color: context.colors.backgroundWhite,
    shape: RoundedSuperellipseBorder(
      borderRadius: BorderRadius.circular(context.spacing.s8),
      side: BorderSide(color: context.colors.strokePrimary),
    ),
    shadows: context.shadows.md,
  ),
)
```

## Modals: always on the root navigator

**Never call `showModalBottomSheet` directly — use `showMainBottomSheet` (`main_bottom_sheet.dart`).**

The authenticated shell (`NavigationRootScreen`) is a `Scaffold` whose body is an `AutoTabsRouter`, so every screen inside a tab lives under a *nested* navigator confined to that body — and a `Scaffold` paints its `bottomNavigationBar` over the body. `showModalBottomSheet` defaults `useRootNavigator` to `false`, so a sheet opened from a tab renders **behind the nav bar**, with the bar still lit and tappable above the sheet's own scrim. `showMainBottomSheet` pins `useRootNavigator: true` so the sheet covers the whole shell.

```dart
showMainBottomSheet<void>(context: context, builder: (_) => const SomeSheet());
```

Defaults: `isScrollControlled: true`, `backgroundWhite`, superellipse top radius `s24`. Pass `backgroundColor: Colors.transparent` when the sheet paints its own container (see `SessionDetailsBottomSheet`).

`showDialog` already defaults to the root navigator — it needs no wrapper, but never pass `useRootNavigator: false` to it.

**Consequence — capture dependencies before opening.** A root-navigator modal is built outside the tab's widget tree and inherits none of its providers, so `context.read<XCubit>()` / `XProvider.of(context)` *inside* the builder will throw. Read them before the call and re-provide inside:

```dart
final cubit = context.read<HomeCubit>();
final facilityData = FacilityDataProvider.of(context);

showMainBottomSheet<void>(
  context: context,
  builder: (_) => BlocProvider.value(
    value: cubit,
    child: FacilityDataProvider.fromFacilityDataProvider(
      facilityDataProvider: facilityData,
      child: const SomeSheet(),
    ),
  ),
);
```

## The bottom nav bar must never cover content

The shell `Scaffold` sets `extendBody: true`, so every screen paints full height and the bar floats over it — content is *meant* to scroll under it, it just must not come to rest under it.

**Reserve the space with `context.bottomInset`** (`layout_extensions.dart`). It is `MediaQuery.padding.bottom`, which Flutter republishes as the bar's height for everything inside the shell, and falls back to the system gesture inset on a route pushed on the root router — so the same screen is correct in both places. Never read `CoflowBottomNavBar`'s own constants outside the bar.

Spend it as **trailing padding**, never by shrinking the viewport (no `SafeArea` around a scroll view — that stops content scrolling under the bar and clips the scroll extent):

```dart
SingleChildScrollView(
  padding: EdgeInsets.only(bottom: context.bottomInset + context.spacing.s24),
  ...
)
```

A `CustomScrollView` uses **`SliverBottomInset`** instead, placed after the content and before any `SliverFillRemaining`:

```dart
CustomScrollView(
  slivers: const [FacilityHeader(), FacilitySelectedTab(), SliverBottomInset(), SliverFillRemaining()],
)
```

Anything pinned to the bottom of a screen (bars, floating buttons) offsets by `context.bottomInset` the same way.

## Core widgets (`lib/core/presentation/widgets/`)

- **`TappableScale`** — wrap ANY tappable surface (tiles, chips, rows, tab buttons): consistent press-scale animation, ink, superellipse. Avoid ad-hoc `InkWell`/`GestureDetector`.
- **`CircularButton`** — circular icon-only actions (header controls). `CircularButton.standardSize` (44) unless a design calls for another.
- **`MainBackButton`** — the only back control: an optically centred chevron in a standard `CircularButton`, flipping in RTL. Use it as an `AppBar`'s `leading` (wrapped in `Center`) and in overlay headers; never Flutter's `BackButton` or a default `AppBar` arrow. Style per surface with `backgroundColor`/`iconColor` (transparent + white on coloured bars, translucent dark over photos).
- **`MainButton`** — primary button: `text`, `onPressed`, `isLoading`, `isDisabled`, `leadingIcon`/`trailingIcon`, defaults to 40px height / full width. Pair `isLoading` with `AsyncHandler.loadingDependent`.
- **`showMainBottomSheet`** — the only sanctioned way to open a bottom sheet (see "Modals" above).
- **`LogoRefreshIndicator`** — the only pull-to-refresh; never `RefreshIndicator`. Drop-in (`onRefresh`, `child`): the content itself pulls down and the logo draws itself in the gap, then loops (rings spin opposite ways, sheen, pulse) while refreshing. The child must be sliver-based — a `CustomScrollView` with the content in a `SliverToBoxAdapter` — never a `SingleChildScrollView`, which snaps out of the pull when it re-lays out (rejected in debug). Leave its physics at `AlwaysScrollableScrollPhysics()`; pass `edgeOffset` when the scroll view runs behind an app bar (Home).
- **`SliverBottomInset`** — trailing sliver that keeps a `CustomScrollView` clear of the nav bar (see above).
- **`MainTextField`**, **`MainBackButton`**, **`MainAnimatedSwitcher`**, **`EzSegmentedControl`**, **`EzFileUpload`**, **`ShimmerImage`**, **`LocationButton`** / **`LocationSelectorBottomSheet`** — check `widgets/` before building something new.

## Skeleton loading placeholders (`widgets/skeleton/`)

New loading UI uses the skeleton system. Build the placeholder from the **real layout** — the same paddings, gaps, surfaces and shared size constants as the content — with bones where data goes, so nothing moves when the content fades in.

- **`Skeleton`** — put ONE at the root of each placeholder. Every skeleton shares one clock and bones sweep in screen space, so separate placeholders on a screen (tag row, list, "load more" footer) sweep as one band. Off under reduced motion.
- Bones: **`SkeletonText(style:, widthFactor:/width:, lines:)`** takes exactly the line height of `style` (measured, text-scale aware) — use the real typography token. **`SkeletonBox`** (images, icons, blocks), **`SkeletonCircle`** (avatars, logos), **`SkeletonChip(style:, labelWidth:, padding:)`** (tags, filters). `tone: .strong` for bones drawn on top of another bone (e.g. a caption over a placeholder cover).
- Share the real widget's surface/dimensions instead of copying them: e.g. `FacilityCardSurface` + `FacilityCard.logoSize`, `BusinessCard.width/height/radius`. Put `XSkeleton` next to `X`.
- Wire it with **`AsyncHandler(skeletonBuilder: ...)`** — shown while idle/loading, and the result cross-fades in over it. Set `sliver: true` when the builders return slivers (it cross-fades via `SliverStack`). For "load more" footers, `loadingBuilder` with a few card skeletons under the list.
- Content that isn't behind an `AsyncHandler` (e.g. a row filled from another request): **`SkeletonSwitcher(loading:, skeleton:, child:)`**.
- Only the part that waits on data should be a skeleton; static parts of the screen (titles, filters, chips) render immediately.
- Section/list failures: **`InlineAsyncError(failure:, onRetry:)`** rather than the full-screen default.

```dart
AsyncHandler<HomeCubit, HomeState, HomeEntity>(
  requestManagerGetter: (cubit) => cubit.homeManager,
  skeletonBuilder: (_) => const Skeleton(child: _BusinessesRow(itemCount: 3, itemBuilder: ...BusinessCardSkeleton...)),
  errorBuilder: (context, failure) => InlineAsyncError(failure: failure, onRetry: context.read<HomeCubit>().refresh),
  successBuilder: (context, home) => _BusinessesRow(...BusinessCard...),
)
```

Every loading placeholder in the app is built this way — see `FacilityCardSkeleton`, `CalendarTimelineSkeleton` (shared by the calendar and facility schedule), `SearchResultSkeleton` (also the search "load more" footer), `PromotionSkeleton`, `TicketSkeleton`. `ShimmerImage`'s own loading placeholder is a bone too, so images sweep in step with the skeletons around them.

### Failed or missing images

`ShimmerImage` never shows a broken-image icon. With no URL, or when the load fails, it draws its `fallback` in the exact same box and corners (so nothing shifts between loading, loaded and failed). Pick the variant that suits the slot and pass the activity line's colour as `accent` when it is known:

- `ImageFallback.cover(accent:)` (the default) for covers, banners, branch photos and service thumbnails. It draws the brand navy with an accent glow and a faint Coflow mark, dark enough for white captions on top.
- `ImageFallback.person(name, accent:, icon:)` for user, instructor and team photos. It shows two initials (one below 32px), or a person glyph when the name has none.
- `ImageFallback.business(name, accent:)` for facility logos. It shows one initial, or the Coflow mark when the name has none.
- `ImageFallback.icon(icon, accent:)` for icon-like images such as amenities.

`errorBuilder` swaps in a bespoke widget, sized to the image box. Never pass ad-hoc `Icon`s as a failure state.

## Icons

- Default: `SolarIconsOutline.*` (`solar_icons` package), colored via `context.colors.*`.
- Design-specific/prominent icons: add the SVG to `assets/svgs/`, run `dart run build_runner build --delete-conflicting-outputs`, use `Assets.svgs.<name>.svg()`.

## Feedback & misc

- Snackbars: `context.showSuccessSnackBar(msg)` / `showErrorSnackBar` / `showInfoSnackBar` / `showWarningSnackBar`. They go through the app-wide queue in `lib/core/presentation/snackbar/` (`SnackbarHost`, mounted in `MaterialApp.builder`), so they show from the top over every route — sheets and dialogs included — one at a time, deduped. Never use `ScaffoldMessenger`/`SnackBar` directly.
- Opacity: `color.withValues(alpha: 0.3)` — `withOpacity` is deprecated.
- Enum args: prefer dot-shorthand (`mainAxisAlignment: .center`).
- All user-facing strings via `context.l10n.*` — see the `add-translations` skill.
- RTL: layout must work in Arabic (`context.isRTL`); use directional `EdgeInsetsDirectional`/`start`/`end` where sides matter.
