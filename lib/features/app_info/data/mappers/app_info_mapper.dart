import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class AppInfoMapper {
  static AppInfoEntity toEntity(AppInfoModel model) => AppInfoEntity(
    terms: _text(model.terms),
    privacyPolicy: _text(model.policy),
    email: _text(model.email),
    phone: _text(model.phone),
  );

  /// Blank texts count as unset, so the screen shows its empty state.
  static String? _text(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }
}
