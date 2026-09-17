import '../enums/enums.dart';

/// Request DTO for the search endpoint.
///
/// Matches backend API: GET {{userUrl}}search?search=&type=&page=
class SearchDto {
  const SearchDto({
    required this.query,
    required this.type,
    this.page = 1,
  });

  /// The user's query. The backend requires at least
  /// `SearchConstants.minQueryLength` characters.
  final String query;

  /// Which result set to fetch. Required by the API.
  final SearchType type;

  /// 1-based page cursor.
  final int page;

  Map<String, dynamic> toQueryParameters() => {
    'search': query,
    'type': type.queryParam,
    'page': page,
  };

  SearchDto copyWith({String? query, SearchType? type, int? page}) => SearchDto(
    query: query ?? this.query,
    type: type ?? this.type,
    page: page ?? this.page,
  );
}
