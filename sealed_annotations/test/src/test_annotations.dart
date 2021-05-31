import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:test/test.dart';

void main() {
  group('annotation @Sealed', () {
    test('initialization', () {
      const a = Sealed();
      expect(
        a.toString(),
        stringContainsInOrder(['Sealed']),
      );
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

  group('annotation @Wrap', () {
    test('initialization', () {
      const a = Wrap();
      expect(
        a.toString(),
        stringContainsInOrder(['Wrap']),
      );
    });
  });
}
