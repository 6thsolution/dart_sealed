import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:test/test.dart';

void main() {
  group('annotation @Sealed', () {
    test('initialization', () {
      const a = Sealed();
      expect(a.equality, equals(Equality.data));
      expect(
        a.toString(),
        stringContainsInOrder([
          'Sealed',
          'equality',
          'data',
        ]),
      );

      const b = Sealed(equality: Equality.identity);
      expect(b.equality, equals(Equality.identity));
    });
  });

  group('annotation @SealedManifest', () {
    test('initialization', () {
      const a = SealedManifest(String);
      expect(a.manifest, equals(String));
      expect(
        a.toString(),
        stringContainsInOrder([
          'SealedManifest',
          'manifest',
          'String',
        ]),
      );
    });
  });

  group('annotation @Meta', () {
    test('initialization', () {
      const a = Meta(name: 'Apple', equality: Equality.identity);
      expect(a.name, equals('Apple'));
      expect(a.equality, equals(Equality.identity));
      expect(
        a.toString(),
        stringContainsInOrder([
          'Meta',
          'name',
          'Apple',
          'equality',
          'identity',
        ]),
      );
    });
  });

  group('annotation @WithType', () {
    test('initialization', () {
      const a = WithType('double?');
      expect(a.type, equals('double?'));
      expect(
        a.toString(),
        stringContainsInOrder([
          'WithType',
          'type',
          'double?',
        ]),
      );
    });
  });

  group('annotation @WithName', () {
    test('initialization', () {
      const a = WithName('Hello');
      expect(a.name, equals('Hello'));
      expect(
        a.toString(),
        stringContainsInOrder([
          'WithName',
          'name',
          'Hello',
        ]),
      );
    });
  });

  group('annotation @WithPrefix', () {
    test('initialization', () {
      const a = WithPrefix('Hello');
      expect(a.prefix, equals('Hello'));
      expect(
        a.toString(),
        stringContainsInOrder([
          'WithPrefix',
          'prefix',
          'Hello',
        ]),
      );
    });
  });

  group('annotation @WithEquality', () {
    test('initialization', () {
      const a = WithEquality(Equality.identity);
      expect(a.equality, equals(Equality.identity));
      expect(
        a.toString(),
        stringContainsInOrder([
          'WithEquality',
          'equality',
          'Equality.identity',
        ]),
      );
    });
  });
}
