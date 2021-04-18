import 'package:sealed_generators/src/source/writer/top/match/top_match_when_or_null_writer.dart';
import 'package:test/test.dart';

import '../../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenOrNullWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrNullWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchWhenOrNullIf', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchWhenOrNullWriter(source);
      final i = writer.topMatchWhenOrNullIf(item1);

      expect(i.condition, 'weather is HiSunny');
      expect(i.code, 'return sunny?.call(weather);');
    });

    test('method topMatchWhenOrNullArgs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenOrNullWriter(source);

      expect(
        writer.topMatchWhenOrNullArgs(),
        items.map(writer.topMatchGenericNArg),
      );
    });

    test('method topMatchWhenOrNullIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenOrNullWriter(source);
      final ifs = writer.topMatchWhenOrNullIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenOrNullIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenOrNullBody', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrNullWriter(source);

      expect(
        writer.topMatchWhenOrNullBody(),
        'final weather = this;\n'
        'if (weather is HiSunny)'
        ' {return sunny?.call(weather);}\n'
        'else if (weather is WeatherRainy)'
        ' {return rainy?.call(weather);}\n'
        'else if (weather is HelloWindy)'
        ' {return windy?.call(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    test('method topMatchWhenOrNullStart', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrNullWriter(source);

      expect(
        writer.topMatchWhenOrNullStart(),
        'R? whenOrNull<R extends Object?>({'
        'R Function(HiSunny sunny)? sunny,'
        ' R Function(WeatherRainy rainy)? rainy,'
        ' R Function(HelloWindy windy)? windy,'
        '})',
      );
    });

    group('method topMatchWhenOrNull', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchWhenOrNullWriter(source);

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

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchWhenOrNullWriter(source);

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
