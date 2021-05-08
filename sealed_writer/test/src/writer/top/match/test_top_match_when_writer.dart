import 'package:sealed_writer/src/writer/top/match/top_match_when_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchWhenWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchWhenIf', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchWhenWriter(source);
      final i = writer.topMatchWhenIf(item1);

      expect(i.condition, 'weather is HiSunny');
      expect(i.code, 'return sunny(weather);');
    });

    test('method topMatchWhenArgs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenWriter(source);

      expect(
        writer.topMatchWhenArgs(),
        items.map(writer.topMatchGenericNNArg),
      );
    });

    test('method topMatchWhenIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchWhenWriter(source);
      final ifs = writer.topMatchWhenIfs();
      final a = ifs[0];
      final b = writer.topMatchWhenIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchWhenBody', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenWriter(source);

      expect(
        writer.topMatchWhenBody(),
        'final weather = this;\n'
        'if (weather is HiSunny) {return sunny(weather);}\n'
        'else if (weather is WeatherRainy) {return rainy(weather);}\n'
        'else if (weather is HelloWindy) {return windy(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    test('method topMatchWhenStart', () {
      final source = source1DataSafe;
      final writer = TopMatchWhenWriter(source);

      expect(
        writer.topMatchWhenStart(),
        'R when<R extends Object?>({'
        'required R Function(HiSunny sunny) sunny,'
        ' required R Function(WeatherRainy rainy) rainy,'
        ' required R Function(HelloWindy windy) windy,'
        '})',
      );
    });

    group('method topMatchWhen', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchWhenWriter(source);

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

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchWhenWriter(source);

        expect(
          writer.topMatchWhen(),
          stringContainsInOrder([
            writer.topMatchWhenStart(),
            '{',
            writer.topMatchAsserts(),
            writer.topMatchWhenBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchWhenWriter
  });
}
