/// Request to turn update-tracking on or off for a saved profile.
class SetProfileTrackingDto {
  const SetProfileTrackingDto({required this.profileId, required this.isTracked});

  final int profileId;

  /// The state being asked for, not a toggle — so a retry is idempotent.
  final bool isTracked;
}
