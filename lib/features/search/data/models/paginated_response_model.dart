/// One page of a Laravel paginator payload.
///
/// Hand-written rather than generated: the item type varies per search type,
/// and `json_serializable`'s generic support would cost more ceremony than the
/// four fields the app actually reads.
class PaginatedResponseModel<T> {
  const PaginatedResponseModel({
    required this.items,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<T> items;
  final int currentPage;
  final int lastPage;
  final int total;

  factory PaginatedResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) itemFromJson,
  ) {
    final rawItems = (json['data'] as List<dynamic>? ?? const <dynamic>[])
        .cast<Map<String, dynamic>>()
        .map(itemFromJson)
        .toList(growable: false);

    return PaginatedResponseModel<T>(
      items: rawItems,
      currentPage: _asInt(json['current_page']) ?? 1,
      lastPage: _asInt(json['last_page']) ?? 1,
      total: _asInt(json['total']) ?? rawItems.length,
    );
  }

  /// The paginator reports its counters as numbers, but a few endpoints hand
  /// them back as strings.
  static int? _asInt(dynamic value) => switch (value) {
    final int value => value,
    final String value => int.tryParse(value),
    final num value => value.toInt(),
    _ => null,
  };
}
