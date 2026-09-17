import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_entity.freezed.dart';

/// One page of a Laravel-style paginated listing, plus the cursor information
/// needed to ask for the next one.
@freezed
abstract class PaginatedEntity<T> with _$PaginatedEntity<T> {
  const PaginatedEntity._();

  const factory PaginatedEntity({
    required List<T> items,
    required int currentPage,
    required int lastPage,
    required int total,
  }) = _PaginatedEntity<T>;

  /// An empty first page — used as the result of a request that was never sent.
  static PaginatedEntity<T> empty<T>() =>
      PaginatedEntity<T>(items: const [], currentPage: 1, lastPage: 1, total: 0);

  bool get hasMore => currentPage < lastPage;

  bool get isEmpty => items.isEmpty;

  /// Appends [next]'s items to this page, keeping [next]'s cursor.
  PaginatedEntity<T> mergedWith(PaginatedEntity<T> next) => PaginatedEntity<T>(
    items: [...items, ...next.items],
    currentPage: next.currentPage,
    lastPage: next.lastPage,
    total: next.total,
  );
}
