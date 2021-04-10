import 'package:sealed_generators/src/source/writer/top/top_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/code_utils.dart';
import '../../../../utils/examples.dart';

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

    group('method topDistinctEquality', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopWriter(source);

        expect(
          writer.topDistinctEquality().tr(),
          '@override'
          'bool operator ==(Object other) => false;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopWriter(source);

        expect(
          writer.topDistinctEquality().tr(),
          '@override'
          'bool/*!*/ operator ==(Object/*?*/ other) => false;',
        );
      });
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
            writer.topDistinctEquality(),
          ]),
        );
      });
    });

    group('method topClassStart', () {
      test('equality data', () {
        final source = source1DataSafe;
        final writer = TopWriter(source);

        expect(
          writer.topClassStart(),
          '$doc1Data\n'
          '@SealedManifest(_Weather)\n'
          'abstract class Weather extends Equatable',
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
