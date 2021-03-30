import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:test/test.dart';

void main() {
  group('class NameUtils', () {
    test('method startWithUpper', () {
      expect(() => ''.startWithUpper(), throwsA(anything));
      expect(() => ' d '.startWithUpper(), throwsA(anything));
      expect(() => '_A'.startWithUpper(), throwsA(anything));

      expect('Apple'.startWithUpper(), equals(true));
      expect('apple'.startWithUpper(), equals(false));
    });

    test('method startWithLower', () {
      expect(() => ''.startWithLower(), throwsA(anything));
      expect(() => ' d '.startWithLower(), throwsA(anything));
      expect(() => '_A'.startWithLower(), throwsA(anything));

      expect('Apple'.startWithLower(), equals(false));
      expect('apple'.startWithLower(), equals(true));
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
