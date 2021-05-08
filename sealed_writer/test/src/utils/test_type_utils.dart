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

      expect('Hello*'.isGenTypeName(), isFalse);
      expect('Hello?'.isGenTypeName(), isFalse);
      expect('Hello/*!*/'.isGenTypeName(), isFalse);
      expect('Hello/*?*/'.isGenTypeName(), isFalse);

      expect(''.isGenTypeName(), isFalse);
      expect('A '.isGenTypeName(), isFalse);
      expect('A b'.isGenTypeName(), isFalse);
    });

    test('method isGenFieldName', () {
      expect('_hello'.isGenFieldName(), isFalse);
      expect('_Hello'.isGenFieldName(), isFalse);
      expect('hello'.isGenFieldName(), isTrue);
      expect('Hello'.isGenFieldName(), isFalse);

      expect('Hello*'.isGenFieldName(), isFalse);
      expect('Hello?'.isGenFieldName(), isFalse);
      expect('Hello/*!*/'.isGenFieldName(), isFalse);
      expect('Hello/*?*/'.isGenFieldName(), isFalse);

      expect(''.isGenFieldName(), isFalse);
      expect('a '.isGenFieldName(), isFalse);
      expect('a b'.isGenFieldName(), isFalse);
    });

    test('method isGenClassName', () {
      expect('_hello'.isGenClassName(), isFalse);
      expect('_Hello'.isGenClassName(), isFalse);
      expect('hello'.isGenClassName(), isFalse);
      expect('Hello'.isGenClassName(), isTrue);

      expect('Hello*'.isGenClassName(), isFalse);
      expect('Hello?'.isGenClassName(), isFalse);
      expect('Hello/*!*/'.isGenClassName(), isFalse);
      expect('Hello/*?*/'.isGenClassName(), isFalse);

      expect(''.isGenTypeName(), isFalse);
      expect('A '.isGenTypeName(), isFalse);
      expect('A b'.isGenTypeName(), isFalse);
    });

    test('method isSimpleOrNullableTypeName', () {
      expect('_hello'.isSimpleOrNullableTypeName(), isTrue);
      expect('_Hello'.isSimpleOrNullableTypeName(), isTrue);
      expect('hello'.isSimpleOrNullableTypeName(), isTrue);
      expect('Hello'.isSimpleOrNullableTypeName(), isTrue);

      expect('Hello?'.isSimpleOrNullableTypeName(), isTrue);

      expect('Hello*'.isSimpleOrNullableTypeName(), isFalse);
      expect('Hello/*!*/'.isSimpleOrNullableTypeName(), isFalse);
      expect('Hello/*?*/'.isSimpleOrNullableTypeName(), isFalse);

      expect(''.isSimpleOrNullableTypeName(), isFalse);
      expect('A '.isSimpleOrNullableTypeName(), isFalse);
      expect('A b'.isSimpleOrNullableTypeName(), isFalse);
    });

    test('method readType', () {
      final t1 = 'double'.readType();
      expect(t1.name, equals('double'));
      expect(t1.isNullable, isFalse);

      final t2 = 'double?'.readType();
      expect(t2.name, equals('double'));
      expect(t2.isNullable, isTrue);

      expect(() => 'Hello*'.readType(), throwsInternal());
      expect(() => 'Hello/*!*/'.readType(), throwsInternal());
      expect(() => 'Hello/*?*/'.readType(), throwsInternal());
      expect(() => ''.readType(), throwsInternal());
      expect(() => 'A '.readType(), throwsInternal());
      expect(() => 'A b'.readType(), throwsInternal());
    });
  });
}
