import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_request_entity.freezed.dart';

/// Where a support request is in the admin's workflow.
enum SupportRequestStatus {
  /// Sent, not picked up yet (`new`).
  open,

  /// An admin is on it (`pending`).
  pending,

  /// Closed by an admin (`resolved`).
  resolved,

  /// A status this app doesn't know yet; the raw value is kept beside it.
  other,
}

/// A problem the customer reported to Coflow.
@freezed
abstract class SupportRequestEntity with _$SupportRequestEntity {
  const factory SupportRequestEntity({
    required int id,

    /// What the customer wrote.
    required String issue,
    required SupportRequestStatus status,

    /// The server's status string, shown as-is for [SupportRequestStatus.other].
    required String rawStatus,

    /// The admin's reply, or null before they write one.
    String? adminNote,

    /// The screenshot the customer attached, if any.
    String? imageUrl,
    DateTime? createdAt,
  }) = _SupportRequestEntity;
}
