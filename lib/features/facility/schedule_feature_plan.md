# Schedule & Calendar Feature Plan

This document lives under `lib/features/facility/` because Schedule/Calendar is a tab of the
facility details screen, alongside Profile, Activities/Flows/Courses, and Pricing.

It captures what we know, what we decided, and what is still open, so the reasoning survives the
gap between building the UI and the APIs arriving.

**Status:** Schedule runs on the real `GET schedule/{facilityId}` endpoint. Calendar's timeline is
still stub-backed, as are slot details + reservations.

Schedule and Calendar have since **diverged in data shape**, not just in capabilities:

- **Schedule** is a *recurring weekly cycle*. The endpoint returns a pattern — weekday, `from`/`to`
  clock times, service, instructors — with no dates, no capacity, and no date or type filter. The
  tab therefore shows one turn of that cycle: seven days from today, one of each weekday, no month
  stepper, one fetch.
- **Calendar** still wants dated, capacity-bearing occurrences, which no endpoint serves yet.

`FacilityScheduleConfig.isCalendar` is the seam: it picks the window shape and which use case the
cubit calls. Everything downstream — day strip, timeline, cards, empty state — is shared, because
`FacilityWeeklyScheduleMapper` projects the weekly pattern into the same dated
`FacilitySessionEntity` list the Calendar path produces.

---

## 1. Where the feature sits

Schedule and Calendar are **two capability levels of one screen**, gated by account tier
(`lib/core/domain/enums/account_type.dart`):

| Account | Tier | Tab | Month stepper | Capacity | Activities/Courses toggle |
|---|---|---|---|---|---|
| Flow | basic *or inactive* | Schedule | ✗ | ✗ | ✗ |
| Flow | premium | Calendar | ✓ | ✓ | ✗ |
| Pro | premium | Calendar | ✓ | ✓ | ✓ |
| Go | any | — | — | — | — |

Go accounts never schedule. `schedule` and `calendar` are mutually exclusive features. An
**inactive** subscription resolves to the **basic** tier (open question 1): the facility stays
browsable and keeps Schedule, but never gets Calendar, and its purchase CTAs become
"Contact [Facility]".

Implemented as `FacilityScheduleConfig` (`presentation/cubit/facility_schedule_config.dart`) —
every difference between the three designs is one flag, and each flag is a seam for a future
divergence.

---

## 2. Timeline (implemented)

### Data flow

- Sessions are fetched a **window at a time** and grouped by day client-side, so day selection
  never waits on the network. Calendar windows are whole months; Schedule uses a rolling range.
- Backend confirmed the endpoint will filter by **start/end date**, so the DTO is a range, never a
  single day.
- Only a window change or a listing-type change refetches.

### Rules

- **Default view is today.** Past slots are not browsable: the current month's window starts on
  today rather than the 1st, and the `←` stepper is disabled until the user has stepped forward.
- **Only days with sessions are selectable.** Days with nothing scheduled render dimmed and ignore
  taps.
- **Private slots never appear here.** A facility can mark a slot private; customers added to one
  find their reservation in Account_Calendar instead. Nothing to implement client-side — the
  endpoint is expected to exclude them.
- Session accent colour arrives as a **hex per session**, not derived from the level, so a facility
  can colour-code sessions that have no level at all (Pro activities). Card surface is a pale shade
  derived from that hex (HSL lightness), and text over a filled surface picks black or white by WCAG
  contrast ratio.
- The **capacity bar is Calendar-only**. Schedule hides it by product rule; the data is present
  either way.
- **Waitlist count shows only when a session is fully booked** ("Reservation Bar --- Waitlist (If
  fully Booked)").

### Card fields

Name · ladies-only tag (optional) · instructor(s) · level · reservation bar · waitlist when full.

---

## 3. Slot details & reservations (in progress)

Tapping a card opens a bottom sheet. Header carries the slot's accent; body sections vary by
facility settings.

### 3.1 Header

Slot name · day + date · from–to · instructors · level · ladies-only (optional).

### 3.2 Customers section

Driven by the facility's **calendar customers setting**:

