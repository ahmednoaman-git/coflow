import 'dart:async';

import 'package:injectable/injectable.dart';

/// What the server now holds for a facility's save and tracking flags, as
/// learned by whoever changed them.
final class FacilitySaveChange {
  const FacilitySaveChange({
    required this.facilityId,
    required this.isSaved,
    required this.isTracked,
    required this.source,
  });

  final int facilityId;
  final bool isSaved;
  final bool isTracked;

  /// Who reported it, so it can skip its own report.
  final Object source;
}

/// Keeps every screen showing a facility's save/track flags in step: a screen
/// that changes them reports it here, and the others — a facility profile left
/// open in another tab, the saved list — fold it into what they show.
///
/// Only changes the server has taken are reported, never optimistic ones.
@lazySingleton
class FacilitySaveEvents {
  final _changes = StreamController<FacilitySaveChange>.broadcast(sync: true);

  /// Every reported change, as it is reported.
  Stream<FacilitySaveChange> get changes => _changes.stream;

  void report(FacilitySaveChange change) => _changes.add(change);

  @disposeMethod
  Future<void> dispose() => _changes.close();
}
