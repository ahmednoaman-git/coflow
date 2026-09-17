/// Where the signed-in customer stands on a given slot.
enum SessionViewerState {
  /// Neither reserved nor queued.
  none,

  /// Holds a reservation — one accessible ticket has been deducted.
  reserved,

  /// Queued for a spot. Costs nothing until it converts to a reservation.
  waitlisted,
}
