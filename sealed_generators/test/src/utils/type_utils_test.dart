import 'package:sealed_generators/src/utils/type_utils.dart';
import 'package:test/test.dart';

void main() {
  group('class TypeUtils', () {
    test('method isNullable', () {
      expect(() => ''.isNullable(), throwsA(anything));
      expect(() => ' d '.isNullable(), throwsA(anything));

      expect('Apple?'.isNullable(), equals(true));
      expect('Apple'.isNullable(), equals(false));
    });

    test('method isNonNullable', () {
      expect(() => ''.isNonNullable(), throwsA(anything));
      expect(() => ' d '.isNonNullable(), throwsA(anything));

      expect('Apple?'.isNonNullable(), equals(false));
      expect('Apple'.isNonNullable(), equals(true));
    });

    test('method toLegacyNullable', () {
      expect(() => ''.toLegacyNullable(), throwsA(anything));
      expect(() => ' d '.toLegacyNullable(), throwsA(anything));
      expect(() => 'Apple?'.toLegacyNullable(), throwsA(anything));

      expect('Apple'.toLegacyNullable(), equals('Apple /*?*/'));
    });

    test('method toLegacyNonNullable', () {
      expect(() => ''.toLegacyNonNullable(), throwsA(anything));
      expect(() => ' d '.toLegacyNonNullable(), throwsA(anything));
      expect(() => 'Apple?'.toLegacyNonNullable(), throwsA(anything));

      expect('Apple'.toLegacyNonNullable(), equals('Apple /*!*/'));
    });
  });
}
