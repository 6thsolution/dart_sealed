import 'package:sealed_writer/src/writer/top/match/top_match_maybe_map_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchMaybeMapWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchMaybeMapWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchMaybeMapIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchMaybeMapWriter(manifest);
        final i = writer.topMatchMaybeMapIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(
          i.code,
          'return sunny != null ? sunny(weather) : orElse(weather);',
        );
      });
    });

    test('method topMatchMaybeMapItemArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchMaybeMapWriter(manifest);

      expect(
        writer.topMatchMaybeMapItemArgs(),
        items.map(writer.topMatchGenericNArg),
      );
    });

    test('method topMatchMaybeMapArgs', () {
      final manifest = manifest1Data;
      final writer = TopMatchMaybeMapWriter(manifest);

      expect(
        writer.topMatchMaybeMapArgs(),
        allOf(
          containsAll(writer.topMatchMaybeMapItemArgs()),
          contains(writer.topMatchGenericNNArgOrElse()),
        ),
      );
    });

    test('method topMatchMaybeMapIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchMaybeMapWriter(manifest);
      final ifs = writer.topMatchMaybeMapIfs();
      final a = ifs[0];
      final b = writer.topMatchMaybeMapIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchMaybeMapBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchMaybeMapWriter(manifest);

      expect(
        writer.topMatchMaybeMapBody(),
        'final weather = this;\n'
        'if (weather is HiSunny)'
        ' {return sunny != null ? sunny(weather) : orElse(weather);}\n'
        'else if (weather is WeatherRainy)'
        ' {return rainy != null ? rainy(weather) : orElse(weather);}\n'
        'else if (weather is HelloWindy)'
        ' {return windy != null ? windy(weather) : orElse(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    group('method topMatchMaybeMapStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchMaybeMapWriter(manifest);

        expect(
          writer.topMatchMaybeMapStart(),
          'R maybeMap<R extends Object?>({'
          'R Function(HiSunny sunny)? sunny,'
          ' R Function(WeatherRainy rainy)? rainy,'
          ' R Function(HelloWindy windy)? windy,'
          ' required R Function(Weather weather) orElse,'
          '})',
        );
      });
    });

    group('method topMatchMaybeMap', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchMaybeMapWriter(manifest);

        expect(
          writer.topMatchMaybeMap(),
          stringContainsInOrder([
            writer.topMatchMaybeMapStart(),
            '{',
            writer.topMatchMaybeMapBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchMaybeMapWriter
  });
}
