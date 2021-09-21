import 'package:sealed_writer/src/writer/top/match/top_match_when_or_null_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenOrNullWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenOrNullWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchWhenOrNullIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchWhenOrNullWriter(manifest);
        final i = writer.topMatchWhenOrNullIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(
          i.code,
          'return sunny != null ? sunny() :'
          ' orElse?.call(weather);',
        );
      });
    });

    test('method topMatchWhenOrNullItemArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenOrNullWriter(manifest);

      expect(
        writer.topMatchWhenOrNullItemArgs(),
        items.map(writer.topMatchWrappedGenericNArg),
      );
    });

    test('method topMatchWhenOrNullArgs', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenOrNullWriter(manifest);

      expect(
        writer.topMatchWhenOrNullArgs(),
        allOf(
          containsAll(writer.topMatchWhenOrNullItemArgs()),
          contains(writer.topMatchGenericNArgOrElse()),
        ),
      );
    });

    test('method topMatchWhenOrNullIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenOrNullWriter(manifest);
      final ifs = writer.topMatchWhenOrNullIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenOrNullIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenOrNullBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenOrNullWriter(manifest);

      expect(
        writer.topMatchWhenOrNullBody(),
        'final weather = this;\n'
        'if (weather is HiSunny) {return sunny != null ?'
        ' sunny() : orElse?.call(weather);}\n'
        'else if (weather is WeatherRainy) {return rainy != null ?'
        ' rainy(weather.rain) : orElse?.call(weather);}\n'
        'else if (weather is HelloWindy) {return windy != null ?'
        ' windy(weather.velocity, weather.angle) : orElse?.call(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    group('method topMatchWhenOrNullStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchWhenOrNullWriter(manifest);

        expect(
          writer.topMatchWhenOrNullStart(),
          'R? whenOrNull<R extends Object?>({'
          'R Function()? sunny, '
          'R Function(int rain)? rainy, '
          'R Function(double velocity, double? angle)? windy, '
          'R Function(Weather weather)? orElse,'
          '})',
        );
      });
    });

    group('method topMatchWhenOrNull', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchWhenOrNullWriter(manifest);

        expect(
          writer.topMatchWhenOrNull(),
          stringContainsInOrder([
            writer.topMatchWhenOrNullStart(),
            '{',
            writer.topMatchWhenOrNullBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchWhenOrNullWriter
  });
}
