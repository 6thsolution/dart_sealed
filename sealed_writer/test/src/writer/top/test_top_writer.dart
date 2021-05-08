import 'package:sealed_writer/src/writer/top/top_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class TopWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopWriter(source);

      expect(writer.source, source);
    });

    test('method topManifest', () {
      final source = source1DataSafe;
      final writer = TopWriter(source);

      expect(
        writer.topManifest(),
        '@SealedManifest(_Weather)',
      );
    });

    group('method topMethods', () {
      test('equality data', () {
        final source = source1DataSafe;
        final writer = TopWriter(source);

        expect(
          writer.topMethods(),
          containsAll([
            ...writer.topBuilderWriter.topBuilderMethods(),
            ...writer.topCastWriter.topCastMethods(),
            ...writer.topMatchWriter.topMatchMethods(),
          ]),
        );
      });

      test('equality identity', () {
        final source = source1IdentityLegacy;
        final writer = TopWriter(source);

        expect(
          writer.topMethods(),
          containsAll([
            ...writer.topBuilderWriter.topBuilderMethods(),
            ...writer.topCastWriter.topCastMethods(),
            ...writer.topMatchWriter.topMatchMethods(),
          ]),
        );
      });

      test('equality distinct', () {
        final source = source1DistinctLegacy;
        final writer = TopWriter(source);

        expect(
          writer.topMethods(),
          containsAll([
            ...writer.topBuilderWriter.topBuilderMethods(),
            ...writer.topCastWriter.topCastMethods(),
            ...writer.topMatchWriter.topMatchMethods(),
          ]),
        );
      });
    });

    group('method topClassStart', () {
      group('simple', () {
        test('equality data', () {
          final source = source1DataSafe;
          final writer = TopWriter(source);

          expect(
            writer.topClassStart(),
            '$doc1Data\n'
            '@SealedManifest(_Weather)\n'
            'abstract class Weather',
          );
        });

        test('equality identity', () {
          final source = source1IdentityLegacy;
          final writer = TopWriter(source);

          expect(
            writer.topClassStart(),
            '$doc1Identity\n'
            '@SealedManifest(_Weather)\n'
            'abstract class Weather',
          );
        });

        test('equality distinct', () {
          final source = source1DistinctLegacy;
          final writer = TopWriter(source);

          expect(
            writer.topClassStart(),
            '$doc1Distinct\n'
            '@SealedManifest(_Weather)\n'
            'abstract class Weather',
          );
        });
      });

      group('generic', () {
        test('equality data', () {
          final source = source2DataSafe;
          final writer = TopWriter(source);

          expect(
            writer.topClassStart(),
            '$doc2Data\n'
            '@SealedManifest(_Result)\n'
            'abstract class Result<T extends num>',
          );
        });
      });
    });

    test('method topClass', () {
      final source = source1DataSafe;
      final writer = TopWriter(source);

      expect(
        writer.topClass(),
        stringContainsInOrder([
          writer.topClassStart(),
          '{',
          ...writer.topMethods(),
          '}',
        ]),
      );
    });
    // end of group TopWriter
  });
}
