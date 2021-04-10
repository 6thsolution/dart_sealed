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

  group('annotation @SealedType', () {
    test('initialization', () {
      const b = SealedType.nonNull('type');
      expect(b.name, equals('type'));
      expect(b.isNullable, equals(false));

      const c = SealedType.nullable('type');
      expect(c.name, equals('type'));
      expect(c.isNullable, equals(true));
    });
  });

  group('annotation @SealedTypeOverride', () {
    test('initialization', () {
      const t = SealedType.nonNull('type');
      const a = SealedOverride.named({'name': t});
      expect(a.map, equals({'name': t}));
      expect(a.type, isNull);

      const b = SealedOverride.allDynamic(t);
      expect(b.map, isNull);
      expect(b.type, equals(t));
    });
  });
}
