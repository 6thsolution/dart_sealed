import 'package:sealed_generators/src/source/writer/source_writer.dart';
import 'package:test/test.dart';

import '../../../utils/code_utils.dart';
import '../../../utils/examples.dart';

void main() {
  group('extension SourceWriter', () {
    group('getter n', () {
      test('null-safe', () {
        expect(source1DataSafe.n, '?');
      });

      test('legacy', () {
        expect(source1DataLegacy.n, '/*?*/');
      });
    });

    group('getter nn', () {
      test('null-safe', () {
        expect(source1DataSafe.nn, '');
      });

      test('legacy', () {
        expect(source1DataLegacy.nn, '/*!*/');
      });
    });

    test('method top', () {
      expect(source1DataSafe.top, 'Weather');
    });

    test('method short', () {
      final source = source1DataSafe;
      final item = source.manifest.items.first;

      expect(source.short(item), 'Sunny');
    });

    test('method full', () {
      final source = source1DataSafe;
      final item = source.manifest.items.first;

      expect(source.full(item), 'WeatherSunny');
    });

    test('method lower', () {
      final source = source1DataSafe;
      final item = source.manifest.items.first;

      expect(source.lower(item), 'sunny');
    });

    test('method topCastIsItem', () {
      final source = source1DataSafe;
      final item = source.manifest.items.first;

      expect(
        source.topCastIsItem(item).tr(),
        'bool isSunny() => this is WeatherSunny;',
      );
    });

    test('method topCastsIs', () {
      expect(
        source1DataSafe.topCastsIs().tr(),
        stringContains([
          'isSunny()',
          'isRainy()',
          'isWindy()',
        ]),
      );
    });

    group('method topCastAsItem', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final item = source.manifest.items.first;

        expect(
          source.topCastAsItem(item).tr(),
          'WeatherSunny asSunny() => this as WeatherSunny;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items.first;

        expect(
          source.topCastAsItem(item).tr(),
          'WeatherSunny/*!*/ asSunny() => this as WeatherSunny;',
        );
      });
    });

    test('method topCastsAs', () {
      expect(
        source1DataSafe.topCastsAs().tr(),
        stringContains([
          'asSunny()',
          'asRainy()',
          'asWindy()',
        ]),
      );
    });

    group('method topCastAsOrNullItem', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final item = source.manifest.items.first;

        expect(
          source.topCastAsOrNullItem(item).tr(),
          'WeatherSunny? asSunnyOrNull() => '
          'this is WeatherSunny ? this as WeatherSunny : null;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items.first;

        expect(
          source.topCastAsOrNullItem(item).tr(),
          'WeatherSunny/*?*/ asSunnyOrNull() => '
          'this is WeatherSunny ? this as WeatherSunny : null;',
        );
      });
    });

    test('method topCastsAsOrNull', () {
      expect(
        source1DataSafe.topCastsAsOrNull().tr(),
        stringContains([
          'asSunnyOrNull()',
          'asRainyOrNull()',
          'asWindyOrNull()',
        ]),
      );
    });

    test('method topCasts', () {
      expect(
        source1DataSafe.topCasts().tr(),
        stringContains([
          'isSunny()',
          'asRainy()',
          'asWindyOrNull()',
        ]),
      );
    });

    test('method topManifest', () {
      expect(
        source1DataSafe.topManifest().tr(),
        '@SealedManifest(_Weather)',
      );
    });
  });
}
