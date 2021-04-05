import 'package:sealed_generators/src/source/writer/source_writer.dart';
import 'package:test/test.dart';

import '../../../utils/code_utils.dart';
import '../../../utils/examples.dart';

void main() {
  group('class SourceWriter match', () {
    group('method topMatchParam', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = SourceWriter(source);

        expect(
          writer.topMatchParam,
          '<R extends Object?>',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = SourceWriter(source);

        expect(
          writer.topMatchParam,
          '<R extends Object/*?*/>',
        );
      });
    });

    group('method topMatchGenericNNArg', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final manifest = source.manifest;
        // sunny
        final item1 = manifest.items[0];
        final writer = SourceWriter(source);

        expect(
          writer.topMatchGenericNNArg(item1),
          'required R Function(WeatherSunny sunny) sunny',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final manifest = source.manifest;
        // sunny
        final item1 = manifest.items[0];
        final writer = SourceWriter(source);

        expect(
          writer.topMatchGenericNNArg(item1),
          '@required R Function(WeatherSunny/*!*/ sunny)/*!*/ sunny',
        );
      });
    });

    group('method topMatchGenericNNArgOrElse', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = SourceWriter(source);

        expect(
          writer.topMatchGenericNNArgOrElse(),
          'required R Function(Weather weather) orElse',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = SourceWriter(source);

        expect(
          writer.topMatchGenericNNArgOrElse(),
          '@required R Function(Weather/*!*/ weather)/*!*/ orElse',
        );
      });
    });

    group('method topMatchGenericNArg', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final manifest = source.manifest;
        // sunny
        final item1 = manifest.items[0];
        final writer = SourceWriter(source);

        expect(
          writer.topMatchGenericNArg(item1),
          'R Function(WeatherSunny sunny)? sunny',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final manifest = source.manifest;
        // sunny
        final item1 = manifest.items[0];
        final writer = SourceWriter(source);

        expect(
          writer.topMatchGenericNArg(item1),
          'R Function(WeatherSunny/*!*/ sunny)/*?*/ sunny',
        );
      });
    });

    group('method topMatchGenericReturn', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = SourceWriter(source);

        expect(
          writer.topMatchParam,
          '<R extends Object?>',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = SourceWriter(source);

        expect(
          writer.topMatchParam,
          '<R extends Object/*?*/>',
        );
      });
    });

    group('method topMatchVoidNNArg', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final manifest = source.manifest;
        // sunny
        final item1 = manifest.items[0];
        final writer = SourceWriter(source);

        expect(
          writer.topMatchVoidNNArg(item1),
          'required void Function(WeatherSunny sunny) sunny',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final manifest = source.manifest;
        // sunny
        final item1 = manifest.items[0];
        final writer = SourceWriter(source);

        expect(
          writer.topMatchVoidNNArg(item1),
          '@required void Function(WeatherSunny/*!*/ sunny)/*!*/ sunny',
        );
      });
    });

    group('method topMatchVoidNNArgOrElse', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = SourceWriter(source);

        expect(
          writer.topMatchVoidNNArgOrElse(),
          'required void Function(Weather weather) orElse',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = SourceWriter(source);

        expect(
          writer.topMatchVoidNNArgOrElse(),
          '@required void Function(Weather/*!*/ weather)/*!*/ orElse',
        );
      });
    });

    group('method topMatchVoidNArg', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final manifest = source.manifest;
        // sunny
        final item1 = manifest.items[0];
        final writer = SourceWriter(source);

        expect(
          writer.topMatchVoidNArg(item1),
          'void Function(WeatherSunny sunny)? sunny',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final manifest = source.manifest;
        // sunny
        final item1 = manifest.items[0];
        final writer = SourceWriter(source);

        expect(
          writer.topMatchVoidNArg(item1),
          'void Function(WeatherSunny/*!*/ sunny)/*?*/ sunny',
        );
      });
    });

    test('method topMatchAssert', () {
      final source = source1DataLegacy;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = SourceWriter(source);

      expect(
        writer.topMatchAssert(item1),
        'assert(sunny != null);',
      );
    });

    test('method topMatchAssertOrElse', () {
      final source = source1DataLegacy;
      final writer = SourceWriter(source);

      expect(
        writer.topMatchAssertOrElse(),
        'assert(orElse != null);',
      );
    });

    test('method topMatchAsserts', () {
      final source = source1DataLegacy;
      final writer = SourceWriter(source);

      expect(
        writer.topMatchAsserts().tr(),
        stringContains([
          'assert(sunny != null);',
          'rainy',
          'windy',
        ]),
      );
    });
    // end of source writer match test group
  });
}
