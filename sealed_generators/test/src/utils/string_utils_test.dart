import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('extension StringUtilsIterable', () {
    test('method joinArgs', () {
      expect(<String>[].joinArgs(), equals(''));
      expect(['a'].joinArgs(), equals('a'));
      expect(['a', 'b'].joinArgs(), equals('a, b,'));
    });

    test('method joinArgsSimple', () {
      expect(<String>[].joinArgsSimple(), equals(''));
      expect(['a'].joinArgsSimple(), equals('a'));
      expect(['a', 'b'].joinArgsSimple(), equals('a, b'));
    });

    test('method joinMethods', () {
      expect(<String>[].joinMethods(), equals(''));
      expect(['a'].joinMethods(), equals('a'));
      expect(['a', 'b'].joinMethods(), equals('a\n\nb'));
    });

    test('method joinLines', () {
      expect(<String>[].joinLines(), equals(''));
      expect(['a'].joinLines(), equals('a'));
      expect(['a', 'b'].joinLines(), equals('a\nb'));
    });

    test('method joinParts', () {
      expect(<String>[].joinParts(), equals(''));
      expect(['a'].joinParts(), equals('a'));
      expect(['a', 'b'].joinParts(), equals('ab'));
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

    test('method withLtGt', () {
      expect('abc'.withLtGt(), equals('<abc>'));
    });
  });
}
