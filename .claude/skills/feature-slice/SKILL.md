---
name: feature-slice
description: Add a new API-backed feature or endpoint to coflow_users_v2 as a full clean-architecture vertical slice — endpoint, model, mapper, entity, DTO, repository, use case, cubit with AsyncRequestManager, and AsyncHandler UI. Use whenever asked to integrate an API, add a screen backed by data, create a use case/cubit, or scaffold a new feature.
---

# Adding a Feature / Endpoint Vertical Slice

Follow the layer order below (domain → data → presentation). Every folder has a same-named barrel file — **add each new file to its barrel** as you go.

For a **new feature**, create the tree first; for a **new endpoint in an existing feature**, skip to step 1 and extend existing files:

```
lib/features/<feature>/
├── <feature>.dart                    # barrel: exports domain/data/presentation
├── domain/   (domain.dart)           # dtos/ entities/ repositories/ use_cases/  (+ barrels)
├── data/     (data.dart)             # datasources/ models/ mappers/ repositories/  (+ barrels)
└── presentation/ (presentation.dart) # cubit/ components/ or screens/
```

## 1. Domain layer

**Entity** — `domain/entities/<x>_entity.dart`. Freezed v3 (`abstract` keyword required). Business-facing fields only; may add computed getters (needs private ctor `const XEntity._();`).

```dart
@freezed
abstract class FacilityTicketEntity with _$FacilityTicketEntity {
  const factory FacilityTicketEntity({
    required int id,
    required String name,
  }) = _FacilityTicketEntity;
}
```

**DTO** — `domain/dtos/<verb>_<x>_dto.dart` for the request input (also `@freezed`). Even a single-id request gets a DTO (e.g. `GetFacilityTicketsDto(facilityId: ...)`).

**Repository interface** — `domain/repositories/<feature>_repository.dart`:

```dart
abstract interface class FacilityRepository {
  AsyncTask<List<FacilityTicketEntity>> getFacilityTickets(GetFacilityTicketsDto dto);
}
```

**Use case** — `domain/use_cases/<verb>_<x>_use_case.dart`, one per operation:

```dart
@lazySingleton
class GetFacilityTicketsUseCase {
  const GetFacilityTicketsUseCase(this._repository);
  final FacilityRepository _repository;

  AsyncTask<List<FacilityTicketEntity>> call(GetFacilityTicketsDto dto) =>
      _repository.getFacilityTickets(dto);
}
```

## 2. Data layer

**Model** — `data/models/<x>_model.dart`, mirrors the API JSON:

```dart
part '<x>_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityTicketModel {
  const FacilityTicketModel({required this.id, ...});
  final int id;
  // explicit @JsonKey(name: '...') only when snake_case rename isn't enough
  factory FacilityTicketModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityTicketModelFromJson(json);
  Map<String, dynamic> toJson() => _$FacilityTicketModelToJson(this);
}
```

**Mapper** — `data/mappers/<x>_mapper.dart`, static-only:

```dart
abstract final class FacilityTicketMapper {
  static FacilityTicketEntity toEntity(FacilityTicketModel model) =>
      FacilityTicketEntity(id: model.id, ...);
}
```

**Remote datasource** — `data/datasources/<feature>_remote_data_source.dart`. Endpoints live in a nested `abstract final class`; every call is wrapped in `tryCatchMapDioToFailure`:

```dart
/// Facility API endpoints.
abstract final class FacilityEndpoints {
  static const String login = 'login';                              // fixed path
  static String facilityTickets(int id) => 'tickets/$id';           // parameterized path
}

@lazySingleton
class FacilityRemoteDataSource {
  const FacilityRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<List<FacilityTicketModel>> getFacilityTickets(GetFacilityTicketsDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(FacilityEndpoints.facilityTickets(dto.facilityId));
      final raw = response.data as List<dynamic>;
      return raw
          .cast<Map<String, dynamic>>()
          .map(FacilityTicketModel.fromJson)
          .toList(growable: false);
    });
  }
}
```

Single-object responses: `Model.fromJson(response.data as Map<String, dynamic>)`. POST bodies: `_dio.post(endpoint, data: dto.toJson())`.

(Local/cache datasources use `CacheClient` and wrap with `AsyncTaskExtension.tryCatch`.)

