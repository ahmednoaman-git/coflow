import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/facility_contact_channel.dart';

part 'facility_contact_entity.freezed.dart';

/// A single reachable value inside a contact channel — one phone number, one
/// profile URL.
///
/// A channel can hold several (a facility commonly publishes both a landline
/// and a mobile), which is why the value is not folded into the channel itself.
@freezed
abstract class FacilityContactLinkEntity with _$FacilityContactLinkEntity {
  const factory FacilityContactLinkEntity({
    /// The number or URL to launch.
    required String value,

    /// What the facility called it (`Mobile`, `Landline`, ...), when labelled.
    String? label,
  }) = _FacilityContactLinkEntity;
}

/// One contact channel on a facility profile, e.g. WhatsApp or the phone
/// numbers behind the "Contact Number" button.
@freezed
abstract class FacilityContactEntity with _$FacilityContactEntity {
  const factory FacilityContactEntity({
    required FacilityContactChannel channel,

    /// The label the facility authored, kept for channels the app does not
    /// recognize so the UI can still name them.
    required String label,
    @Default(<FacilityContactLinkEntity>[]) List<FacilityContactLinkEntity> links,
  }) = _FacilityContactEntity;

  const FacilityContactEntity._();

  /// A channel with no value behind it is decoration — the backend sends these
  /// for facilities that picked a channel but never filled it in.
  bool get isActionable => links.isNotEmpty;

  /// True when tapping has to ask the user which value to use.
  bool get needsChoice => links.length > 1;
}
