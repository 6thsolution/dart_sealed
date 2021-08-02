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
        expect(
          i.code,
          'if (sunny != null) {sunny();}\n'
          'else if (orElse != null) {orElse(weather);}',
        );
      });
    });

    test('method topMatchPartialWhenArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchPartialWhenWriter(manifest);

      expect(
        writer.topMatchPartialWhenArgs(),
        [
          ...items.map(writer.topMatchWrappedVoidNArg),
          writer.topMatchVoidNArgOrElse(),
        ],
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
        'if (sunny != null) {sunny();}\n'
        'else if (orElse != null) {orElse(weather);}}\n'
        'else if (weather is WeatherRainy) {'
        'if (rainy != null) {rainy(weather.rain);}\n'
        'else if (orElse != null) {orElse(weather);}}\n'
        'else if (weather is HelloWindy) {'
        'if (windy != null) {windy(weather.velocity, weather.angle);}\n'
        'else if (orElse != null) {orElse(weather);}}\n'
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
          'void Function()? sunny, void Function(int rain)? rainy, '
          'void Function(double velocity, double? angle)? windy, '
          'void Function(Weather weather)? orElse,'
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
