import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/top/top_doc_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class DocWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopDocWriter(source);

      expect(writer.source, source);
    });

    group('method write', () {
      test('data equality', () {
        final source = source1DataSafe;
        final writer = TopDocWriter(source);

        expect(writer.write(), doc1Data);
      });

      test('identity equality', () {
        final source = source1IdentitySafe;
        final writer = TopDocWriter(source);

        expect(writer.write(), doc1Identity);
      });

      test('distinct equality', () {
        final source = source1DistinctSafe;
        final writer = TopDocWriter(source);

        expect(writer.write(), doc1Distinct);
      });

      test('data equality generic', () {
        final source = source2DataSafe;
        final writer = TopDocWriter(source);

        expect(writer.write(), doc2Data);
      });

      test('data equality simple wrapped', () {
        final source = source3DataSafe;
        final writer = TopDocWriter(source);

        expect(writer.write(), doc3Data);
      });

      test('data equality generic wrapped', () {
        final source = source4DataSafe;
        final writer = TopDocWriter(source);

        expect(writer.write(), doc4Data);
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
