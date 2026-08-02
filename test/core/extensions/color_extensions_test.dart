import 'package:coflow_users_v2/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HexColorParsing', () {
    test('parses a 6-digit hex string with a leading hash', () {
      expect('#fe9e12'.toColorOrNull(), const Color(0xFFFE9E12));
    });

    test('parses a 6-digit hex string without a leading hash', () {
      expect('fe9e12'.toColorOrNull(), const Color(0xFFFE9E12));
    });

    test('parses an 8-digit ARGB hex string', () {
      expect('80fe9e12'.toColorOrNull(), const Color(0x80FE9E12));
    });

    test('returns null for malformed input', () {
      expect('garbage'.toColorOrNull(), isNull);
    });

    test('returns null for empty input', () {
      expect(''.toColorOrNull(), isNull);
    });
  });
}
