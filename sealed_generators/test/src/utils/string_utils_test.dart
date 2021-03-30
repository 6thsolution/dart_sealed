import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('extension StringUtilsIterable', () {
    test('method joinArgs', () {
      expect(<String>[].joinArgs(), equals(''));
      expect(['a'].joinArgs(), equals('a'));
      expect(['a', 'b'].joinArgs(), equals('a, b,'));
    });
  });

  group('extension StringUtils', () {
    test('method withBraces', () {
      expect('abc'.withBraces(), equals('{abc}'));
    });

    test('method withParenthesis', () {
      expect('abc'.withParenthesis(), equals('(abc)'));
    });
  });
}
