import 'package:sealed_generators/src/utils/join_utils.dart';
import 'package:test/test.dart';

void main() {
  group('extension JoinUtils', () {
    test('method joinArgs', () {
      expect(<String>[].joinArgs(), equals(''));
      expect(['a'].joinArgs(), equals('a'));
      expect(['a', 'b'].joinArgs(), equals('a, b'));
      expect(['a', 'b', 'c'].joinArgs(), equals('a, b, c'));
    });
  });
}
