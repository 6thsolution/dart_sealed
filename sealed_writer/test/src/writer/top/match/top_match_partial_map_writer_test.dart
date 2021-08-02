import 'package:sealed_writer/src/writer/top/match/top_match_partial_map_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchPartialMapWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchPartialMapWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchPartialMapIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchPartialMapWriter(manifest);
        final i = writer.topMatchPartialMapIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(
          i.code,
          'if (sunny != null) {sunny(weather);}\n'
          'else if (orElse != null) {orElse(weather);}',
        );
      });
    });

    test('method topMatchPartialMapArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchPartialMapWriter(manifest);

      expect(
        writer.topMatchPartialMapArgs(),
        [
          ...items.map(writer.topMatchVoidNArg),
          writer.topMatchVoidNArgOrElse(),
        ],
      );
    });

    test('method topMatchPartialMapIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchPartialMapWriter(manifest);
      final ifs = writer.topMatchPartialMapIfs();
      final a = ifs[0];
      final b = writer.topMatchPartialMapIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchPartialMapBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchPartialMapWriter(manifest);

      expect(
        writer.topMatchPartialMapBody(),
        'final weather = this;\n'
        'if (weather is HiSunny) {'
        'if (sunny != null) {sunny(weather);}\n'
        'else if (orElse != null) {orElse(weather);}}\n'
        'else if (weather is WeatherRainy) {'
        'if (rainy != null) {rainy(weather);}\n'
        'else if (orElse != null) {orElse(weather);}}\n'
        'else if (weather is HelloWindy) {'
        'if (windy != null) {windy(weather);}\n'
        'else if (orElse != null) {orElse(weather);}}\n'
        'else {throw AssertionError();}',
      );
    });

    group('method topMatchPartialMapStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchPartialMapWriter(manifest);

        expect(
          writer.topMatchPartialMapStart(),
          'void partialMap({'
          'void Function(HiSunny sunny)? sunny,'
          ' void Function(WeatherRainy rainy)? rainy,'
          ' void Function(HelloWindy windy)? windy,'
          ' void Function(Weather weather)? orElse,'
          '})',
        );
      });
    });

    group('method topMatchPartialMap', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchPartialMapWriter(manifest);

        expect(
          writer.topMatchPartialMap(),
          stringContainsInOrder([
            writer.topMatchPartialMapStart(),
            '{',
            writer.topMatchPartialMapBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchPartialMapWriter
  });
}
