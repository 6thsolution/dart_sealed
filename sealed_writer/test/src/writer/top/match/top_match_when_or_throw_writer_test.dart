import 'package:sealed_writer/src/writer/top/match/top_match_when_or_throw_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenOrThrowWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenOrThrowWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchWhenOrThrowIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchWhenOrThrowWriter(manifest);
        final i = writer.topMatchWhenOrThrowIf(item1);

        expect(i.condition, 'weather is HiSunny && sunny != null');
        expect(i.code, 'return sunny(weather);');
      });

      test('wrapped', () {
        final manifest = manifest3Data;
        final item2 = manifest.items[1];
        final writer = TopMatchWhenOrThrowWriter(manifest);
        final i = writer.topMatchWhenOrThrowIf(item2);

        expect(i.code, 'return two(base.x);');
      });
    });

    test('method topMatchWhenOrThrowArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenOrThrowWriter(manifest);

      expect(
        writer.topMatchWhenOrThrowArgs(),
        items.map(writer.topMatchGenericNArg),
      );
    });

    test('method topMatchWhenOrThrowIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenOrThrowWriter(manifest);
      final ifs = writer.topMatchWhenOrThrowIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenOrThrowIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenOrThrowBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenOrThrowWriter(manifest);

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

    group('method topMatchWhenOrThrowStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchWhenOrThrowWriter(manifest);

        expect(
          writer.topMatchWhenOrThrowStart(),
          'R whenOrThrow<R extends Object?>({'
          'R Function(HiSunny sunny)? sunny,'
          ' R Function(WeatherRainy rainy)? rainy,'
          ' R Function(HelloWindy windy)? windy,'
          '})',
        );
      });

      test('wrapped', () {
        final manifest = manifest3Data;
        final writer = TopMatchWhenOrThrowWriter(manifest);

        expect(
          writer.topMatchWhenOrThrowStart(),
          'R whenOrThrow<R extends Object?>({'
          'R Function()? one,'
          ' R Function(int x)? two,'
          ' R Function(int y, int? z)? three,'
          '})',
        );
      });
    });

    group('method topMatchWhenOrThrow', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchWhenOrThrowWriter(manifest);

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
