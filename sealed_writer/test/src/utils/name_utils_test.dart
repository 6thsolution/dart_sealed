import 'package:sealed_writer/src/utils/name_utils.dart';
import 'package:test/test.dart';

import '../../utils/exception_utils.dart';

void main() {
  group('extension NameUtils', () {
    test('method startWithUpper', () {
      expect(() => ''.startsWithUpper(), throwsInternal());
      expect(() => ' d '.startsWithUpper(), throwsInternal());
      expect(() => '_A'.startsWithUpper(), throwsInternal());

      expect('Apple'.startsWithUpper(), isTrue);
      expect('apple'.startsWithUpper(), isFalse);
    });

    test('method startWithLower', () {
      expect(() => ''.startsWithLower(), throwsInternal());
      expect(() => ' d '.startsWithLower(), throwsInternal());
      expect(() => '_A'.startsWithLower(), throwsInternal());

      expect('Apple'.startsWithLower(), isFalse);
      expect('apple'.startsWithLower(), isTrue);
    });

    test('method toUpperStart', () {
      expect(() => ''.toUpperStart(), throwsInternal());
      expect(() => ' d '.toUpperStart(), throwsInternal());
      expect(() => '_A'.toUpperStart(), throwsInternal());

      expect(() => 'Apple'.toUpperStart(), throwsInternal());

      expect('apple'.toUpperStart(), equals('Apple'));
    });

    test('method toLowerStart', () {
      expect(() => ''.toLowerStart(), throwsInternal());
      expect(() => ' d '.toLowerStart(), throwsInternal());
      expect(() => '_A'.toLowerStart(), throwsInternal());

      expect('Apple'.toLowerStart(), equals('apple'));

      expect(() => 'apple'.toLowerStart(), throwsInternal());
    });
  });
}
