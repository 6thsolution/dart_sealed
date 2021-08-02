import 'package:sealed_writer/src/writer/top/match/top_match_when_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchWhenIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchWhenWriter(manifest);
        final i = writer.topMatchWhenIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(i.code, 'return sunny(weather);');
      });

      test('wrapped', () {
        final manifest = manifest3Data;
        final item2 = manifest.items[1];
        final writer = TopMatchWhenWriter(manifest);
        final i = writer.topMatchWhenIf(item2);

        expect(i.code, 'return two(base.x);');
      });
    });

    test('method topMatchWhenArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenWriter(manifest);

      expect(
        writer.topMatchWhenArgs(),
        items.map(writer.topMatchGenericNNArg),
      );
    });

    test('method topMatchWhenIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchWhenWriter(manifest);
      final ifs = writer.topMatchWhenIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchWhenWriter(manifest);

      expect(
        writer.topMatchWhenBody(),
        'final weather = this;\n'
        'if (weather is HiSunny) {return sunny(weather);}\n'
        'else if (weather is WeatherRainy) {return rainy(weather);}\n'
        'else if (weather is HelloWindy) {return windy(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    group('method topMatchWhenStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchWhenWriter(manifest);

        expect(
          writer.topMatchWhenStart(),
          'R when<R extends Object?>({'
          'required R Function(HiSunny sunny) sunny,'
          ' required R Function(WeatherRainy rainy) rainy,'
          ' required R Function(HelloWindy windy) windy,'
          '})',
        );
      });

      test('wrapped', () {
        final manifest = manifest3Data;
        final writer = TopMatchWhenWriter(manifest);

        expect(
          writer.topMatchWhenStart(),
          'R when<R extends Object?>({'
          'required R Function() one,'
          ' required R Function(int x) two,'
          ' required R Function(int y, int? z) three,'
          '})',
        );
      });
    });

    group('method topMatchWhen', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchWhenWriter(manifest);

        expect(
          writer.topMatchWhen(),
          stringContainsInOrder([
            writer.topMatchWhenStart(),
            '{',
            writer.topMatchWhenBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchWhenWriter
  });
}
