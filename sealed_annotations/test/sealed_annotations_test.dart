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

  group('annotation @SealedOverrideDynamic', () {
    test('initialization', () {
      const a = SealedOverrideDynamic('double?');
      expect(a.type, equals('double?'));
      expect(
        a.toString(),
        stringContainsInOrder([
          'SealedOverrideDynamic',
          'type',
          'double?',
        ]),
      );
    });
  });

  group('annotation @SealedTypeOverride', () {
    test('initialization', () {
      const a = SealedOverrideNamed({'name': 'type?'});
      expect(a.map, equals({'name': 'type?'}));
      expect(
        a.toString(),
        stringContainsInOrder([
          'SealedOverrideNamed',
          'name',
          'type?',
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
}
