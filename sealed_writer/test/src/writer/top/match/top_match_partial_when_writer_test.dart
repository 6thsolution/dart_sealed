import 'package:sealed_writer/src/writer/top/match/top_match_partial_when_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchPartialWhenWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchPartialWhenWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchPartialWhenIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchPartialWhenWriter(manifest);
        final i = writer.topMatchPartialWhenIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(i.code, 'sunny?.call(weather);');
      });
    });

    test('method topMatchPartialWhenArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchPartialWhenWriter(manifest);

      expect(
        writer.topMatchPartialWhenArgs(),
        items.map(writer.topMatchVoidNArg),
      );
    });

    test('method topMatchPartialWhenIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchPartialWhenWriter(manifest);
      final ifs = writer.topMatchPartialWhenIfs();
      final a = ifs[0];
      final b = writer.topMatchPartialWhenIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchPartialWhenBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchPartialWhenWriter(manifest);

      expect(
        writer.topMatchPartialWhenBody(),
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

    group('method topMatchPartialWhenStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchPartialWhenWriter(manifest);

        expect(
          writer.topMatchPartialWhenStart(),
          'void partialWhen({'
          'void Function(HiSunny sunny)? sunny,'
          ' void Function(WeatherRainy rainy)? rainy,'
          ' void Function(HelloWindy windy)? windy,'
          '})',
        );
      });
    });

    group('method topMatchPartialWhen', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchPartialWhenWriter(manifest);

        expect(
          writer.topMatchPartialWhen(),
          stringContainsInOrder([
            writer.topMatchPartialWhenStart(),
            '{',
            writer.topMatchPartialWhenBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchPartialWhenWriter
  });
}
