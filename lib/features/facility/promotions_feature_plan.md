# Promotions Feature Plan

Assumption: this document lives under `lib/features/facility/` because promotions belong to the same user-app facility pricing flow as tickets.

## Business Requirements

- Scope for this plan is **front-end users app only**.
- The admin portal creation flow is used only to understand business rules and variants; it is **not** part of this implementation plan.
- The Promotions experience should live under the existing facility pricing area, next to the current `Tickets` tab.
- Promotions should be loaded as a **read-only** list for a specific facility.
- This first pass targets the **listing/tab experience only**; a promotion details view is a later phase.
- The initial implementation should treat the provided API JSON samples as the **source of truth**.
- The first-pass domain should include only the data needed to render the 3 attached promotion cards.
- If a card needs a value that is currently missing from the JSON payload, the mapper should provide a temporary default until backend adds a dedicated field.

### Supported promotion variants

1. **Discount**
   - Identified by `type = "discount"`.
   - Displays a `discount_ratio` percentage.
   - Does not require `price`, `discount_price`, `tickets`, `get_tickets`, `gift`, or `coupons`.
  - The card render needs an `Applied on` row.
  - Backend confirmation says there is **no top-level `applies_on` field** for Discount in the current response.
  - Until backend adds the real scope, the listing card should use the fallback text `All Tickets / All Packages / All Purchases`.

2. **Package**
   - Identified by `type = "package"`.
  - Has a required `price` and optional `discount_price`.
  - The card only needs the **effective display price**, derived from `discount_price ?? price`.
   - Contains one or more purchase ticket lines in `tickets[]`.
   - Each ticket line may have either:
     - a finite `count`, or
     - `unlimited = true`.
   - The same ticket type may appear multiple times, so the UI/data layer must **not deduplicate** by `ticket_id`.
    - The card footer also shows a `Remaining` badge.

3. **Buy & Get**
   - Identified by `type = "buy_get"`.
   - Shares the same purchase-side structure as Package:
     - `price`
     - optional `discount_price`
     - `tickets[]`
   - Grants exactly one reward kind, resolved by payload content:
     - `gift` is non-null -> Gift reward
     - `get_tickets[]` is non-empty -> Ticket reward
     - `coupons[]` is non-empty -> Coupon reward
   - The card body needs a `BUY` line plus a `GET` section.
   - If the reward is coupons and the API returns multiple coupons, render them as separate list items under `GET`.
   - The card footer also shows a `Remaining` badge.

### Common behavior

- Promotions should support standard **loading**, **empty**, **success**, and **error** states.
- Promotions should preserve API ordering unless product decides otherwise later.
- All cards should render the title, a trailing highlighted value, an end-date footer item, and a like icon.
- `end_date` should be modeled for the card footer.
- `has_like` should be mapped for the card heart state; if the API omits it, default to `false`.
- Package and Buy & Get cards should also render a `Remaining` footer item.
- Because the current JSON does **not** expose a reliable remaining field and it cannot be derived safely from the provided samples, use a temporary domain default of `10` for Package and Buy & Get cards.
- `currency` should be preserved on price-based variants.
- For Package and Buy & Get, the card only needs the effective display price derived from `discount_price ?? price`; if both are absent unexpectedly, default to `0`.
- The following fields can be ignored for the first user-app pass unless the UI later needs them:
  - `offer`
  - `editable`
  - `payment_unlimited`
  - `payment_limit`
- The following admin-visible fields are intentionally deferred to the future details view and do not need to be part of the first listing implementation:
  - `start_date`
  - `description`
  - `validity`
  - `conditions`
  - `requirements`
- Full design polish is deferred; the first pass only needs enough UI structure to prove the feature can render all 3 variants.

### Confirmed API notes and remaining follow-up

