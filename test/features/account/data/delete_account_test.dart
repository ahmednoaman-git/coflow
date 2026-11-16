import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/account/data/datasources/datasources.dart';
import 'package:coflow_users_v2/features/account/data/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

/// Only `deleteAccount` is exercised; nothing here reaches a server.
class _FakeRemote implements ProfileRemoteDataSource {
  _FakeRemote({this.failure});

  final Failure? failure;
  int deleteCalls = 0;

  @override
  AsyncTask<void> deleteAccount() {
    deleteCalls++;
    return failure == null ? TaskEither.right(null) : TaskEither.left(failure!);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeAuth implements AuthStateManager {
  int clearCalls = 0;

  @override
  AsyncTask<void> clearAuth() {
    clearCalls++;
    return TaskEither.right(null);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('ProfileRepositoryImpl.deleteAccount', () {
    test('signs out once the server deleted the account', () async {
      final remote = _FakeRemote();
      final auth = _FakeAuth();

      final result = await ProfileRepositoryImpl(remote, auth).deleteAccount().run();

      expect(result.isRight(), isTrue);
      expect(remote.deleteCalls, 1);
      expect(auth.clearCalls, 1);
    });

    test('keeps the session when the server refused', () async {
      final remote = _FakeRemote(failure: const ServerFailure('nope'));
      final auth = _FakeAuth();

      final result = await ProfileRepositoryImpl(remote, auth).deleteAccount().run();

      expect(result.isLeft(), isTrue);
      expect(auth.clearCalls, 0);
    });
  });
}
