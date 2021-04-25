import 'package:sealed_generators/src/source/writer/top/match/top_match_branch_or_throw_writer.dart';
import 'package:test/test.dart';

import '../../../../../utils/examples.dart';

void main() {
  group('class TopMatchBranchOrThrowWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchOrThrowWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchBranchOrThrowIf', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchBranchOrThrowWriter(source);
      final i = writer.topMatchBranchOrThrowIf(item1);

      expect(i.condition, 'weather is HiSunny && sunny != null');
      expect(
        i.code,
        'sunny(weather);',
      );
    });

    test('method topMatchBranchOrThrowArgs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchBranchOrThrowWriter(source);

      expect(
        writer.topMatchBranchOrThrowArgs(),
        items.map(writer.topMatchVoidNArg),
      );
    });

    test('method topMatchBranchOrThrowIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchBranchOrThrowWriter(source);
      final ifs = writer.topMatchBranchOrThrowIfs();
      final a = ifs[0];
      final b = writer.topMatchBranchOrThrowIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchBranchOrThrowBody', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchOrThrowWriter(source);

      expect(
        writer.topMatchBranchOrThrowBody(),
        'final weather = this;\n'
        'if (weather is HiSunny && sunny != null)'
        ' {sunny(weather);}\n'
        'else if (weather is WeatherRainy && rainy != null)'
        ' {rainy(weather);}\n'
        'else if (weather is HelloWindy && windy != null)'
        ' {windy(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    test('method topMatchBranchOrThrowStart', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchOrThrowWriter(source);

      expect(
        writer.topMatchBranchOrThrowStart(),
        'void branchOrThrow({'
        'void Function(HiSunny sunny)? sunny,'
        ' void Function(WeatherRainy rainy)? rainy,'
        ' void Function(HelloWindy windy)? windy,'
        '})',
      );
    });

    group('method topMatchBranchOrThrow', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchBranchOrThrowWriter(source);

        expect(
          writer.topMatchBranchOrThrow(),
          stringContainsInOrder([
            writer.topMatchBranchOrThrowStart(),
            '{',
            writer.topMatchBranchOrThrowBody(),
            '}',
          ]),
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchBranchOrThrowWriter(source);

        expect(
          writer.topMatchBranchOrThrow(),
          stringContainsInOrder([
            writer.topMatchBranchOrThrowStart(),
            '{',
            writer.topMatchBranchOrThrowBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchBranchOrThrowWriter
  });
}
