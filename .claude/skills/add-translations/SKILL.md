---
name: add-translations
description: Add or change localized strings in coflow_users_v2 (English + Arabic ARB files, gen-l10n, context.l10n usage). Use whenever adding ANY user-facing text, labels, messages, or when asked to translate/localize strings.
---

# Adding Translations

The app never hardcodes user-facing strings. Every string goes through Flutter gen-l10n with English + Arabic.

## Workflow

1. Add the key to **both** ARB files in `coflow_users_v2/lib/core/l10n/translations/`:
   - `app_en.arb` — the template file (source of truth for keys)
   - `app_ar.arb` — Arabic translation (write natural Arabic, not transliteration; brand names like "InoPeople"/"Coflow" stay Latin)

```json
// app_en.arb
"facilityTickets": "Tickets",
// app_ar.arb
"facilityTickets": "التذاكر",
```

2. Parameterized strings — declare placeholders in `app_en.arb` only:

```json
"greetUser": "Hello, {name}!",
"@greetUser": {
  "placeholders": { "name": { "type": "String" } }
}
```

(Plurals use `{count, plural, one{...} other{...}}` with a `num` placeholder.)

3. Regenerate: `flutter gen-l10n` (output goes to `lib/core/gen/l10n/app_localizations.dart`; also regenerated on `flutter run`).

4. Use in widgets:

```dart
Text(context.l10n.facilityTickets)
Text(context.l10n.greetUser('John'))
```

## Checks

- After generating, `lib/core/l10n/untranslated.txt` lists keys missing from `app_ar.arb` — it should stay empty; if a key appears there, add the missing Arabic entry.
- Key naming: camelCase, feature-prefixed when specific (`facilityTickets`, `loginButton`).
- Context helpers: `context.locale`, `context.isRTL`, `context.isArabic`, `context.isEnglish`. Locale switching is handled by `LocalizationCubit` (HydratedBloc-persisted) — don't build custom locale plumbing.
- Cubits/non-widget code should not format user-facing text; return entities/failures and let the widget layer localize.
