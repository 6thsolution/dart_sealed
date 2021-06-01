import 'package:sealed_writer/src/writer/top/match/top_match_when_partial_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenPartialWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenPartialWriter(source);

      expect(writer.source, source);
    });

    group('method topMatchWhenPartialIf', () {
      test('non-wrapped', () {
        final source = source1DataSafe;
        final manifest = source.manifest;
        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchWhenPartialWriter(source);
        final i = writer.topMatchWhenPartialIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(i.code, 'sunny?.call(weather);');
      });

      test('wrapped', () {
        final source = source3DataSafe;
        final item2 = source.manifest.items[1];
        final writer = TopMatchWhenPartialWriter(source);
        final i = writer.topMatchWhenPartialIf(item2);

        expect(i.code, 'two?.call(base.x);');
      });
    });

    test('method topMatchWhenPartialArgs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenPartialWriter(source);

      expect(
        writer.topMatchWhenPartialArgs(),
        items.map(writer.topMatchVoidNArg),
      );
    });

    test('method topMatchWhenPartialIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenPartialWriter(source);
      final ifs = writer.topMatchWhenPartialIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenPartialIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenPartialBody', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenPartialWriter(source);

      expect(
        writer.topMatchWhenPartialBody(),
        'final weather = this;\n'
        'if (weather is HiSunny) {'
        'sunny?.call(weather);}\n'
        'else if (weather is WeatherRainy) {'
        'rainy?.call(weather);}\n'
        'else if (weather is HelloWindy) {'
        'windy?.call(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    group('method topMatchWhenPartialStart', () {
      test('non-wrapped', () {
        final source = source1DataSafe;
        final writer = TopMatchWhenPartialWriter(source);

        expect(
          writer.topMatchWhenPartialStart(),
          'void whenPartial({'
          'void Function(HiSunny sunny)? sunny,'
          ' void Function(WeatherRainy rainy)? rainy,'
          ' void Function(HelloWindy windy)? windy,'
          '})',
        );
      });

      test('wrapped', () {
        final source = source3DataSafe;
        final writer = TopMatchWhenPartialWriter(source);

        expect(
          writer.topMatchWhenPartialStart(),
          'void whenPartial({'
          'void Function()? one,'
          ' void Function(int x)? two,'
          ' void Function(int y, int? z)? three,'
          '})',
        );
      });
    });

    group('method topMatchWhenPartial', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchWhenPartialWriter(source);

        expect(
          writer.topMatchWhenPartial(),
          stringContainsInOrder([
            writer.topMatchWhenPartialStart(),
            '{',
            writer.topMatchWhenPartialBody(),
            '}',
          ]),
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchWhenPartialWriter(source);

        expect(
          writer.topMatchWhenPartial(),
          stringContainsInOrder([
            writer.topMatchWhenPartialStart(),
            '{',
            writer.topMatchWhenPartialBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchWhenPartialWriter
  });
}
