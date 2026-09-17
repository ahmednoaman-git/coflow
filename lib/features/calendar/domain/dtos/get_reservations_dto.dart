/// Request for the user's reservations within a date window.
///
/// Plain const class (not JSON-serialized) — [startDate]/[endDate] are sent as
/// `yyyy-MM-dd` query parameters by the data source.
class GetReservationsDto {
  const GetReservationsDto({required this.startDate, required this.endDate});

  /// First day of the window, inclusive.
  final DateTime startDate;

  /// Last day of the window, inclusive.
  final DateTime endDate;
}
