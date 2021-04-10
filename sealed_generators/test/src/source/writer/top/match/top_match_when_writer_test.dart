import 'package:sealed_generators/src/source/writer/top/match/top_match_when_writer.dart';
import 'package:test/test.dart';

import '../../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchWhenIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchWhenWriter(source);
      final i = writer.topMatchWhenIfs(item1);

      expect(i.condition, 'weather is WeatherSunny');
      expect(i.code, 'return sunny(weather);');
    });

    test('method topMatchWhenBody', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenWriter(source);

      expect(
        writer.topMatchWhenBody(),
        'final weather = this;\n'
        'if (weather is WeatherSunny) {return sunny(weather);}\n'
        'else if (weather is WeatherRainy) {return rainy(weather);}\n'
        'else if (weather is WeatherWindy) {return windy(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    test('method topMatchWhenStart', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenWriter(source);

      expect(
        writer.topMatchWhenStart(),
        'R when<R extends Object?>({'
        'required R Function(WeatherSunny sunny) sunny,'
        ' required R Function(WeatherRainy rainy) rainy,'
        ' required R Function(WeatherWindy windy) windy,'
        '})',
      );
    });

    group('method topMatchWhen', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchWhenWriter(source);

        expect(
          writer.topMatchWhen(),
          stringContainsInOrder([
            writer.topMatchWhenStart(),
            '{',
            writer.topMatchWhenBody(),
            '}',
          ]),
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchWhenWriter(source);

        expect(
          writer.topMatchWhen(),
          stringContainsInOrder([
            writer.topMatchWhenStart(),
            '{',
            writer.topMatchAsserts(),
            writer.topMatchWhenBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchWhenWriter
  });
}
