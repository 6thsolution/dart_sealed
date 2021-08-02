import 'package:sealed_writer/src/writer/top/match/top_match_when_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchWhenIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchWhenWriter(manifest);
        final i = writer.topMatchWhenIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(i.code, 'return sunny();');
      });
    });

    test('method topMatchWhenArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenWriter(manifest);

      expect(
        writer.topMatchWhenArgs(),
        items.map(writer.topMatchWrappedGenericNNArg),
      );
    });

    test('method topMatchWhenIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenWriter(manifest);
      final ifs = writer.topMatchWhenIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenWriter(manifest);

      expect(
        writer.topMatchWhenBody(),
        'final weather = this;\n'
        'if (weather is HiSunny) '
        '{return sunny();}\n'
        'else if (weather is WeatherRainy) '
        '{return rainy(weather.rain);}\n'
        'else if (weather is HelloWindy) '
        '{return windy(weather.velocity, weather.angle);}\n'
        'else {throw AssertionError();}',
      );
    });

    group('method topMatchWhenStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchWhenWriter(manifest);

        expect(
          writer.topMatchWhenStart(),
          'R when<R extends Object?>({'
          'required R Function() sunny, '
          'required R Function(int rain) rainy, '
          'required R Function(double velocity, double? angle) windy,'
          '})',
        );
      });
    });

    group('method topMatchWhen', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchWhenWriter(manifest);

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
    });
    // end of group TopMatchWhenWriter
  });
}
