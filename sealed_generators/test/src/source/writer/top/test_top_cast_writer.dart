import 'package:sealed_generators/src/source/writer/top/top_cast_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopCastWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopCastWriter(source);

      expect(writer.source, source);
    });

    test('method topCastIs', () {
      final source = source1DataSafe;
      final item = source.manifest.items[0];
      final writer = TopCastWriter(source);

      expect(
        writer.topCastIs(item),
        'bool isSunny() => this is HiSunny;',
      );
    });

    test('method topCastsIs', () {
      final source = source1DataSafe;
      final writer = TopCastWriter(source);

      expect(
        writer.topCastsIs().joinMethods(),
        stringContainsInOrder([
          'isSunny()',
          'isRainy()',
          'isWindy()',
        ]),
      );
    });

    group('method topCastAs', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final item = source.manifest.items[0];
        final writer = TopCastWriter(source);

        expect(
          writer.topCastAs(item),
          'HiSunny asSunny() => this as HiSunny;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items[0];
        final writer = TopCastWriter(source);

        expect(
          writer.topCastAs(item),
          'HiSunny/*!*/ asSunny() => this as HiSunny;',
        );
      });
    });

    test('method topCastsAs', () {
      final source = source1DataSafe;
      final writer = TopCastWriter(source);

      expect(
        writer.topCastsAs().joinMethods(),
        stringContainsInOrder([
          'asSunny()',
          'asRainy()',
          'asWindy()',
        ]),
      );
    });

    group('method topCastAsOrNull', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final item = source.manifest.items[0];
        final writer = TopCastWriter(source);

        expect(
          writer.topCastAsOrNull(item),
          'HiSunny? asSunnyOrNull() {\n'
          'final weather = this;\n'
          'return weather is HiSunny ? weather : null;\n'
          '}',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items[0];
        final writer = TopCastWriter(source);

        expect(
          writer.topCastAsOrNull(item),
          'HiSunny/*?*/ asSunnyOrNull() {\n'
          'final weather = this;\n'
          'return weather is HiSunny ? weather : null;\n'
          '}',
        );
      });
    });

    test('method topCastsAsOrNull', () {
      final source = source1DataSafe;
      final writer = TopCastWriter(source);

      expect(
        writer.topCastsAsOrNull().joinMethods(),
        stringContainsInOrder([
          'asSunnyOrNull()',
          'asRainyOrNull()',
          'asWindyOrNull()',
        ]),
      );
    });

    test('method topCastMethods', () {
      final source = source1DataSafe;
      final writer = TopCastWriter(source);

      expect(
        writer.topCastMethods().joinMethods(),
        stringContainsInOrder([
          'isSunny()',
          'asRainy()',
          'asWindyOrNull()',
        ]),
      );
    });
    // end of group TopCastWriter
  });
}
