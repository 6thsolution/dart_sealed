import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:test/test.dart';

void main() {
  group('extension NameUtils', () {
    test('method startWithUpper', () {
      expect(() => ''.startsWithUpper(), throwsA(anything));
      expect(() => ' d '.startsWithUpper(), throwsA(anything));
      expect(() => '_A'.startsWithUpper(), throwsA(anything));

      expect('Apple'.startsWithUpper(), equals(true));
      expect('apple'.startsWithUpper(), equals(false));
    });

    test('method startWithLower', () {
      expect(() => ''.startsWithLower(), throwsA(anything));
      expect(() => ' d '.startsWithLower(), throwsA(anything));
      expect(() => '_A'.startsWithLower(), throwsA(anything));

      expect('Apple'.startsWithLower(), equals(false));
      expect('apple'.startsWithLower(), equals(true));
    });

    test('method toUpperStart', () {
      expect(() => ''.toUpperStart(), throwsA(anything));
      expect(() => ' d '.toUpperStart(), throwsA(anything));
      expect(() => '_A'.toUpperStart(), throwsA(anything));

      expect(() => 'Apple'.toUpperStart(), throwsA(anything));

      expect('apple'.toUpperStart(), equals('Apple'));
    });

    test('method toLowerStart', () {
      expect(() => ''.toLowerStart(), throwsA(anything));
      expect(() => ' d '.toLowerStart(), throwsA(anything));
      expect(() => '_A'.toLowerStart(), throwsA(anything));

      expect('Apple'.toLowerStart(), equals('apple'));

      expect(() => 'apple'.toLowerStart(), throwsA(anything));
    });
  });
}