- The promotions list endpoint path is confirmed to be relative to the API base URL as `promotions/:facilityId`.
- Discount promotions do not currently expose a top-level `applies_on` field, so the first-pass card will use the fallback text `All Tickets / All Packages / All Purchases`.
- Package / Buy & Get `Remaining` cannot be derived reliably from the current samples, so the first-pass domain should use a temporary default of `10`.
- `has_like` should be carried into the domain for the heart icon, defaulting to `false` if absent.
- Nested ticket snapshots may be missing; ticket display names should default to `Ticket` until backend guarantees them.
- Coupon rewards should preserve all returned coupon entries so the UI can render them as a markdown-style list under `GET`.
- `start_date`, `description`, `validity`, `conditions`, and `requirements` are intentionally excluded from the listing response and should be handled by the future details flow instead.
- `offer` should be treated as reserved for future use and ignored for now.
- Remaining follow-up: ask backend for a dedicated `remaining` field for Package / Buy & Get and a real Discount scope field if the fallback text should become dynamic later.

## Domain Layer

### Proposed feature shape

Keep promotions under the existing `facility` feature instead of creating a separate top-level feature.

Suggested additions:

- `lib/features/facility/domain/dtos/get_facility_promotions_dto.dart`
- `lib/features/facility/domain/entities/facility_promotion_entity.dart`
- `lib/features/facility/domain/entities/facility_promotion_ticket_line_entity.dart`
- `lib/features/facility/domain/entities/facility_promotion_coupon_entity.dart`
- `lib/features/facility/domain/entities/facility_promotion_reward_entity.dart`
- `lib/features/facility/domain/use_cases/get_facility_promotions_use_case.dart`
- updates to domain barrel exports

### Sealed class hierarchy

Use a sealed promotion entity with 3 implementations.

- `FacilityPromotionEntity.discount(...)`
- `FacilityPromotionEntity.package(...)`
- `FacilityPromotionEntity.buyGet(...)`

The first-pass domain should be **display-driven for the listing cards only**.

Recommended shared fields across variants:

- `id`
- `name`
- `endDate`
- `isLiked`

Recommended variant-specific fields:

- **Discount**
  - `discountRatio`
  - `appliedOnText`

- **Package**
  - `displayPrice`
  - `currency`
  - `tickets` as `List<FacilityPromotionTicketLineEntity>`
  - `remainingCount`

- **Buy & Get**
  - `displayPrice`
  - `currency`
  - `buyTickets` as `List<FacilityPromotionTicketLineEntity>`
  - `reward` as `FacilityPromotionRewardEntity`
  - `remainingCount`

Entities may expose computed getters for card text, for example:

- joined package summary text
- joined `BUY` summary text
- reward display lines for `GET`
- formatted trailing value text (`EGP 500`, `10%`, etc.)

### Supporting entities

1. `FacilityPromotionTicketLineEntity`
  - `name`
   - `count` nullable
   - `unlimited` boolean
  - computed `displayText` for strings like `3 x Class Pass`

2. `FacilityPromotionCouponEntity`
   - `discountRatio`
  - `appliesOnText`
  - computed `displayText` for lines such as `Coupon: 10% (Applies on: Tickets)`

3. `FacilityPromotionRewardEntity` as a sealed class
   - `gift(String giftName)`
   - `tickets(List<FacilityPromotionTicketLineEntity> tickets)`
   - `coupons(List<FacilityPromotionCouponEntity> coupons)`
  - optional computed `displayLines` helper for the card `GET` section

### Enums

Recommended enums:

- `FacilityPromotionType`
  - `discount`
  - `package`
  - `buyGet`

Notes:

- Do **not** add a top-level Discount `appliesOn` enum yet because that field is not currently present in the provided payload.
- For Buy & Get reward type, prefer the sealed `FacilityPromotionRewardEntity` instead of a separate enum-only design.
- Do not keep raw coupon `applies_on` enums in the first-pass domain; map them into display-ready text because the card only needs rendered copy.
- Keep `payment_unlimited` / `payment_limit` out of the first-pass domain entity.

### DTOs and use case

- Add `GetFacilityPromotionsDto` with `facilityId`.
- Add `GetFacilityPromotionsUseCase` returning `AsyncTask<List<FacilityPromotionEntity>>`.
- Add `getFacilityPromotions(GetFacilityPromotionsDto dto)` to `FacilityRepository`.

### Domain mapping rules

