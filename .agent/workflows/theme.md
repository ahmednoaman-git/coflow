---
description: Theme system instructions using custom ThemeExtension for colors, typography, spacing, and shadows
---
# Theme System Instructions

This project uses a custom theme system based on `ThemeExtension`.

## Core Rules
1. **NEVER** use hardcoded colors (`Colors.red`, `Color(0xFF...)`).
2. **NEVER** use hardcoded text styles (`TextStyle(fontSize: ...)`).
3. **NEVER** use hardcoded spacing or shadows.
4. **ALWAYS** use the `context` extensions.

## Usage

### 1. Colors (`context.colors`)
Access semantic colors that adapt to Light/Dark modes.

```dart
// Main Colors
context.colors.signatureBlue           // #181935 - Main brand color
context.colors.signatureBlueSecondary  // #D6D7EF - Secondary brand color

// Text Colors
context.colors.textPrimary             // #19182A - Main text
context.colors.textSecondary           // #434253 - Secondary text
context.colors.textTertiary            // #6E6E81 - Tertiary text
context.colors.textDisabled            // #AFB0C1 - Disabled text
context.colors.textWhite               // #FFFFFF - White text (for dark backgrounds)

// Identity Colors (Primary/Secondary pairs)
context.colors.skyBluePrimary          // #5BC5F2 - Sky blue primary
context.colors.skyBlueSecondary        // #D6F1FC - Sky blue container
context.colors.seaCaribbeanPrimary     // #00BA88 - Sea caribbean primary (success)
context.colors.seaCaribbeanSecondary   // #BFEEE0 - Sea caribbean container
context.colors.earthSunnyGoldPrimary   // #FFCE20 - Gold primary (warning)
context.colors.earthSunnyGoldSecondary // #FFF5CC - Gold container
context.colors.energyCherryPrimary     // #FF636E - Cherry red primary (error)
context.colors.energyCherrySecondary   // #FFD8DA - Cherry red container
context.colors.ladiesOnlyPrimary       // #FF8DD4 - Ladies only pink
context.colors.ladiesOnlySecondary     // #FFE3F5 - Ladies only container

// Background Colors
context.colors.backgroundOne           // #F7F7F7 - Background variant 1
context.colors.backgroundTwo           // #FAFAFA - Background variant 2
context.colors.backgroundGrey          // #F5F5F6 - Grey background
context.colors.backgroundGreyTwo       // #E9E9EB - Grey background variant 2
context.colors.backgroundWhite         // #FFFFFF - White background

// Stroke/Border Colors
context.colors.strokePrimary           // #F0F0F0 - Light borders
context.colors.strokeSecondary         // #E4E4E4 - Stronger borders
context.colors.strokeRed               // #FFD8DA - Red stroke
context.colors.strokeBlue              // #D6F1FC - Blue stroke
context.colors.strokeGreen             // #BFEEE0 - Green stroke
context.colors.strokeOrange            // #FFF5CC - Orange stroke
```

### 2. Typography (`context.typography`)
Use predefined text styles with Circular Std font.

**Naming convention:** `weightSize` (e.g., `book14`, `medium16`, `bold18`)
This maps directly to Figma designs.

```dart
// Book (Regular) styles - w400
context.typography.book10   // 10px
context.typography.book11   // 11px
context.typography.book12   // 12px
context.typography.book13   // 13px
context.typography.book14   // 14px (most common body text)
context.typography.book16   // 16px
context.typography.book18   // 18px
context.typography.book20   // 20px
context.typography.book36   // 36px (large display)

// Medium styles - w500
context.typography.medium11 // 11px
context.typography.medium12 // 12px
context.typography.medium13 // 13px
context.typography.medium14 // 14px
context.typography.medium16 // 16px (most common)
context.typography.medium18 // 18px
context.typography.medium20 // 20px
context.typography.medium24 // 24px

// Bold styles - w700
context.typography.bold13   // 13px
context.typography.bold14   // 14px
context.typography.bold16   // 16px
context.typography.bold18   // 18px
context.typography.bold20   // 20px
context.typography.bold24   // 24px (headings)
```

**Semantic Modifiers**:
Chain methods to apply theme colors to text styles.
```dart
// Text colors
context.typography.book14.primary(context)    // Uses textPrimary
context.typography.medium16.secondary(context) // Uses textSecondary
context.typography.book12.tertiary(context)   // Uses textTertiary
context.typography.medium14.inverse(context)  // Uses textWhite
context.typography.book14.disabled(context)   // Uses textDisabled

// Semantic colors
context.typography.bold16.error(context)      // Uses energyCherryPrimary
context.typography.medium14.success(context)  // Uses seaCaribbeanPrimary
context.typography.book14.warning(context)    // Uses earthSunnyGoldPrimary
context.typography.medium16.info(context)     // Uses skyBluePrimary

// Brand & Accent colors
context.typography.bold18.brand(context)      // Uses signatureBlue
context.typography.medium16.gold(context)     // Uses earthSunnyGoldPrimary (main accent)
context.typography.book14.skyBlue(context)    // Uses skyBluePrimary
context.typography.medium14.seaCaribbean(context) // Uses seaCaribbeanPrimary
context.typography.book14.cherry(context)     // Uses energyCherryPrimary
context.typography.medium14.ladiesOnly(context) // Uses ladiesOnlyPrimary
```

### 3. Spacing (`context.spacing`)
Use the 4px grid system.

```dart
Padding(
  padding: EdgeInsets.all(context.spacing.s16), // 16px
  child: SizedBox(height: context.spacing.s8),  // 8px
)
```

### 4. Shadows & Borders (`context.shadows`)
Shadows automatically handle Dark Mode (becoming transparent).
**Pattern**: Always pair shadows with `strokePrimary` for Dark Mode visibility.

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

## Helper Methods
Use `context` helpers for common UI feedback:
- `context.showSuccessSnackBar(message)`
- `context.showErrorSnackBar(message)`
- `context.showInfoSnackBar(message)`
- `context.showWarningSnackBar(message)`
