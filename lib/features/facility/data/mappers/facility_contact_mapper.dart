import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../models/models.dart';

/// Maps the facility's contact details onto contact channels, for two uses:
///
/// * [fromDetails] — the profile's `phones` and `links`: every way to reach
///   the facility, shown as the button row on its profile.
/// * [toEntities] — `reservation_contact`: the channels the facility takes
///   reservations through, offered when a session cannot be booked in-app.
///   The current backend stores only the channel's *name* there
///   (`["Instagram"]`, `["Contact Number"]`), so a channel that arrives without
///   a value is filled from `phones`/`links`: `Contact Number` takes every
///   phone, any other channel takes the link of the same name. Older rows that
///   carry their value inline keep it.
abstract final class FacilityContactMapper {
  /// One button per channel, phones first: every number folds into a single
  /// Contact Number channel, and links sharing a channel (two Instagram
  /// accounts, say) fold into one that asks which to open.
  static List<FacilityContactEntity> fromDetails({
    List<FacilityContactDetailModel> phones = const [],
    List<FacilityContactDetailModel> links = const [],
  }) {
    final contacts = <FacilityContactEntity>[];

    if (phones.isNotEmpty) {
      contacts.add(
        FacilityContactEntity(
          channel: FacilityContactChannel.contactNumber,
          // The API's own name for this channel, as `reservation_contact` uses.
          label: 'Contact Number',
          links: [
            for (final phone in phones)
              FacilityContactLinkEntity(value: phone.value, label: _cleanLabel(phone.name)),
          ],
        ),
      );
    }

    // Keyed on the channel, or on the name for channels the app does not know,
    // so two unrelated unknown links stay separate buttons.
    final byChannel = <String, FacilityContactEntity>{};
    for (final link in links) {
      final label = link.name?.trim() ?? '';
      final channel = FacilityContactChannel.fromApi(label);
      final key = channel == FacilityContactChannel.other
          ? 'other:${label.toLowerCase()}'
          : channel.name;
      final value = FacilityContactLinkEntity(value: link.value);

      byChannel.update(
        key,
        (contact) => contact.copyWith(links: [...contact.links, value]),
        ifAbsent: () => FacilityContactEntity(channel: channel, label: label, links: [value]),
      );
    }

    return List.unmodifiable([...contacts, ...byChannel.values]);
  }

  static List<FacilityContactEntity> toEntities(
    List<ReservationContactModel> models, {
    List<FacilityContactDetailModel> phones = const [],
    List<FacilityContactDetailModel> links = const [],
  }) {
    return models
        .map((model) => toEntity(model, phones: phones, links: links))
        .toList(growable: false);
  }

  static FacilityContactEntity toEntity(
    ReservationContactModel model, {
    List<FacilityContactDetailModel> phones = const [],
    List<FacilityContactDetailModel> links = const [],
  }) {
    final label = model.name.trim();
    final channel = FacilityContactChannel.fromApi(label);

    final values = model.links.isNotEmpty
        ? model.links.map((link) => (value: link.value, label: link.label))
        : _lookUp(channel, label, phones: phones, links: links);

    return FacilityContactEntity(
      channel: channel,
      label: label,
      links: values
          .map(
            (link) => FacilityContactLinkEntity(
              value: link.value.trim(),
              label: _cleanLabel(link.label),
            ),
          )
          .where((link) => link.value.isNotEmpty)
          .toList(growable: false),
    );
  }

  /// The values behind a channel `reservation_contact` only named.
  static Iterable<({String value, String? label})> _lookUp(
    FacilityContactChannel channel,
    String label, {
    required List<FacilityContactDetailModel> phones,
    required List<FacilityContactDetailModel> links,
  }) {
    if (channel == FacilityContactChannel.contactNumber) {
      return phones.map((phone) => (value: phone.value, label: phone.name));
    }

    // Matched on the channel rather than the raw text, so `Whatsapp` finds a
    // link named `WhatsApp`; unrecognized channels have to match by name.
    return links
        .where(
          (link) => channel == FacilityContactChannel.other
              ? link.name?.trim().toLowerCase() == label.toLowerCase()
              : FacilityContactChannel.fromApi(link.name) == channel,
        )
        .map((link) => (value: link.value, label: null));
  }

  static String? _cleanLabel(String? label) {
    final trimmed = label?.trim();
    return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
  }
}
