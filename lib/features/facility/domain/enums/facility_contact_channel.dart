/// A way to reach a facility, normalized from the free-text label the backend
/// stores against each reservation contact.
///
/// The label is authored per facility, so matching is done on a squashed,
/// lower-cased form (`Contact Number`, `contact_number` and `ContactNumber` all
/// land on [contactNumber]).
enum FacilityContactChannel {
  /// One or more phone numbers, dialled rather than opened.
  contactNumber,
  whatsapp,
  instagram,
  facebook,
  youtube,
  website,
  email,

  /// A channel the app has no icon or launch rule for; opened as a plain URL.
  other
  ;

  /// Whether the channel's values are phone numbers rather than URLs.
  bool get isPhone => this == contactNumber || this == whatsapp;

  /// Maps a backend label (`name`, `selectSocial`, or the `url` slug) onto a
  /// channel, falling back to [other] so an unknown channel is still shown.
  static FacilityContactChannel fromApi(String? label) {
    final normalized = _squash(label);
    if (normalized.isEmpty) return other;

    return switch (normalized) {
      'contactnumber' || 'phone' || 'phonenumber' || 'mobile' || 'landline' => contactNumber,
      'whatsapp' || 'whatsup' => whatsapp,
      'instagram' || 'insta' => instagram,
      'facebook' || 'fb' => facebook,
      'youtube' => youtube,
      'website' || 'link' || 'web' || 'url' => website,
      'email' || 'mail' || 'emailaddress' => email,
      _ => other,
    };
  }

  /// Lower-cases and drops everything that is not a letter or digit, so the
  /// spacing and casing a facility used cannot change the match.
  static String _squash(String? value) {
    if (value == null) return '';
    return value.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), '');
  }
}
