/// Request to drop a facility from the user's saved profiles.
class UnsaveProfileDto {
  const UnsaveProfileDto({required this.profileId});

  final int profileId;
}
