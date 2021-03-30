import 'package:sealed_generators/src/utils/type_utils.dart';
import 'package:test/test.dart';

void main() {
  group('extension TypeUtils', () {
    test('method isPrivate', () {
      expect('_hello'.isPrivate(), equals(true));
      expect('_Hello'.isPrivate(), equals(true));
      expect('hello'.isPrivate(), equals(false));
      expect('Hello'.isPrivate(), equals(false));

      expect(''.isPrivate(), equals(false));
      expect('a '.isPrivate(), equals(false));
      expect('a b'.isPrivate(), equals(false));
    });

    test('method isPublic', () {
      expect('_hello'.isPublic(), equals(false));
      expect('_Hello'.isPublic(), equals(false));
      expect('hello'.isPublic(), equals(true));
      expect('Hello'.isPublic(), equals(true));

      expect(''.isPublic(), equals(false));
      expect('a '.isPublic(), equals(false));
      expect('a b'.isPublic(), equals(false));
    });

    test('method isGenTypeName', () {
      expect('_hello'.isGenTypeName(), equals(true));
      expect('_Hello'.isGenTypeName(), equals(true));
      expect('hello'.isGenTypeName(), equals(true));
      expect('Hello'.isGenTypeName(), equals(true));

      expect('Hello*'.isGenTypeName(), equals(false));
      expect('Hello?'.isGenTypeName(), equals(false));
      expect('Hello/*!*/'.isGenTypeName(), equals(false));
      expect('Hello/*?*/'.isGenTypeName(), equals(false));

      expect(''.isGenTypeName(), equals(false));
      expect('A '.isGenTypeName(), equals(false));
      expect('A b'.isGenTypeName(), equals(false));
    });

    test('method isGenFieldName', () {
      expect('_hello'.isGenFieldName(), equals(false));
      expect('_Hello'.isGenFieldName(), equals(false));
      expect('hello'.isGenFieldName(), equals(true));
      expect('Hello'.isGenFieldName(), equals(false));

      expect('Hello*'.isGenFieldName(), equals(false));
      expect('Hello?'.isGenFieldName(), equals(false));
      expect('Hello/*!*/'.isGenFieldName(), equals(false));
      expect('Hello/*?*/'.isGenFieldName(), equals(false));

      expect(''.isGenFieldName(), equals(false));
      expect('a '.isGenFieldName(), equals(false));
      expect('a b'.isGenFieldName(), equals(false));
    });

    test('method isGenClassName', () {
      expect('_hello'.isGenClassName(), equals(false));
      expect('_Hello'.isGenClassName(), equals(false));
      expect('hello'.isGenClassName(), equals(false));
      expect('Hello'.isGenClassName(), equals(true));

      expect('Hello*'.isGenClassName(), equals(false));
      expect('Hello?'.isGenClassName(), equals(false));
      expect('Hello/*!*/'.isGenClassName(), equals(false));
      expect('Hello/*?*/'.isGenClassName(), equals(false));

      expect(''.isGenTypeName(), equals(false));
      expect('A '.isGenTypeName(), equals(false));
      expect('A b'.isGenTypeName(), equals(false));
    });
  });
}
