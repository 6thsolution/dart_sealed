import 'package:sealed_generators/src/options/options.dart';
import 'package:test/test.dart';

import '../../utils/examples.dart';

void main() {
  group('class Options', () {
    test('initialization', () {
      expect(optionsLegacy.isNullSafe, isFalse);
      expect(optionsSafe.isNullSafe, isTrue);
    });

    test('toString', () {
      expect(
        optionsSafe.toString(),
        equals('Options{isNullSafe: true}'),
      );
    });

    test('equality', () {
      final a = Options(isNullSafe: true);
      final b = Options(isNullSafe: true);
      final c = Options(isNullSafe: false);

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });

    test('hashCode', () {
      final a = Options(isNullSafe: true);
      final b = Options(isNullSafe: true);
      final c = Options(isNullSafe: false);

      expect(a.hashCode, equals(a.hashCode));
      expect(a.hashCode, equals(b.hashCode));
      expect(a.hashCode, isNot(equals(c.hashCode)));
    });
  });
}
