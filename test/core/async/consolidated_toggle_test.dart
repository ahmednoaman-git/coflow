import 'dart:async';

import 'package:coflow_users_v2/core/async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

const _settle = Duration(milliseconds: 20);

/// Lets the settle wait run out and any request finish.
Future<void> _settled() => Future<void>.delayed(_settle * 3);

/// A toggle endpoint that counts its calls; [gate], when set, holds the next
/// call open until completed, and [fail] makes calls fail.
class _Server {
  int calls = 0;
  bool fail = false;
  Completer<void>? gate;

  AsyncTask<void> toggle() => TaskEither(() async {
    calls++;
    await gate?.future;
    return fail ? const Left(NetworkFailure('offline')) : const Right(null);
  });
}

void main() {
  late _Server server;
  late List<bool> confirmed;
  late List<bool> settled;
  late List<bool> failed;

  ConsolidatedToggle open({bool value = false}) => ConsolidatedToggle(
    value: value,
    settle: _settle,
    send: server.toggle,
    onConfirmed: confirmed.add,
    onSettled: settled.add,
    onFailed: (_, value) => failed.add(value),
  );

  setUp(() {
    server = _Server();
    confirmed = [];
    settled = [];
    failed = [];
  });

  test('shows a tap at once and sends it once the taps settle', () async {
    final toggle = open()..flip();

    expect(toggle.value, isTrue);
    expect(toggle.confirmed, isFalse);
    expect(server.calls, 0);

    await _settled();
    expect(server.calls, 1);
    expect(toggle.confirmed, isTrue);
    expect(settled, [true]);
    expect(toggle.isPending, isFalse);
  });

  test('a burst of taps sends one call, or none when they cancel out', () async {
    final odd = open();
    for (var i = 0; i < 5; i++) {
      odd.flip();
    }
    await _settled();
    expect(server.calls, 1);
    expect(odd.confirmed, isTrue);

    final even = open();
    for (var i = 0; i < 4; i++) {
      even.flip();
    }
    await _settled();
    expect(server.calls, 1, reason: 'the even burst sent nothing');
    expect(even.value, isFalse);
    expect(settled, [true], reason: 'and reported nothing');
  });

  test('taps during a request are folded into one follow-up', () async {
    server.gate = Completer<void>();
    final toggle = open()..flip();
    await _settled(); // the save is out, held open

    toggle
      ..flip()
      ..flip()
      ..flip(); // net: unsave
    server.gate!.complete();
    server.gate = null;
    await _settled();

    expect(server.calls, 2);
    expect(confirmed, [true, false]);
    expect(toggle.confirmed, isFalse);
    expect(settled, [false], reason: 'reported once, for where the user ended up');
  });

  test('a failure puts the value back and reports it', () async {
    server.fail = true;
    final toggle = open(value: true)..flip();
    expect(toggle.value, isFalse);

    await _settled();
    expect(toggle.value, isTrue);
    expect(failed, [true]);
    expect(settled, isEmpty);

    server.fail = false;
    toggle.flip();
    await _settled();
    expect(toggle.confirmed, isFalse, reason: 'and the toggle keeps working');
  });

  test('closing sends an owed tap right away but reports nothing', () async {
    final toggle = open()..flip();
    await toggle.close();

    expect(server.calls, 1);
    expect(toggle.confirmed, isTrue);
    expect(confirmed, isEmpty);
    expect(settled, isEmpty);

    toggle.flip();
    await _settled();
    expect(server.calls, 1, reason: 'taps after closing are ignored');
  });

  test('discarding drops waiting taps and waits for a request already out', () async {
    final waiting = open()..flip();
    await waiting.discard();
    await _settled();
    expect(server.calls, 0);

    server.gate = Completer<void>();
    final out = open()..flip();
    await _settled(); // the request is out, held open
    out.flip(); // and a tap waits behind it

    var discarded = false;
    unawaited(out.discard().then((_) => discarded = true));
    await Future<void>.delayed(Duration.zero);
    expect(discarded, isFalse, reason: 'still waiting on the request');

    server.gate!.complete();
    await _settled();
    expect(discarded, isTrue);
    expect(server.calls, 1, reason: 'the tap behind it was dropped');
    expect(settled, isEmpty);
  });

  group('onChanged and onIdle', () {
    late List<bool> changed;
    late List<bool> idle;

    ConsolidatedToggle watched() => ConsolidatedToggle(
      value: false,
      settle: _settle,
      send: server.toggle,
      onChanged: changed.add,
      onIdle: idle.add,
    );

    setUp(() {
      changed = [];
      idle = [];
    });

    test('hear every tap, then idle once the server has it', () async {
      watched()
        ..flip()
        ..flip()
        ..flip();
      expect(changed, [true, false, true]);
      expect(idle, isEmpty);

      await _settled();
      expect(idle, [true]);
    });

    test('go idle without a call when the taps cancel out', () async {
      watched()
        ..flip()
        ..flip();
      await _settled();

      expect(server.calls, 0);
      expect(idle, [false]);
    });

    test('hear the value put back after a failure, then idle', () async {
      server.fail = true;
      watched().flip();
      await _settled();

      expect(changed, [true, false]);
      expect(idle, [false]);
    });

    test('discarding puts the value back and goes idle', () async {
      await (watched()..flip()).discard();

      expect(changed, [true, false]);
      expect(idle, [false]);
    });
  });
}
