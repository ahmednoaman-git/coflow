import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'activity_preferences_state.dart';

/// Activity Preferences: the tags on offer, the customer's picks being edited,
/// and saving them.
@injectable
class ActivityPreferencesCubit extends Cubit<ActivityPreferencesState> {
  ActivityPreferencesCubit(this._getPreferences, this._savePreferences)
    : super(const ActivityPreferencesState()) {
    preferencesManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.preferencesRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(preferencesRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _getPreferences(),
      refreshInBackground: true,
    );

    saveManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.saveRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(saveRequest: partial),
      ),
      emit: _emitIfOpen,
    );
  }

  final GetActivityPreferencesUseCase _getPreferences;
  final SaveActivityPreferencesUseCase _savePreferences;

  late final AsyncRequestManager<ActivityPreferencesState, ActivityPreferencesEntity>
  preferencesManager;
  late final AsyncRequestManager<ActivityPreferencesState, void> saveManager;

  Future<void> refresh() => preferencesManager.refresh();

  void toggle(int tagId) {
    final draft = Set<int>.of(state.selectedTagIds);
    if (!draft.remove(tagId)) draft.add(tagId);
    emit(state.copyWith(draft: draft));
  }

  /// Sends the whole selection; once the server has it, it becomes the saved
  /// selection and the draft is dropped.
  Future<void> save() async {
    if (!state.canSave || saveManager.isLoading) return;
    final selection = state.selectedTagIds;
    final tagIds = selection.toList()..sort();

    await saveManager.execute(_savePreferences(SaveActivityPreferencesDto(tagIds: tagIds)));
    if (!saveManager.isSuccess || isClosed) return;

    preferencesManager.update((data) => data.copyWith(selectedTagIds: selection));
    emit(state.copyWith(draft: null));
  }

  void _emitIfOpen(ActivityPreferencesState state) {
    if (!isClosed) emit(state);
  }
}
