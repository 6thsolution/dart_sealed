import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:test/test.dart';

void main() {
  group('annotation @Sealed', () {
    test('initialization', () {
      const a = Sealed();
      expect(a.equality, equals(SealedEquality.data));
      expect(a.toString(), stringContainsInOrder(['equality', 'data']));

      const b = Sealed(equality: SealedEquality.identity);
      expect(b.equality, equals(SealedEquality.identity));
    });
  });

  group('annotation @SealedManifest', () {
    test('initialization', () {
      const a = SealedManifest(String);
      expect(a.manifest, equals(String));
    });
  });

  group('annotation @SealedOverrideDynamic', () {
    test('initialization', () {
      const a = SealedOverrideDynamic('double?');
      expect(a.type, equals('double?'));
    });
  });

  group('annotation @SealedTypeOverride', () {
    test('initialization', () {
      const a = SealedOverrideNamed({'name': 'type?'});
      expect(a.map, equals({'name': 'type?'}));
    });
  });
}
