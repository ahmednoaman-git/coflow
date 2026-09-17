/// One reachable value inside a contact channel.
class ReservationContactLinkModel {
  const ReservationContactLinkModel({required this.value, this.label});

  /// The phone number or URL.
  final String value;

  /// `Mobile`, `Landline`, ... when the backend labelled it.
  final String? label;
}

/// A reservation contact as the API sends it.
///
/// `reservation_contact` is the messiest field on the profile payload: the
/// backend has changed its shape twice without migrating old rows, so all of
/// the following come back from the live API today and every one of them has to
/// parse:
///
/// ```jsonc
/// ["Instagram"]                                                  // 1. bare label, nothing behind it
/// [{"selectSocial": "Website", "link": "https://..."}]           // 2. legacy, link is a URL
/// [{"selectSocial": "Contact Number", "link": "01010702790"}]    // 3. legacy, link is one number
/// [{"selectSocial": "Contact Number",                            // 4. legacy, link is a phone list
///   "link": [{"type": "Mobile", "number": "01010073663"}]}]
/// [{"id": 521, "name": "Whatsapp", "url": "00971600511115"}]     // 5. current, value sits in `url`
/// [{"name": "Contact Number", "url": "contact_number",           // 6. current, `url` is a slug and
///   "link": [{"id": 407, "name": "Landline", "phone": "19019"}]}]//    the numbers sit in `link`
/// ```
///
/// Note shapes 5 and 6 disagree about what `url` means — a real value in one, a
/// slugified copy of `name` in the other — which [_valueFrom] resolves by
/// comparing it against the label.
class ReservationContactModel {
  const ReservationContactModel({
    required this.name,
    this.links = const <ReservationContactLinkModel>[],
  });

  /// The channel label the facility authored (`Whatsapp`, `Contact Number`, ...).
  final String name;

  /// Every value behind the channel. Empty for shape 1, and for any facility
  /// that picked a channel but never filled it in.
  final List<ReservationContactLinkModel> links;

  /// Parses the whole `reservation_contact` field, skipping entries that carry
  /// no usable label. Never throws: a contact block is decoration on the
  /// profile screen and must not take the screen down with it.
  static List<ReservationContactModel> listFromJson(dynamic raw) {
    if (raw is! List) return const <ReservationContactModel>[];

    return raw
        .map(ReservationContactModel._fromEntry)
        .whereType<ReservationContactModel>()
        .toList(growable: false);
  }

  static ReservationContactModel? _fromEntry(dynamic entry) {
    if (entry is String) {
      final name = entry.trim();
      return name.isEmpty ? null : ReservationContactModel(name: name);
    }
    if (entry is! Map) return null;

    final json = entry.cast<String, dynamic>();
    final name = _firstString(json, const ['name', 'selectSocial', 'select_social']);
    if (name == null) return null;

    final links = <ReservationContactLinkModel>[
      ..._linksFrom(json['link']),
      ..._linksFrom(json['links']),
    ];

    if (links.isEmpty) {
      final value = _valueFrom(json, name);
      if (value != null) links.add(ReservationContactLinkModel(value: value));
    }

    return ReservationContactModel(name: name, links: List.unmodifiable(links));
  }

  /// Reads the channel's own value off `url`, ignoring it when it is just a
  /// slugified echo of the label (shape 6: `"name": "Contact Number"` with
  /// `"url": "contact_number"`).
  static String? _valueFrom(Map<String, dynamic> json, String name) {
    final url = _firstString(json, const ['url', 'value']);
    if (url == null) return null;
    return _squash(url) == _squash(name) ? null : url;
  }

  /// Normalizes whatever sits under `link` into a flat list of values.
  static List<ReservationContactLinkModel> _linksFrom(dynamic raw) {
    if (raw == null) return const <ReservationContactLinkModel>[];

    if (raw is String) {
      final value = raw.trim();
      return value.isEmpty
          ? const <ReservationContactLinkModel>[]
          : [ReservationContactLinkModel(value: value)];
    }

    if (raw is List) {
      return raw
          .map(_linkFromEntry)
          .whereType<ReservationContactLinkModel>()
          .toList(growable: false);
    }

    if (raw is Map) return [_linkFromEntry(raw)].whereType<ReservationContactLinkModel>().toList();

    return const <ReservationContactLinkModel>[];
  }

  static ReservationContactLinkModel? _linkFromEntry(dynamic entry) {
    if (entry is String) {
      final value = entry.trim();
      return value.isEmpty ? null : ReservationContactLinkModel(value: value);
    }
    if (entry is! Map) return null;

    final json = entry.cast<String, dynamic>();
    // `phone`/`number` for phone lists, `url`/`link` for social lists.
    final value = _firstString(json, const ['phone', 'number', 'url', 'link', 'value']);
    if (value == null) return null;

    // Shape 6 labels the number with `name`, shape 4 with `type`.
    return ReservationContactLinkModel(
      value: value,
      label: _firstString(json, const ['name', 'type', 'label']),
    );
  }

  static String? _firstString(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value == null) continue;
      final text = value.toString().trim();
      if (text.isNotEmpty) return text;
    }
    return null;
  }

  static String _squash(String value) => value.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), '');
}
