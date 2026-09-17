import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:coflow_users_v2/features/search/domain/domain.dart';
import 'package:coflow_users_v2/features/search/presentation/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

CollapsedFacilityEntity _facility(int id) => CollapsedFacilityEntity(
  id: id,
  name: 'Facility $id',
  description: 'Description $id',
  activityLine: ActivityLineEntity.sky,
  accountType: const FlowAccount(),
  status: FacilityStatus.visible,
  subscriptionStatus: SubscriptionStatus.basic,
  paymentType: PaymentType.none,
  views: 0,
);

SearchInstructorEntity _instructor(int id) =>
    SearchInstructorEntity(id: id, name: 'Instructor $id');

class _StubRepository implements SearchRepository {
  final List<SearchDto> requests = [];

  /// Business results span two pages; the other two fit on one.
  @override
  AsyncTask<PaginatedEntity<CollapsedFacilityEntity>> searchBusinesses(SearchDto dto) {
    requests.add(dto);
    return TaskEither.right(
      PaginatedEntity(
        items: [_facility(dto.page * 10), _facility(dto.page * 10 + 1)],
        currentPage: dto.page,
        lastPage: 2,
        total: 4,
      ),
    );
  }

  @override
  AsyncTask<PaginatedEntity<SearchInstructorEntity>> searchInstructors(SearchDto dto) {
    requests.add(dto);
    return TaskEither.right(
      PaginatedEntity(items: [_instructor(1)], currentPage: 1, lastPage: 1, total: 1),
    );
  }

  @override
  AsyncTask<PaginatedEntity<SearchServiceEntity>> searchServices(SearchDto dto) {
    requests.add(dto);
    return TaskEither.right(PaginatedEntity.empty());
  }
}

void main() {
  late _StubRepository repository;
  late SearchCubit cubit;

  setUp(() {
    repository = _StubRepository();
    cubit = SearchCubit(
      SearchBusinessesUseCase(repository),
      SearchInstructorsUseCase(repository),
      SearchServicesUseCase(repository),
    );
  });

  tearDown(() => cubit.close());

  /// Lets the debounce elapse and the queued requests settle.
  Future<void> settle() => Future<void>.delayed(SearchConstants.debounce * 2);

  group('SearchCubit', () {
    test('holds the request back until the query reaches the backend minimum', () async {
      cubit.queryChanged('fl');
      await settle();

      expect(repository.requests, isEmpty);
      expect(cubit.state.isQueryTooShort, isTrue);
      expect(cubit.state.businessesRequest, isA<AsyncIdle<Object>>());
    });

    test('searches all three types once typing pauses', () async {
      cubit.queryChanged('flo');
      await settle();

      expect(repository.requests.map((dto) => dto.type), [
        SearchType.business,
        SearchType.instructor,
        SearchType.service,
      ]);
      expect(repository.requests.every((dto) => dto.query == 'flo' && dto.page == 1), isTrue);
    });

    test('debounces a burst of keystrokes into one round of requests', () async {
      cubit
        ..queryChanged('flo')
        ..queryChanged('flow')
        ..queryChanged('flows');
      await settle();

      expect(repository.requests, hasLength(3));
      expect(repository.requests.every((dto) => dto.query == 'flows'), isTrue);
    });

    test('exposes a count per tab, including an empty one', () async {
      cubit.queryChanged('flo');
      await settle();

      expect(cubit.state.countFor(SearchType.business), 4);
      expect(cubit.state.countFor(SearchType.instructor), 1);
      expect(cubit.state.countFor(SearchType.service), 0);
    });

    test('dropping back below the minimum clears the results', () async {
      cubit.queryChanged('flo');
      await settle();
      cubit.queryChanged('f');
      await settle();

      expect(cubit.state.businessesRequest, isA<AsyncIdle<Object>>());
      expect(cubit.state.countFor(SearchType.business), isNull);
    });

    test('loadMore appends the next page of the selected tab', () async {
      cubit.queryChanged('flo');
      await settle();

      await cubit.loadMore();

      final page = (cubit.state.businessesRequest as AsyncSuccess).data;
      expect(page.items, hasLength(4));
      expect(page.currentPage, 2);
      expect(page.hasMore, isFalse);
      expect(cubit.state.isLoadingMore, isFalse);
      expect(repository.requests.last.page, 2);
    });

    test('loadMore is a no-op once the last page is loaded', () async {
      cubit.queryChanged('flo');
      await settle();
      await cubit.loadMore();

      final requestCount = repository.requests.length;
      await cubit.loadMore();

      expect(repository.requests, hasLength(requestCount));
    });

    test('loadMore is a no-op for a tab with a single page', () async {
      cubit.queryChanged('flo');
      await settle();
      cubit.typeSelected(SearchType.instructor);

      final requestCount = repository.requests.length;
      await cubit.loadMore();

      expect(repository.requests, hasLength(requestCount));
    });
  });
}
