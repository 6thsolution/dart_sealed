import 'package:sealed_writer/src/writer/top/match/top_match_map_or_null_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchMapOrNullWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchMapOrNullWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchMapOrNullIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchMapOrNullWriter(manifest);
        final i = writer.topMatchMapOrNullIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(
          i.code,
          'return sunny != null ? sunny(weather) : orElse?.call(weather);',
        );
      });
    });

    test('method topMatchMapOrNullItemArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchMapOrNullWriter(manifest);

      expect(
        writer.topMatchMapOrNullItemArgs(),
        items.map(writer.topMatchGenericNArg),
      );
    });

    test('method topMatchMapOrNullArgs', () {
      final manifest = manifest1Data;
      final writer = TopMatchMapOrNullWriter(manifest);

      expect(
        writer.topMatchMapOrNullArgs(),
        allOf(
          containsAll(writer.topMatchMapOrNullItemArgs()),
          contains(writer.topMatchGenericNArgOrElse()),
        ),
      );
    });

    test('method topMatchMapOrNullIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchMapOrNullWriter(manifest);
      final ifs = writer.topMatchMapOrNullIfs();
      final a = ifs[0];
      final b = writer.topMatchMapOrNullIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchMapOrNullBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchMapOrNullWriter(manifest);

      expect(
        writer.topMatchMapOrNullBody(),
        'final weather = this;\n'
        'if (weather is HiSunny)'
        ' {return sunny != null ? sunny(weather) : orElse?.call(weather);}\n'
        'else if (weather is WeatherRainy)'
        ' {return rainy != null ? rainy(weather) : orElse?.call(weather);}\n'
        'else if (weather is HelloWindy)'
        ' {return windy != null ? windy(weather) : orElse?.call(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    group('method topMatchMapOrNullStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchMapOrNullWriter(manifest);

        expect(
          writer.topMatchMapOrNullStart(),
          'R? mapOrNull<R extends Object?>({'
          'R Function(HiSunny sunny)? sunny,'
          ' R Function(WeatherRainy rainy)? rainy,'
          ' R Function(HelloWindy windy)? windy,'
          ' R Function(Weather weather)? orElse,'
          '})',
        );
      });
    });

    group('method topMatchMapOrNull', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchMapOrNullWriter(manifest);

        expect(
          writer.topMatchMapOrNull(),
          stringContainsInOrder([
            writer.topMatchMapOrNullStart(),
            '{',
            writer.topMatchMapOrNullBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchMapOrNullWriter
  });
}
