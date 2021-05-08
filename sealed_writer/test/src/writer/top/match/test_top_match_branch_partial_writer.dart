import 'package:sealed_writer/src/writer/top/match/top_match_branch_partial_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchBranchPartialWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchPartialWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchBranchPartialIf', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchBranchPartialWriter(source);
      final i = writer.topMatchBranchPartialIf(item1);

      expect(i.condition, 'weather is HiSunny');
      expect(i.code, 'sunny?.call(weather);');
    });

    test('method topMatchBranchPartialArgs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchBranchPartialWriter(source);

      expect(
        writer.topMatchBranchPartialArgs(),
        items.map(writer.topMatchVoidNArg),
      );
    });

    test('method topMatchBranchPartialIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchBranchPartialWriter(source);
      final ifs = writer.topMatchBranchPartialIfs();
      final a = ifs[0];
      final b = writer.topMatchBranchPartialIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchBranchPartialBody', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchPartialWriter(source);

      expect(
        writer.topMatchBranchPartialBody(),
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

    test('method topMatchBranchPartialStart', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchPartialWriter(source);

      expect(
        writer.topMatchBranchPartialStart(),
        'void branchPartial({'
        'void Function(HiSunny sunny)? sunny,'
        ' void Function(WeatherRainy rainy)? rainy,'
        ' void Function(HelloWindy windy)? windy,'
        '})',
      );
    });

    group('method topMatchBranchPartial', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchBranchPartialWriter(source);

        expect(
          writer.topMatchBranchPartial(),
          stringContainsInOrder([
            writer.topMatchBranchPartialStart(),
            '{',
            writer.topMatchBranchPartialBody(),
            '}',
          ]),
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchBranchPartialWriter(source);

        expect(
          writer.topMatchBranchPartial(),
          stringContainsInOrder([
            writer.topMatchBranchPartialStart(),
            '{',
            writer.topMatchBranchPartialBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchBranchPartialWriter
  });
}
