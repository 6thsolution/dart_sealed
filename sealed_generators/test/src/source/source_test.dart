import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:test/test.dart';

import '../../utils/examples.dart';

void main() {
  group('class Source', () {
    test('initialization', () {
      final options = optionsSafe;
      final manifest = Manifest(
        name: 'Weather',
        items: [
          ManifestItem(
            shortName: 'Sunny',
            fullName: 'Lollipop',
            equality: Equality.data,
            fields: [],
          ),
        ],
      );
      final source = Source(options: options, manifest: manifest);
      expect(source.options, options);
      expect(source.manifest, manifest);
    });
  });
}
