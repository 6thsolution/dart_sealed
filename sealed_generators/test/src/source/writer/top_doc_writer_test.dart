import 'package:sealed_generators/src/source/writer/top_doc_writer.dart';
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
    });
  });
}
