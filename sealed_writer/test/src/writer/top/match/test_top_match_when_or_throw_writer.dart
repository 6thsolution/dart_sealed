import 'package:sealed_writer/src/writer/top/match/top_match_when_or_throw_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenOrThrowWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrThrowWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchWhenOrThrowIf', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchWhenOrThrowWriter(source);
      final i = writer.topMatchWhenOrThrowIf(item1);

      expect(i.condition, 'weather is HiSunny && sunny != null');
      expect(
        i.code,
        'return sunny(weather);',
      );
    });

    test('method topMatchWhenOrThrowArgs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenOrThrowWriter(source);

      expect(
        writer.topMatchWhenOrThrowArgs(),
        items.map(writer.topMatchGenericNArg),
      );
    });

    test('method topMatchWhenOrThrowIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenOrThrowWriter(source);
      final ifs = writer.topMatchWhenOrThrowIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenOrThrowIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenOrThrowBody', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrThrowWriter(source);

      expect(
        writer.topMatchWhenOrThrowBody(),
        'final weather = this;\n'
        'if (weather is HiSunny && sunny != null)'
        ' {return sunny(weather);}\n'
        'else if (weather is WeatherRainy && rainy != null)'
        ' {return rainy(weather);}\n'
        'else if (weather is HelloWindy && windy != null)'
        ' {return windy(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    test('method topMatchWhenOrThrowStart', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrThrowWriter(source);

      expect(
        writer.topMatchWhenOrThrowStart(),
        'R whenOrThrow<R extends Object?>({'
        'R Function(HiSunny sunny)? sunny,'
        ' R Function(WeatherRainy rainy)? rainy,'
        ' R Function(HelloWindy windy)? windy,'
        '})',
      );
    });

    group('method topMatchWhenOrThrow', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchWhenOrThrowWriter(source);

        expect(
          writer.topMatchWhenOrThrow(),
          stringContainsInOrder([
            writer.topMatchWhenOrThrowStart(),
            '{',
            writer.topMatchWhenOrThrowBody(),
            '}',
          ]),
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchWhenOrThrowWriter(source);

        expect(
          writer.topMatchWhenOrThrow(),
          stringContainsInOrder([
            writer.topMatchWhenOrThrowStart(),
            '{',
            writer.topMatchWhenOrThrowBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchWhenOrThrowWriter
  });
}
