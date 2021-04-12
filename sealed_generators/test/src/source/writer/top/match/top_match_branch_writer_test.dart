import 'package:sealed_generators/src/source/writer/top/match/top_match_branch_writer.dart';
import 'package:test/test.dart';

import '../../../../../utils/examples.dart';

void main() {
  group('class TopMatchBranchWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchBranchIf', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchBranchWriter(source);
      final i = writer.topMatchBranchIf(item1);

      expect(i.condition, 'weather is WeatherSunny');
      expect(i.code, 'sunny(weather);');
    });

    test('method topMatchBranchArgs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchBranchWriter(source);

      expect(
        writer.topMatchBranchArgs(),
        items.map(writer.topMatchVoidNNArg),
      );
    });

    test('method topMatchBranchIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchBranchWriter(source);
      final ifs = writer.topMatchBranchIfs();
      final a = ifs[0];
      final b = writer.topMatchBranchIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchBranchBody', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchWriter(source);

      expect(
        writer.topMatchBranchBody(),
        'final weather = this;\n'
        'if (weather is WeatherSunny) {sunny(weather);}\n'
        'else if (weather is WeatherRainy) {rainy(weather);}\n'
        'else if (weather is WeatherWindy) {windy(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    test('method topMatchBranchStart', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchWriter(source);

      expect(
        writer.topMatchBranchStart(),
        'void branch({'
        'required void Function(WeatherSunny sunny) sunny,'
        ' required void Function(WeatherRainy rainy) rainy,'
        ' required void Function(WeatherWindy windy) windy,'
        '})',
      );
    });

    group('method topMatchBranch', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchBranchWriter(source);

        expect(
          writer.topMatchBranch(),
          stringContainsInOrder([
            writer.topMatchBranchStart(),
            '{',
            writer.topMatchBranchBody(),
            '}',
          ]),
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchBranchWriter(source);

        expect(
          writer.topMatchBranch(),
          stringContainsInOrder([
            writer.topMatchBranchStart(),
            '{',
            writer.topMatchAsserts(),
            writer.topMatchBranchBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchBranchWriter
  });
}
