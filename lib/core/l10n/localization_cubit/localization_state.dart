part of 'localization_cubit.dart';

@freezed
abstract class LocalizationState with _$LocalizationState {
  const factory LocalizationState({
    Locale? locale,
  }) = _LocalizationState;
}
