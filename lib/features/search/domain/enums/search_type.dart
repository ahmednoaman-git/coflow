/// The three result sets the `search` endpoint can return. Each is a separate
/// request — the API requires an explicit `type` and has no "all" mode.
enum SearchType {
  business,
  instructor,
  service
  ;

  /// Value sent as the `type` query parameter.
  String get queryParam => name;
}
