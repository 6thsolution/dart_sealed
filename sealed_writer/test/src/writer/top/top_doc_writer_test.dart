import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/top/top_doc_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class DocWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopDocWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method write', () {
      test('data equality', () {
        final manifest = manifest1Data;
        final writer = TopDocWriter(manifest);

        expect(writer.write(), doc1Data);
      });

      test('identity equality', () {
        final manifest = manifest1Identity;
        final writer = TopDocWriter(manifest);

        expect(writer.write(), doc1Identity);
      });

      test('distinct equality', () {
        final manifest = manifest1Distinct;
        final writer = TopDocWriter(manifest);

        expect(writer.write(), doc1Distinct);
      });

      test('data equality generic', () {
        final manifest = manifest2Data;
        final writer = TopDocWriter(manifest);

        expect(writer.write(), doc2Data);
      });

      test('data equality common', () {
        final manifest = manifest3Data;
        final writer = TopDocWriter(manifest);

        expect(writer.write(), doc3Data);
      });
    });

    test('constant equalityNames', () {
      // should have same order
      expect(
        TopDocWriter.equalityNames.map((e) => 'ManifestEquality.$e').toList(),
        ManifestEquality.values.map((e) => '$e').toList(),
      );
    });
  });
}