- `type = "discount"` -> map to Discount entity.
- `type = "package"` -> map to Package entity.
- `type = "buy_get"` -> map to Buy & Get entity.
- Map `has_like` into `isLiked`, defaulting to `false` if absent.
- For Package and Buy & Get, compute `displayPrice = discount_price ?? price ?? 0`.
- For Discount, set `appliedOnText = 'All Tickets / All Packages / All Purchases'` until backend provides the real scope.
- For Package and Buy & Get, set `remainingCount = 10` until backend provides a dedicated field.
- Map missing nested ticket names to the fallback `Ticket`.
- For `buy_get`, validate that **exactly one** reward source is populated among `gift`, `get_tickets[]`, and `coupons[]`, then map that source.
- If the reward is coupons, preserve all coupon entries so the UI can render them as separate `GET` list items.
- If a Buy & Get payload violates that single-reward contract, treat it as an invalid payload and fail mapping instead of guessing.

## Data Layer

### Proposed additions

- `lib/features/facility/data/models/facility_promotion_model.dart`
- `lib/features/facility/data/models/facility_promotion_ticket_line_model.dart`
- `lib/features/facility/data/models/facility_promotion_ticket_snapshot_model.dart`
- `lib/features/facility/data/models/facility_promotion_coupon_model.dart`
- `lib/features/facility/data/mappers/facility_promotion_mapper.dart`
- updates to `datasources`, `repositories`, and barrel exports

### DTO/model strategy

Use a single raw promotion model for API parsing, then map into the sealed domain entity.

Because this plan targets the listing card flow only, keep only the raw fields needed to compute those cards and supply defaults for currently missing UI fields in the mapper.

Recommended `FacilityPromotionModel` fields:

- `id`
- `name`
- `price`
- `discountPrice`
- `discountRatio`
- `type`
- `endDate`
- `gift`
- `currency`
- `hasLike`
- `tickets`
- `getTickets`
- `coupons`
- `offer` nullable but ignored for now
- `editable` nullable/optional

Nested models:

1. `FacilityPromotionTicketLineModel`
   - raw line item from `tickets[]` or `get_tickets[]`
  - fields such as `count`, `unlimited`, and `ticket`

2. `FacilityPromotionTicketSnapshotModel`
   - lightweight nested ticket object
  - keep only fields required by the card summary, such as `name`
  - expect it on Package / Buy & Get line items only
  - keep mapping defensive if a line item omits the nested ticket snapshot
  - do not reuse `FacilityTicketModel` unless the payload shape is proven identical

3. `FacilityPromotionCouponModel`
   - `discountRatio`
   - `appliesOn`
  - `unlimited` can remain raw if useful later, but the first-pass domain only needs display text

### Mapper defaults for missing backend fields

- `hasLike` -> default `false`
- `displayPrice` -> default `0` if both `price` and `discount_price` are unexpectedly absent
- Discount `appliedOnText` -> default `All Tickets / All Packages / All Purchases`
- Package / Buy & Get `remainingCount` -> default `10`
- ticket name -> default `Ticket`
- coupon `appliesOnText` -> best-effort humanized text from raw `applies_on`, falling back to `Unknown`

### Mapper responsibilities

`FacilityPromotionMapper` should:

- switch on raw `type`
- normalize snake_case fields into domain entities
- build a **display-focused** domain entity for the 3 card renders
- compute `displayPrice` from `discount_price ?? price`
- apply temporary defaults for missing backend fields
- resolve Buy & Get reward polymorphism from payload content
- preserve repeated ticket lines without merging them
- safely map optional nested `ticket` data
- preserve all coupon rewards so the UI can render a list under `GET`
- throw a mapping error for unsupported `type` or invalid Buy & Get reward combinations

### Repository contract and implementation

Update `FacilityRepository`:

- add `AsyncTask<List<FacilityPromotionEntity>> getFacilityPromotions(GetFacilityPromotionsDto dto);`

Update `FacilityRepositoryImpl`:

- call the remote data source method
- map each `FacilityPromotionModel` with `FacilityPromotionMapper.toEntity`
- return `List<FacilityPromotionEntity>`

### Remote data source

Add to `FacilityRemoteDataSource`:

