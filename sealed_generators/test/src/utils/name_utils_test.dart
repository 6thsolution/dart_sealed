import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:test/test.dart';

void main() {
  group('class NameUtils', () {
    test('method startWithUpper', () {
      expect(() => NameUtils.startWithUpper(''), throwsA(anything));
      expect(() => NameUtils.startWithUpper(' d '), throwsA(anything));
      expect(() => NameUtils.startWithUpper('_A'), throwsA(anything));

      expect(NameUtils.startWithUpper('Apple'), equals(true));
      expect(NameUtils.startWithUpper('apple'), equals(false));
    });

    test('method startWithLower', () {
      expect(() => NameUtils.startWithLower(''), throwsA(anything));
      expect(() => NameUtils.startWithLower(' d '), throwsA(anything));
      expect(() => NameUtils.startWithLower('_A'), throwsA(anything));

      expect(NameUtils.startWithLower('Apple'), equals(false));
      expect(NameUtils.startWithLower('apple'), equals(true));
    });

    test('method toUpperStart', () {
      expect(() => NameUtils.toUpperStart(''), throwsA(anything));
      expect(() => NameUtils.toUpperStart(' d '), throwsA(anything));
      expect(() => NameUtils.toUpperStart('_A'), throwsA(anything));

      expect(NameUtils.toUpperStart('Apple'), equals('Apple'));
      expect(NameUtils.toUpperStart('apple'), equals('Apple'));
    });

    test('method toLowerStart', () {
      expect(() => NameUtils.toLowerStart(''), throwsA(anything));
      expect(() => NameUtils.toLowerStart(' d '), throwsA(anything));
      expect(() => NameUtils.toLowerStart('_A'), throwsA(anything));

      expect(NameUtils.toLowerStart('Apple'), equals('apple'));
      expect(NameUtils.toLowerStart('apple'), equals('apple'));
    });
  });
}
