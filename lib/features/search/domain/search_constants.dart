/// Rules the search feature shares between the cubit and the UI.
abstract final class SearchConstants {
  /// The backend rejects anything shorter ("The search must be at least 3
  /// characters"), so the UI holds the request back until the query reaches it.
  static const int minQueryLength = 3;

  /// How long typing must pause before the three requests go out.
  static const Duration debounce = Duration(milliseconds: 400);
}
