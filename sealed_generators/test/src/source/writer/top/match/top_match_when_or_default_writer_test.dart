import 'package:sealed_generators/src/source/writer/top/match/top_match_when_or_default_writer.dart';
import 'package:test/test.dart';

import '../../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenOrDefaultWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrDefaultWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchWhenOrDefaultIf', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchWhenOrDefaultWriter(source);
      final i = writer.topMatchWhenOrDefaultIf(item1);

      expect(i.condition, 'weather is HiSunny');
      expect(i.code, 'return sunny != null ? sunny(weather) : orDefault;');
    });

    test('method topMatchWhenOrDefaultItemArgs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenOrDefaultWriter(source);

      expect(
        writer.topMatchWhenOrDefaultItemArgs(),
        items.map(writer.topMatchGenericNArg),
      );
    });

    test('method topMatchWhenOrDefaultArgs', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrDefaultWriter(source);

      expect(
        writer.topMatchWhenOrDefaultArgs(),
        allOf(
          containsAll(writer.topMatchWhenOrDefaultItemArgs()),
          contains(writer.topMatchGenericNNArgOrDefault()),
        ),
      );
    });

    test('method topMatchWhenOrDefaultIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenOrDefaultWriter(source);
      final ifs = writer.topMatchWhenOrDefaultIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenOrDefaultIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenOrDefaultBody', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrDefaultWriter(source);

      expect(
        writer.topMatchWhenOrDefaultBody(),
        'final weather = this;\n'
        'if (weather is HiSunny)'
        ' {return sunny != null ? sunny(weather) : orDefault;}\n'
        'else if (weather is WeatherRainy)'
        ' {return rainy != null ? rainy(weather) : orDefault;}\n'
        'else if (weather is HelloWindy)'
        ' {return windy != null ? windy(weather) : orDefault;}\n'
        'else {throw AssertionError();}',
      );
    });

    test('method topMatchWhenOrDefaultStart', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrDefaultWriter(source);

      expect(
        writer.topMatchWhenOrDefaultStart(),
        'R whenOrDefault<R extends Object?>({'
        'R Function(HiSunny sunny)? sunny,'
        ' R Function(WeatherRainy rainy)? rainy,'
        ' R Function(HelloWindy windy)? windy,'
        ' required R orDefault,'
        '})',
      );
    });

    group('method topMatchWhenOrDefault', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchWhenOrDefaultWriter(source);

        expect(
          writer.topMatchWhenOrDefault(),
          stringContainsInOrder([
            writer.topMatchWhenOrDefaultStart(),
            '{',
            writer.topMatchWhenOrDefaultBody(),
            '}',
          ]),
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchWhenOrDefaultWriter(source);

        expect(
          writer.topMatchWhenOrDefault(),
          stringContainsInOrder([
            writer.topMatchWhenOrDefaultStart(),
            '{',
            writer.topMatchAssertOrDefault(),
            writer.topMatchWhenOrDefaultBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchWhenOrDefaultWriter
  });
}
