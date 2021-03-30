import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:test/test.dart';

void main() {
  group('annotation @Sealed', () {
    test('initialization', () {
      const a = Sealed();
      expect(a.equality, SealedEquality.data);
      expect(a.toString(), stringContainsInOrder(['equality', 'data']));

      const b = Sealed(equality: SealedEquality.identity);
      expect(b.equality, SealedEquality.identity);
      expect(b.toString(), stringContainsInOrder(['equality', 'identity']));
    });
  });

  group('annotation @SealedManifest', () {
    test('initialization', () {
      const a = SealedManifest(manifest: String);
      expect(a.manifest, String);
      expect(a.toString(), stringContainsInOrder(['manifest', 'String']));
    });
  });
}
