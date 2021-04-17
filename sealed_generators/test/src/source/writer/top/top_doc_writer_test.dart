import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/writer/top/top_doc_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

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
    });

    test('constant equalityNames', () {
      // should have same order
      expect(
        TopDocWriter.equalityNames.map((e) => 'Equality.$e').toList(),
        Equality.values.map((e) => '$e').toList(),
      );
    });
  });
}
