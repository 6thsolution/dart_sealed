import 'package:sealed_writer/src/writer/top/match/top_match_when_partial_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenPartialWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenPartialWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchWhenPartialIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchWhenPartialWriter(manifest);
        final i = writer.topMatchWhenPartialIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(i.code, 'sunny?.call(weather);');
      });

      test('wrapped', () {
        final manifest = manifest3Data;
        final item2 = manifest.items[1];
        final writer = TopMatchWhenPartialWriter(manifest);
        final i = writer.topMatchWhenPartialIf(item2);

        expect(i.code, 'two?.call(base.x);');
      });
    });

    test('method topMatchWhenPartialArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenPartialWriter(manifest);

      expect(
        writer.topMatchWhenPartialArgs(),
        items.map(writer.topMatchVoidNArg),
      );
    });

    test('method topMatchWhenPartialIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenPartialWriter(manifest);
      final ifs = writer.topMatchWhenPartialIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenPartialIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenPartialBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenPartialWriter(manifest);

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
        final manifest = manifest1Data;
        final writer = TopMatchWhenPartialWriter(manifest);

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
        final manifest = manifest3Data;
        final writer = TopMatchWhenPartialWriter(manifest);

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
        final manifest = manifest1Data;
        final writer = TopMatchWhenPartialWriter(manifest);

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
