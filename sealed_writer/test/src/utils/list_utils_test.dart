import 'package:sealed_writer/src/utils/list_utils.dart';
import 'package:test/test.dart';

void main() {
  group('extension ListUtils', () {
    test('method isSingle', () {
      expect(<int>[].isSingle, isFalse);
      expect([1].isSingle, isTrue);
      expect([1, 2].isSingle, isFalse);
    });

    test('method isSingleOrEmpty', () {
      expect(<int>[].isSingleOrEmpty, isTrue);
      expect([1].isSingleOrEmpty, isTrue);
      expect([1, 2].isSingleOrEmpty, isFalse);
    });

    test('method isSingle', () {
      expect(<int>[].firstOrNull, isNull);
      expect([1].firstOrNull, equals(1));
      expect([1, 2].firstOrNull, equals(1));
    });
  });
}
