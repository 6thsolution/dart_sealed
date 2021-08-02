import 'package:sealed_writer/src/writer/top/match/top_match_when_or_else_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenOrElseWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenOrElseWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchWhenOrElseIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchWhenOrElseWriter(manifest);
        final i = writer.topMatchWhenOrElseIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(
          i.code,
          'return sunny != null ? sunny(weather) : orElse(weather);',
        );
      });

      test('wrapped', () {
        final manifest = manifest3Data;
        final item2 = manifest.items[1];
        final writer = TopMatchWhenOrElseWriter(manifest);
        final i = writer.topMatchWhenOrElseIf(item2);

        expect(i.code, 'return two != null ? two(base.x) : orElse(base);');
      });
    });

    test('method topMatchWhenOrElseItemArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenOrElseWriter(manifest);

      expect(
        writer.topMatchWhenOrElseItemArgs(),
        items.map(writer.topMatchGenericNArg),
      );
    });

    test('method topMatchWhenOrElseArgs', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenOrElseWriter(manifest);

      expect(
        writer.topMatchWhenOrElseArgs(),
        allOf(
          containsAll(writer.topMatchWhenOrElseItemArgs()),
          contains(writer.topMatchGenericNNArgOrElse()),
        ),
      );
    });

    test('method topMatchWhenOrElseIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenOrElseWriter(manifest);
      final ifs = writer.topMatchWhenOrElseIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenOrElseIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenOrElseBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenOrElseWriter(manifest);

      expect(
        writer.topMatchWhenOrElseBody(),
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

    group('method topMatchWhenOrElseStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchWhenOrElseWriter(manifest);

        expect(
          writer.topMatchWhenOrElseStart(),
          'R whenOrElse<R extends Object?>({'
          'R Function(HiSunny sunny)? sunny,'
          ' R Function(WeatherRainy rainy)? rainy,'
          ' R Function(HelloWindy windy)? windy,'
          ' required R Function(Weather weather) orElse,'
          '})',
        );
      });

      test('wrapped', () {
        final manifest = manifest3Data;
        final writer = TopMatchWhenOrElseWriter(manifest);

        expect(
          writer.topMatchWhenOrElseStart(),
          'R whenOrElse<R extends Object?>({'
          'R Function()? one,'
          ' R Function(int x)? two,'
          ' R Function(int y, int? z)? three,'
          ' required R Function(Base base) orElse,'
          '})',
        );
      });
    });

    group('method topMatchWhenOrElse', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchWhenOrElseWriter(manifest);

        expect(
          writer.topMatchWhenOrElse(),
          stringContainsInOrder([
            writer.topMatchWhenOrElseStart(),
            '{',
            writer.topMatchWhenOrElseBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchWhenOrElseWriter
  });
}
