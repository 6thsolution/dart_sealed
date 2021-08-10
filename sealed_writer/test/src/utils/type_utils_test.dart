import 'package:sealed_writer/src/utils/type_utils.dart';
import 'package:test/test.dart';

import '../../utils/exception_utils.dart';

void main() {
  group('extension TypeUtils', () {
    test('method isPrivate', () {
      expect('_hello'.isPrivate(), isTrue);
      expect('_Hello'.isPrivate(), isTrue);
      expect('hello'.isPrivate(), isFalse);
      expect('Hello'.isPrivate(), isFalse);

      expect(''.isPrivate(), isFalse);
      expect('a '.isPrivate(), isFalse);
      expect('a b'.isPrivate(), isFalse);
    });

    test('method isPublic', () {
      expect('_hello'.isPublic(), isFalse);
      expect('_Hello'.isPublic(), isFalse);
      expect('hello'.isPublic(), isTrue);
      expect('Hello'.isPublic(), isTrue);

      expect(''.isPublic(), isFalse);
      expect('a '.isPublic(), isFalse);
      expect('a b'.isPublic(), isFalse);
    });

    test('method isGenTypeName', () {
      expect('_hello'.isGenTypeName(), isTrue);
      expect('_Hello'.isGenTypeName(), isTrue);
      expect('hello'.isGenTypeName(), isTrue);
      expect('Hello'.isGenTypeName(), isTrue);

      expect('Hello?'.isGenTypeName(), isFalse);

      expect(''.isGenTypeName(), isFalse);
      expect('A '.isGenTypeName(), isFalse);
      expect('A b'.isGenTypeName(), isFalse);
    });

    test('method isGenFieldName', () {
      expect('_hello'.isGenFieldName(), isFalse);
      expect('_Hello'.isGenFieldName(), isFalse);
      expect('hello'.isGenFieldName(), isTrue);
      expect('Hello'.isGenFieldName(), isFalse);

      expect('Hello?'.isGenFieldName(), isFalse);

      expect(''.isGenFieldName(), isFalse);
      expect('a '.isGenFieldName(), isFalse);
      expect('a b'.isGenFieldName(), isFalse);
    });

    test('method isGenClassName', () {
      expect('_hello'.isGenClassName(), isFalse);
      expect('_Hello'.isGenClassName(), isFalse);
      expect('hello'.isGenClassName(), isFalse);
      expect('Hello'.isGenClassName(), isTrue);

      expect('Hello?'.isGenClassName(), isFalse);

      expect(''.isGenTypeName(), isFalse);
      expect('A '.isGenTypeName(), isFalse);
      expect('A b'.isGenTypeName(), isFalse);
    });

    test('method isExternalTypeName', () {
      expect('_hello'.isExternalTypeName(), isTrue);
      expect('_Hello'.isExternalTypeName(), isTrue);
      expect('hello'.isExternalTypeName(), isTrue);
      expect('Hello'.isExternalTypeName(), isTrue);

      expect('Hello?'.isExternalTypeName(), isTrue);

      expect('void Function(int x)'.isExternalTypeName(), isTrue);
      expect('void Function(int x)?'.isExternalTypeName(), isTrue);
      expect('void Function(int)'.isExternalTypeName(), isTrue);
      expect('void Function(int)?'.isExternalTypeName(), isTrue);

      expect(''.isExternalTypeName(), isFalse);
      expect('?'.isExternalTypeName(), isFalse);
      expect('A '.isExternalTypeName(), isFalse);
      expect(' A'.isExternalTypeName(), isFalse);
    });

    test('method isExternalNonNullableTypeName', () {
      expect('_hello'.isExternalNonNullableTypeName(), isTrue);
      expect('_Hello'.isExternalNonNullableTypeName(), isTrue);
      expect('hello'.isExternalNonNullableTypeName(), isTrue);
      expect('Hello'.isExternalNonNullableTypeName(), isTrue);

      expect('Hello?'.isExternalNonNullableTypeName(), isFalse);

      expect('void Function(int x)'.isExternalNonNullableTypeName(), isTrue);
      expect('void Function(int x)?'.isExternalNonNullableTypeName(), isFalse);
      expect('void Function(int)'.isExternalNonNullableTypeName(), isTrue);
      expect('void Function(int)?'.isExternalNonNullableTypeName(), isFalse);

      expect(''.isExternalNonNullableTypeName(), isFalse);
      expect('?'.isExternalNonNullableTypeName(), isFalse);
      expect('A '.isExternalNonNullableTypeName(), isFalse);
      expect(' A'.isExternalNonNullableTypeName(), isFalse);
    });

    test('method readType', () {
      final t1 = 'double'.readType();
      expect(t1.name, equals('double'));
      expect(t1.isNullable, isFalse);

      final t2 = 'double?'.readType();
      expect(t2.name, equals('double'));
      expect(t2.isNullable, isTrue);

      expect(() => ''.readType(), throwsInternal());
      expect(() => 'A '.readType(), throwsInternal());
    });
  });
}
