import 'dart:io';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'support_requests_state.dart';

/// The customer's support requests, page by page, and sending a new one.
@injectable
class SupportRequestsCubit extends Cubit<SupportRequestsState> {
  SupportRequestsCubit(this._getRequests, this._createRequest)
    : super(const SupportRequestsState()) {
    requestsManager = PaginatedRequestManager(
      accessor: (
        getPartialState: (state) => state.requestsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(requestsRequest: partial),
      ),
      nextPageAccessor: (
        getPartialState: (state) => state.nextPageRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(nextPageRequest: partial),
      ),
      emit: _emitIfOpen,
      requestPage: (page) => _getRequests(GetSupportRequestsDto(page: page)),
      nextPageOf: (data) => data.hasMore ? data.currentPage + 1 : null,
      merge: (current, next) => current.mergedWith(next),
      autoExecute: true,
    );

    createManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.createRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(createRequest: partial),
      ),
      emit: _emitIfOpen,
    );
  }

  final GetSupportRequestsUseCase _getRequests;
  final CreateSupportRequestUseCase _createRequest;

  late final PaginatedRequestManager<SupportRequestsState, PaginatedEntity<SupportRequestEntity>>
  requestsManager;
  late final AsyncRequestManager<SupportRequestsState, void> createManager;

  Future<void> refresh() => requestsManager.refresh();

  Future<void> loadMore() => requestsManager.loadMore();

  /// Sends a request, then reloads the list so it shows at the top with the
  /// id and status the server gave it.
  Future<void> create({required String issue, File? image}) async {
    await createManager.execute(
      _createRequest(CreateSupportRequestDto(issue: issue.trim(), image: image)),
    );
    if (createManager.isSuccess) await refresh();
  }

  void _emitIfOpen(SupportRequestsState state) {
    if (!isClosed) emit(state);
  }

  @override
  Future<void> close() {
    requestsManager.dispose();
    return super.close();
  }
}
