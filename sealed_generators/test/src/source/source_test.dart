import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:test/test.dart';

void main() {
  group('class Options', () {
    test('initialization', () {
      final options = Options(
        equality: SealedEquality.distinct,
        isNullSafe: false,
      );
      final manifest = Manifest(
        name: 'Weather',
        items: [
          ManifestItem(name: 'Sunny', fields: []),
        ],
      );
      final source = Source(options: options, manifest: manifest);
      expect(source.options, options);
      expect(source.manifest, manifest);
    });
  });
}
