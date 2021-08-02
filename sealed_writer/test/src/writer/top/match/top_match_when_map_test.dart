import 'package:sealed_writer/src/writer/top/match/top_match_map_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchMapWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchMapWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchMapIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchMapWriter(manifest);
        final i = writer.topMatchMapIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(i.code, 'return sunny(weather);');
      });
    });

    test('method topMatchMapArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchMapWriter(manifest);

      expect(
        writer.topMatchMapArgs(),
        items.map(writer.topMatchGenericNNArg),
      );
    });

    test('method topMatchMapIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchMapWriter(manifest);
      final ifs = writer.topMatchMapIfs();
      final a = ifs[0];
      final b = writer.topMatchMapIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchMapBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchMapWriter(manifest);

      expect(
        writer.topMatchMapBody(),
        'final weather = this;\n'
        'if (weather is HiSunny) {return sunny(weather);}\n'
        'else if (weather is WeatherRainy) {return rainy(weather);}\n'
        'else if (weather is HelloWindy) {return windy(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    group('method topMatchMapStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchMapWriter(manifest);

        expect(
          writer.topMatchMapStart(),
          'R map<R extends Object?>({'
          'required R Function(HiSunny sunny) sunny,'
          ' required R Function(WeatherRainy rainy) rainy,'
          ' required R Function(HelloWindy windy) windy,'
          '})',
        );
      });
    });

    group('method topMatchMap', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchMapWriter(manifest);

        expect(
          writer.topMatchMap(),
          stringContainsInOrder([
            writer.topMatchMapStart(),
            '{',
            writer.topMatchMapBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchMapWriter
  });
}