**Repository impl** — `data/repositories/<feature>_repository_impl.dart`:

```dart
@LazySingleton(as: FacilityRepository)
class FacilityRepositoryImpl implements FacilityRepository {
  const FacilityRepositoryImpl(this._remote);
  final FacilityRemoteDataSource _remote;

  @override
  AsyncTask<List<FacilityTicketEntity>> getFacilityTickets(GetFacilityTicketsDto dto) =>
      _remote.getFacilityTickets(dto).map((models) => models.map(FacilityTicketMapper.toEntity).toList());
}
```

Use `flatMap` + `AsyncTask.tryCatch` instead of `map` when mapping itself can fail and needs a specific `Failure`.

## 3. Presentation layer

**State** — `presentation/cubit/<x>_state.dart`. One `AsyncState<T>` field per request:

```dart
part '<x>_state.freezed.dart';

@freezed
abstract class FacilityDetailsState with _$FacilityDetailsState {
  const factory FacilityDetailsState({
    @Default(AsyncState.idle()) AsyncState<List<FacilityTicketEntity>> ticketsRequest,
  }) = _FacilityDetailsState;
}
```

**Cubit** — `presentation/cubit/<x>_cubit.dart`. One `AsyncRequestManager` per request. Runtime params (ids, entities passed via route) come in as `@factoryParam`:

```dart
@injectable
class FacilityDetailsCubit extends Cubit<FacilityDetailsState> {
  FacilityDetailsCubit(this._getTickets, @factoryParam int facilityId)
      : super(const FacilityDetailsState()) {
    ticketsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.ticketsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(ticketsRequest: partial),
      ),
      emit: emit,
      autoExecute: true, // false for lazily-loaded tabs / user-triggered actions
      defaultRequest: _getTickets(GetFacilityTicketsDto(facilityId: facilityId)),
    );
  }

  final GetFacilityTicketsUseCase _getTickets;
  late final AsyncRequestManager<FacilityDetailsState, List<FacilityTicketEntity>> ticketsManager;

  Future<void> refreshTickets() => ticketsManager.refresh();
}
```

Manager API: `execute([task])`, `refresh()`, `reset()`, and getters `isLoading/isSuccess/isError/isIdle/data/failure`. Lazy-tab pattern: `if (manager.isLoading || manager.isSuccess) return; manager.execute();`

**Screen** — `presentation/<x>_screen.dart` with `@RoutePage()`; creates the `BlocProvider` (`getIt<XCubit>(param1: ...)`) and delegates layout to `components/<x>_screen_body.dart`. Register the route in `lib/core/routing/app_router.dart`; navigate with `context.router.push(XRoute(...))`.

**UI consumption** — `AsyncHandler` (from core) drives the request states:

```dart
// Data rendering (idle/loading/success/error)
AsyncHandler<FacilityDetailsCubit, FacilityDetailsState, List<FacilityTicketEntity>>(
  requestManagerGetter: (cubit) => cubit.ticketsManager,
  successBuilder: (context, tickets) => TicketsList(tickets: tickets),
  loadingBuilder: (context) => const TicketsShimmer(),      // optional; see coflow-ui skill
  onRetry: (cubit) => cubit.ticketsManager.refresh(),       // optional retry button
  onError: (context, failure) => context.showErrorSnackBar(failure.message), // optional side effect
)

// Submit buttons / overlays
AsyncHandler<LoginCubit, LoginState, UserEntity>.loadingDependent(
  requestManagerGetter: (cubit) => cubit.loginManager,
  builder: (context, isLoading) => MainButton(
    text: context.l10n.login,
    isLoading: isLoading,
    onPressed: isLoading ? null : () => context.read<LoginCubit>().login(),
  ),
  onSuccess: (context, user) => context.router.push(const HomeRoute()),
  onError: (context, failure) => context.showErrorSnackBar(failure.message),
)
```

## 4. Finish

1. Add every new file to its folder barrel (and new folders to the parent barrel).
2. `dart run build_runner build --delete-conflicting-outputs` — generates freezed/json/DI/routes.
3. New user-facing strings → `add-translations` skill (never hardcode).
4. `flutter analyze` and run relevant tests. Mapper tests live under `test/features/<feature>/data/mappers/` — plain `flutter_test` group/test style asserting model→entity mapping.
