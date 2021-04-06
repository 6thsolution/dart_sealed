import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_cast_utils_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

class _Writer extends BaseCastUtilsWriter {
  const _Writer(Source source) : super(source);
}

void main() {
  group('class TopCastBaseWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = _Writer(source);

      expect(writer.source, source);
    });

    group('method isSub', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final item = source.manifest.items[0];
        final writer = _Writer(source);

        expect(
          writer.isSub(item),
          'is WeatherSunny',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items[0];
        final writer = _Writer(source);

        expect(
          writer.isSub(item),
          'is WeatherSunny/*!*/',
        );
      });
    });

    group('method asSub', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final item = source.manifest.items[0];
        final writer = _Writer(source);

        expect(
          writer.asSub(item),
          'as WeatherSunny',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items[0];
        final writer = _Writer(source);

        expect(
          writer.asSub(item),
          'as WeatherSunny/*!*/',
        );
      });
    });
    // end of group TopCastBaseWriter
  });
}