- `getFacilityPromotions(GetFacilityPromotionsDto dto)`

Add a new endpoint helper in `FacilityEndpoints`:

- `static String facilityPromotions(int id) => 'promotions/$id';`

The API base URL remains centrally configured by `DioClient`.

Example plan-level expectation:

- request: `GET promotions/{facilityId}`
- response shape: `List<Map<String, dynamic>>`
- each item parsed into `FacilityPromotionModel`

### Barrel/export updates

Update these exports when implementing:

- `domain/dtos/dtos.dart`
- `domain/entities/entities.dart`
- `domain/use_cases/use_cases.dart`
- `data/models/models.dart`
- `data/mappers/mappers.dart`
- `data/repositories/repositories.dart`
- `data/datasources/datasources.dart`

## Presentation Layer

### Goal for the first pass

Replace the current Promotions placeholder with a wired, loadable, type-aware card implementation based on the attached UI.

This means:

- the tab loads real promotion data
- the UI switches by sealed promotion type
- each variant renders the correct card sections for the attached design
- final visual polish and interactions can still be refined later

### State management changes

Update `FacilityDetailsState`:

- add `AsyncState<List<FacilityPromotionEntity>> promotionsRequest`

Update `FacilityDetailsCubit`:

- inject `GetFacilityPromotionsUseCase`
- add `promotionsManager`
- add `ensurePromotionsLoaded()`
- add `refreshPromotions()`
- when `FacilityPricingTab.promotions` is selected, trigger `ensurePromotionsLoaded()`

### UI structure

Suggested new presentation files:

- `presentation/components/tabs/pricing/components/facility_promotions.dart`
- `presentation/components/tabs/pricing/components/promotion_tile.dart`
- `presentation/components/tabs/pricing/components/promotion_shimmer.dart`

Suggested rendering flow:

1. `PricingTabScreen` switches to `FacilityPromotions()` instead of the static coming-soon text.
2. `FacilityPromotions` uses `AsyncHandler` just like tickets do.
3. On success, render a vertical list of `PromotionTile` widgets.
4. `PromotionTile` uses a sealed `switch` on `FacilityPromotionEntity`:
   - Discount -> `_DiscountPromotionStub`
   - Package -> `_PackagePromotionStub`
   - Buy & Get -> `_BuyGetPromotionStub`

### Card content per variant

- **Shared card shell**
  - title on the left
  - trailing highlighted value on the right
  - footer row with end-date item and heart icon

- **Package card**
  - trailing value: effective price
  - body: one combined summary line from `tickets`
  - footer: end-date item + `Remaining` badge + heart icon

- **Buy & Get card**
  - trailing value: effective price
  - body:
    - `BUY` label + joined `buyTickets` summary
    - `GET` section based on reward type
  - for coupon rewards, render multiple coupons as separate indented list items under `GET`
  - footer: end-date item + `Remaining` badge + heart icon

- **Discount card**
  - trailing value: discount percentage
  - body:
    - `Applied on:` label
    - `appliedOnText`
  - footer: end-date item + heart icon

### Empty/error/localization needs

Add localized strings for at least:

- no promotions available
- applied on
- remaining
- buy
- get
- ticket fallback label
- the fallback Discount scope text (`All Tickets / All Packages / All Purchases`)
- reward labels if the card needs them

Keep all user-facing strings in l10n files and access them with `context.l10n`.

### Deferred items

The following are intentionally deferred from the first pass:

- final card visuals and detailed UX polish
- exact admin-form parity
- start date, description, validity, conditions, and requirements
- accurate backend-driven remaining calculation
- discount applied-scope display if backend exposes it later
- like toggle interaction (the first pass only needs the visual state)
- sorting/filtering rules beyond backend order
- deep promotion details screen, if needed later

### Minimal implementation sequence

1. Add display-focused domain DTOs/entities/use case.
2. Add raw data models plus mapper defaults for missing backend fields.
3. Extend facility cubit/state with promotions request manager.
4. Replace the pricing Promotions placeholder with async wired list rendering.
5. Add per-variant card widgets driven by a sealed `switch`.
6. Add minimal l10n strings and empty/error states.
