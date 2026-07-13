---
name: coflow-ui
description: Theme system and UI conventions for coflow_users_v2 — semantic colors, typography tokens, spacing, shadows, shimmer placeholders, core widgets (MainButton, TappableScale, CircularButton), icons, and superellipse shapes. Use before building or styling ANY widget, screen, or visual component in the app.
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

## Core widgets (`lib/core/presentation/widgets/`)

- **`TappableScale`** — wrap ANY tappable surface (tiles, chips, rows, tab buttons): consistent press-scale animation, ink, superellipse. Avoid ad-hoc `InkWell`/`GestureDetector`.
- **`CircularButton`** — circular icon-only actions (header controls).
- **`MainButton`** — primary button: `text`, `onPressed`, `isLoading`, `isDisabled`, `leadingIcon`/`trailingIcon`, defaults to 40px height / full width. Pair `isLoading` with `AsyncHandler.loadingDependent`.
- **`MainTextField`**, **`MainBackButton`**, **`MainAnimatedSwitcher`**, **`EzSegmentedControl`**, **`EzFileUpload`**, **`ShimmerImage`**, **`LocationButton`** / **`LocationSelectorBottomSheet`** — check `widgets/` before building something new.

## Shimmer loading placeholders (`shimmer.dart`)

Wrap the whole placeholder layout in ONE `Shimmer`; base surfaces are `ShimmerBox`, detail elements (text lines, icons) are `ShimmerBox.dark` layered on top:

```dart
Shimmer(
  child: Stack(children: [
    ShimmerBox(width: 300, height: 100, borderRadius: 12),
    Positioned(left: 16, top: 16, child: ShimmerBox.dark(width: 80, height: 14)),
  ]),
)
```

Match the real UI's dimensions; for custom-painted shapes wrap a `CustomPaint` with overlaid `ShimmerBox.dark`.

## Icons

- Default: `SolarIconsOutline.*` (`solar_icons` package), colored via `context.colors.*`.
- Design-specific/prominent icons: add the SVG to `assets/svgs/`, run `dart run build_runner build --delete-conflicting-outputs`, use `Assets.svgs.<name>.svg()`.

## Feedback & misc

- Snackbars: `context.showSuccessSnackBar(msg)` / `showErrorSnackBar` / `showInfoSnackBar` / `showWarningSnackBar`.
- Opacity: `color.withValues(alpha: 0.3)` — `withOpacity` is deprecated.
- Enum args: prefer dot-shorthand (`mainAxisAlignment: .center`).
- All user-facing strings via `context.l10n.*` — see the `add-translations` skill.
- RTL: layout must work in Arabic (`context.isRTL`); use directional `EdgeInsetsDirectional`/`start`/`end` where sides matter.
