import 'package:sealed_generators/src/source/writer/top/match/top_match_when_or_else_writer.dart';
import 'package:test/test.dart';

import '../../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenOrElseWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrElseWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchWhenOrElseIf', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchWhenOrElseWriter(source);
      final i = writer.topMatchWhenOrElseIf(item1);

      expect(i.condition, 'weather is HiSunny');
      expect(
        i.code,
        'return sunny != null ? sunny(weather) : orElse(weather);',
      );
    });

    test('method topMatchWhenOrElseItemArgs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenOrElseWriter(source);

      expect(
        writer.topMatchWhenOrElseItemArgs(),
        items.map(writer.topMatchGenericNArg),
      );
    });

    test('method topMatchWhenOrElseArgs', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrElseWriter(source);

      expect(
        writer.topMatchWhenOrElseArgs(),
        allOf(
          containsAll(writer.topMatchWhenOrElseItemArgs()),
          contains(writer.topMatchGenericNNArgOrElse()),
        ),
      );
    });

    test('method topMatchWhenOrElseIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenOrElseWriter(source);
      final ifs = writer.topMatchWhenOrElseIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenOrElseIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenOrElseBody', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrElseWriter(source);

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

    test('method topMatchWhenOrElseStart', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrElseWriter(source);

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

    group('method topMatchWhenOrElse', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchWhenOrElseWriter(source);

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

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchWhenOrElseWriter(source);

        expect(
          writer.topMatchWhenOrElse(),
          stringContainsInOrder([
            writer.topMatchWhenOrElseStart(),
            '{',
            writer.topMatchAssertOrElse(),
            writer.topMatchWhenOrElseBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchWhenOrElseWriter
  });
}
