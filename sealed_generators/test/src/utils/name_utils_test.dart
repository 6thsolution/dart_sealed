import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:test/test.dart';

import '../../utils/exception_utils.dart';

void main() {
  group('extension NameUtils', () {
    test('method startWithUpper', () {
      expect(() => ''.startsWithUpper(), throwsAssertion());
      expect(() => ' d '.startsWithUpper(), throwsAssertion());
      expect(() => '_A'.startsWithUpper(), throwsAssertion());

      expect('Apple'.startsWithUpper(), equals(true));
      expect('apple'.startsWithUpper(), equals(false));
    });

    test('method startWithLower', () {
      expect(() => ''.startsWithLower(), throwsAssertion());
      expect(() => ' d '.startsWithLower(), throwsAssertion());
      expect(() => '_A'.startsWithLower(), throwsAssertion());

      expect('Apple'.startsWithLower(), equals(false));
      expect('apple'.startsWithLower(), equals(true));
    });

    test('method toUpperStart', () {
      expect(() => ''.toUpperStart(), throwsAssertion());
      expect(() => ' d '.toUpperStart(), throwsAssertion());
      expect(() => '_A'.toUpperStart(), throwsAssertion());

      expect(() => 'Apple'.toUpperStart(), throwsAssertion());

      expect('apple'.toUpperStart(), equals('Apple'));
    });

    test('method toLowerStart', () {
      expect(() => ''.toLowerStart(), throwsAssertion());
      expect(() => ' d '.toLowerStart(), throwsAssertion());
      expect(() => '_A'.toLowerStart(), throwsAssertion());

      expect('Apple'.toLowerStart(), equals('apple'));

      expect(() => 'apple'.toLowerStart(), throwsAssertion());
    });
  });
}