- **Private** → aggregate capacity bar only.
- **Visible** → numbered list from 1 to capacity, unfilled positions rendered blank.
- The current user's own entry renders **bold** in either list.
- The customers line takes the **level colour** ("Color of Customer Reservations Line same as Flow
  Level"). See open question 6 — this may conflict with the per-session hex used on the card.

### 3.3 Waitlist section

- **Always visible**, even when customer reservations are private.
- Numbered, current user bold.
- Purged entirely when the slot reaches the cancellation time limit.

### 3.4 Location section

- Facility Location toggle **ON** for the activity/course → show the facility address under the
  heading "Facility Location".
- **OFF** → show the slot's selected location under the heading "Location".
- Opens externally.

### 3.5 Note section

Free-text operational note from the facility (e.g. "Expected wind 15 - 25 km/hr between 12 - 4pm").
Shown when present.

### 3.6 CTA decision table

Inputs: facility premium state · the viewer's state on this slot · whether the slot is full ·
**AT** = accessible tickets (the viewer's remaining ticket uses valid for this slot).

| Premium | Viewer state | Full | AT | CTA | Notes |
|---|---|---|---|---|---|
| inactive | any | any | any | `Contact [Facility]` | uses the facility's reservation contact |
| active | reserved | — | — | `Cancel Reservation` | disabled past the cancellation cutoff |
| active | waitlisted | — | — | `Leave Waitlist` | disabled past the cancellation cutoff |
| active | none | no | ≥ 1 | `Reserve Now (n Available Tickets)` | opens the confirmation dialog |
| active | none | no | 0 | `Purchase Tickets (0 Available Tickets)` | diverts to the purchase flow |
| active | none | yes | ≥ 1 | `Join Waitlist` | **fires immediately, no confirmation** |
| active | none | yes | 0 | `Purchase Tickets` | diverts to the purchase flow |

Styling: the affirmative action is filled-tint; cancel, leave, and purchase are outlined.

The table is implemented as a single pure resolver in the domain
(`SessionCtaResolver`) returning a sealed `SessionCtaEntity`, so it stays testable and in one place
as product refines it.

### 3.7 Ticket accounting

- **Reserve deducts 1 AT.** Cancelling returns the same AT and the user may reserve again if a spot
  is still free.
- **Joining a waitlist deducts nothing.** The deduction happens only when the waitlist entry
  converts into a reservation.
- Reserve is the only action with a confirmation step. Waitlist join/leave fire on click.

### 3.8 Timing

A single facility "customer cancellation" setting (e.g. 6 hours before start) governs:

- Before the deadline: cancel and leave-waitlist are live.
- At the deadline: both disable, **and the whole waitlist is cancelled**.
- The same setting supplies the confirmation dialog's cancellation-policy sentence.

The client should receive an **absolute deadline timestamp** (plus the window in hours for the
policy copy) rather than computing it.

### 3.9 Reservation confirmation dialog

Reached from `Reserve Now`. Shows the slot name, date, time, and the **purchase that will be
consumed** — quantity, ticket name, due badge, expiry, validity, add-ons — plus the cancellation
policy, then a final `Reserve Now`.

---

## 4. What the API needs to expose

Sent to backend as the shape we are building against. Everything here is currently faked by
`FacilityScheduleStubDataSource`.

**Session listing** (`type` + start/end date filters): id, service id, name, start/end timestamps,
accent colour hex, level `{name, color}`, ladies-only flag, instructors, capacity
`{booked, total, waitlist}`. Private slots excluded.

This is what **Calendar** still needs. `GET schedule/{facilityId}` covers Schedule instead, and
differs in ways worth having on record:

| Asked for | `schedule/{id}` delivers | Handled by |
|---|---|---|
| Dated occurrences | Weekly pattern (`day`, `day_int`, `from`, `to`) | Mapper projects onto the window |
| `start_date`/`end_date` filter | No date params | Client-side projection |
| `type` filter | No param, but `service.type` per row | Mapper filters |
| Per-session accent hex | Only `service.level.color` | Level colour is the accent |
| `capacity {booked, total, waitlist}` | Absent | Capacity bar does not render |
| One response | Laravel paginator, `per_page: 10` | Data source walks pages |

Two things to confirm with backend:

- `day_int` indexes a week starting on **Saturday** (`sunday` = 2), not Dart's Monday-based
  `weekday`. The mapper reads the `day` **name** and only falls back to `day_int`.
- Slot `id` identifies a *recurring row*, not a bookable occurrence — every Monday 09:00 shares one
  id. Fine while one week is on screen; the reservation flow will need real occurrence ids.

**Slot details** (by session id): everything above, plus

- `customers_visible` — the facility's calendar setting
- ordered `customers[]` and `waitlist[]` with a flag marking the requesting user
- resolved location + whether it is the facility location or the slot's selected location
- note
- `cancellation_deadline` (absolute) and the window in hours
- the viewer's state on this slot: none / reserved / waitlisted
- accessible ticket count for this slot
- the purchase that a reservation would consume

**Actions:** reserve, cancel reservation, join waitlist, leave waitlist. Each should return the
updated slot so the client never has to guess the resulting state.

---

## 5. Open questions

| # | Question | Why it matters | Status |
|---|---|---|---|
| 1 | What exactly is "Premium Inactive"? Facility subscription lapsed, or online payment off? | Under the old feature matrix a lapsed subscription removed every tab, so the `Contact [Facility]` CTA was unreachable. | **Answered 2026-08-15:** `inactive` resolves to the **basic** tier — the facility stays browsable with Schedule (never Calendar) and a contact-only Pricing tab. Implemented in `AccountType.features`; purchase CTAs gate on `PurchaseCtaResolver.allowsInAppPurchase`. |
| 2 | If several purchases are eligible, who picks the one consumed — auto (earliest expiry? due first?) or the user? | Decides whether the confirmation dialog needs a selector. Built for a single API-chosen purchase for now. | Asked |
| 3 | Is there a reservation cutoff separate from the cancellation cutoff? | Whether a user can still reserve after the cancellation deadline but before the slot starts. | Asked |
| 4 | Waitlist conversion when the user has 0 AT by then — skipped, or reserved anyway? | Server-side rule, but the client may need to surface the outcome. | Asked |
| 5 | Does "(2 Available Tickets)" mean remaining uses across purchases, or number of purchases? | Only affects the CTA label's number. | Asked |
| 6 | Customers line colour is specified as the **level** colour, but the card accent is a per-session hex. Which wins if they differ? | Only matters if a facility can colour a slot differently from its level. | Open |
| 7 | Schedule day-strip paging: the Figma comment speaks in **weeks** ("return to current week") while the design label reads "January 1ˢᵗ" and we were told month `+/-`. | Settled for Schedule by the endpoint's shape — a recurring weekly cycle has nothing to page. Month stepping remains on Calendar. | Closed |
| 8 | Schedule (Flow basic) has no month stepper at all — does its day strip scroll infinitely? | Settled: one turn of the cycle, seven days from today, no scrolling beyond it. | Closed |
| 9 | Schedule chips carried a **date** (`SUN 4`) even though the data is date-less. Should they drop to weekday-only? | — | **Closed 2026-08-15:** weekday only, via `CalendarDayStrip.showsDayNumber: false`. Calendar keeps the date. The day summary below still reads "Sunday 4ᵗʰ", as the design shows. |
| 10 | The card's instructor line reads `Abdelrahman, Fouad` in the design, but that is one instructor named "Abdelrahman Fouad" in our fixtures. Comma-separated list of two people, or a `Last, First` convention? | Changes `FacilityWeeklyScheduleMapper`'s name composition. | Open |

Label inconsistency to settle: "Purchase Tickets" vs "Purchase" — the app uses one localized
string for both.

---

## 6. Implementation notes

- Schedule is real end to end: `FacilityRemoteDataSource.getFacilitySchedule` (page walk) →
  `FacilityWeeklyScheduleMapper` (filter, project, derive accent) → the existing timeline.
- Calendar and the reservation flow are still served by stub data sources with `TODO(backend)`
  markers. Swapping in a real endpoint should touch only the data source and the repository
  routing line.
- The reservation flow's business rules live in the domain (CTA resolver, capacity/waitlist getters)
  rather than in widgets, precisely because they are the parts most likely to change when the
  answers to section 5 arrive.
- Reused across the feature: `EzSlidingSelector` (core, generalized from the Pricing tab selector),
  `ServiceLevelPill`, `TicketShapeBorder` and the purchase ticket card, `Shimmer`, `TappableScale`.
