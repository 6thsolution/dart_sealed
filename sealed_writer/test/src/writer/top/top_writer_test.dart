import 'package:sealed_writer/src/writer/top/top_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class TopWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopWriter(manifest);

      expect(writer.manifest, manifest);
    });

    test('method topManifest', () {
      final manifest = manifest1Data;
      final writer = TopWriter(manifest);

      expect(
        writer.topManifest(),
        '@SealedManifest(_Weather)',
      );
    });

    test('method topConstructor', () {
      final manifest = manifest1Data;
      final writer = TopWriter(manifest);

      expect(
        writer.topConstructor(),
        'const Weather._internal();',
      );
    });

    group('method topMethods', () {
      test('equality data', () {
        final manifest = manifest1Data;
        final writer = TopWriter(manifest);

        expect(
          writer.topMethods(),
          containsAll(<String>[
            ...writer.topBuilderWriter.topBuilderMethods(),
            ...writer.topCastWriter.topCastMethods(),
            ...writer.topMatchWriter.topMatchMethods(),
          ]),
        );
      });

      test('equality identity', () {
        final manifest = manifest1Identity;
        final writer = TopWriter(manifest);

        expect(
          writer.topMethods(),
          containsAll(<String>[
            ...writer.topBuilderWriter.topBuilderMethods(),
            ...writer.topCastWriter.topCastMethods(),
            ...writer.topMatchWriter.topMatchMethods(),
          ]),
        );
      });

      test('equality distinct', () {
        final manifest = manifest1Distinct;
        final writer = TopWriter(manifest);

        expect(
          writer.topMethods(),
          containsAll(<String>[
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
          final manifest = manifest1Data;
          final writer = TopWriter(manifest);

          expect(
            writer.topClassStart(),
            '$doc1Data\n'
            '@SealedManifest(_Weather)\n'
            'abstract class Weather',
          );
        });

        test('equality identity', () {
          final manifest = manifest1Identity;
          final writer = TopWriter(manifest);

          expect(
            writer.topClassStart(),
            '$doc1Identity\n'
            '@SealedManifest(_Weather)\n'
            'abstract class Weather',
          );
        });

        test('equality distinct', () {
          final manifest = manifest1Distinct;
          final writer = TopWriter(manifest);

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
          final manifest = manifest2Data;
          final writer = TopWriter(manifest);

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
      final manifest = manifest1Data;
      final writer = TopWriter(manifest);

      expect(
        writer.topClass(),
        stringContainsInOrder([
          writer.topClassStart(),
          '{',
          writer.topConstructor(),
          ...writer.topMethods(),
          '}',
        ]),
      );
    });
    // end of group TopWriter
  });
}
