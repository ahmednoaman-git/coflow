import 'dart:io';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import 'account_info_state.dart';

/// The writes made from Account Information: details, photo and password.
///
/// The profile itself stays in [ProfileCubit]; the screens hand it each saved
/// profile (see `ProfileCubit.replaceProfile`), so the nav bar avatar and the
/// Account screen update with it.
@injectable
class AccountInfoCubit extends Cubit<AccountInfoState> {
  AccountInfoCubit(
    this._updateProfile,
    this._changeImage,
    this._changePassword,
    this._getNationalities,
    this._deleteAccount,
  ) : super(const AccountInfoState()) {
    deleteManager = .new(
      accessor: (
        getPartialState: (state) => state.deleteRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(deleteRequest: partial),
      ),
      emit: _emitIfOpen,
    );

    updateManager = .new(
      accessor: (
        getPartialState: (state) => state.updateRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(updateRequest: partial),
      ),
      emit: _emitIfOpen,
    );

    imageManager = .new(
      accessor: (
        getPartialState: (state) => state.imageRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(imageRequest: partial),
      ),
      emit: _emitIfOpen,
    );

    passwordManager = .new(
      accessor: (
        getPartialState: (state) => state.passwordRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(passwordRequest: partial),
      ),
      emit: _emitIfOpen,
    );

    nationalitiesManager = .new(
      accessor: (
        getPartialState: (state) => state.nationalitiesRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(nationalitiesRequest: partial),
      ),
      emit: _emitIfOpen,
      defaultRequest: _getNationalities(),
    );
  }

  final UpdateProfileUseCase _updateProfile;
  final ChangeProfileImageUseCase _changeImage;
  final ChangePasswordUseCase _changePassword;
  final GetNationalitiesUseCase _getNationalities;
  final DeleteAccountUseCase _deleteAccount;

  /// Deleting the account; on success the session is already cleared.
  late final AsyncRequestManager<AccountInfoState, void> deleteManager;

  Future<void> deleteAccount() {
    if (deleteManager.isLoading) return Future.value();
    return deleteManager.execute(_deleteAccount());
  }

  late final AsyncRequestManager<AccountInfoState, ProfileEntity> updateManager;
  late final AsyncRequestManager<AccountInfoState, ProfileEntity> imageManager;
  late final AsyncRequestManager<AccountInfoState, void> passwordManager;
  late final AsyncRequestManager<AccountInfoState, List<NationalityEntity>> nationalitiesManager;

  Future<void> updateProfile(UpdateProfileDto dto) => updateManager.execute(_updateProfile(dto));

  Future<void> changeImage(File image) =>
      imageManager.execute(_changeImage(ChangeProfileImageDto(image: image)));

  Future<void> changePassword(String newPassword) =>
      passwordManager.execute(_changePassword(ChangePasswordDto(newPassword: newPassword)));

  /// Loads the nationality list the first time the picker opens, and again
  /// after a failure; a loaded list is kept for the rest of the screen.
  Future<void> loadNationalities() async {
    if (nationalitiesManager.isLoading || nationalitiesManager.isSuccess) return;
    await nationalitiesManager.execute();
  }

  void _emitIfOpen(AccountInfoState nextState) {
    if (!isClosed) emit(nextState);
  }
}
