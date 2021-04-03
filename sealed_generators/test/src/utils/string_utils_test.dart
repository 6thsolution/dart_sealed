import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('extension StringUtilsIterable', () {
    test('method joinArgs', () {
      expect(<String>[].joinArgs(), equals(''));
      expect(['a'].joinArgs(), equals('a'));
      expect(['a', 'b'].joinArgs(), equals('a, b,'));
    });

    test('method joinMethods', () {
      expect(<String>[].joinMethods(), equals(''));
      expect(['a'].joinMethods(), equals('a'));
      expect(['a', 'b'].joinMethods(), equals('a\n\nb'));
    });
  });

  group('extension StringUtils', () {
    test('method withBraces', () {
      expect('abc'.withBraces(), equals('{abc}'));
    });

    test('method withBracesOrNot', () {
      expect('abc'.withBracesOrNot(), equals('{abc}'));
      expect(''.withBracesOrNot(), equals(''));
      expect(' '.withBracesOrNot(), equals(''));
    });

    test('method withParenthesis', () {
      expect('abc'.withParenthesis(), equals('(abc)'));
    });
  });
}
