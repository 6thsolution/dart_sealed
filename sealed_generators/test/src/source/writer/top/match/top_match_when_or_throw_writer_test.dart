import 'package:sealed_generators/src/source/writer/top/match/top_match_when_or_throw_writer.dart';
import 'package:test/test.dart';

import '../../../../../utils/examples.dart';

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

      expect(i.condition, 'weather is WeatherSunny');
      expect(
        i.code,
        'return sunny != null ?'
        ' sunny(weather) : throw AssertionError();',
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
        'if (weather is WeatherSunny)'
        ' {return sunny != null ? sunny(weather)'
        ' : throw AssertionError();}\n'
        'else if (weather is WeatherRainy)'
        ' {return rainy != null ? rainy(weather)'
        ' : throw AssertionError();}\n'
        'else if (weather is WeatherWindy)'
        ' {return windy != null ? windy(weather)'
        ' : throw AssertionError();}\n'
        'else {throw AssertionError();}',
      );
    });

    test('method topMatchWhenOrThrowStart', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenOrThrowWriter(source);

      expect(
        writer.topMatchWhenOrThrowStart(),
        'R whenOrThrow<R extends Object?>({'
        'R Function(WeatherSunny sunny)? sunny,'
        ' R Function(WeatherRainy rainy)? rainy,'
        ' R Function(WeatherWindy windy)? windy,'
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
