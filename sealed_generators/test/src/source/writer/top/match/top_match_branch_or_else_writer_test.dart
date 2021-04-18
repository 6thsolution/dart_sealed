import 'package:sealed_generators/src/source/writer/top/match/top_match_branch_or_else_writer.dart';
import 'package:test/test.dart';

import '../../../../../utils/examples.dart';

void main() {
  group('class TopMatchBranchOrElseWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchOrElseWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchBranchOrElseIf', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchBranchOrElseWriter(source);
      final i = writer.topMatchBranchOrElseIf(item1);

      expect(i.condition, 'weather is HiSunny');
      expect(i.code, '(sunny ?? orElse)(weather);');
    });

    test('method topMatchBranchOrElseItemArgs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchBranchOrElseWriter(source);

      expect(
        writer.topMatchBranchOrElseItemArgs(),
        items.map(writer.topMatchVoidNArg),
      );
    });

    test('method topMatchBranchOrElseArgs', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchOrElseWriter(source);

      expect(
        writer.topMatchBranchOrElseArgs(),
        allOf(
          containsAll(writer.topMatchBranchOrElseItemArgs()),
          contains(writer.topMatchVoidNNArgOrElse()),
        ),
      );
    });

    test('method topMatchBranchOrElseIfs', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final items = manifest.items;
      final writer = TopMatchBranchOrElseWriter(source);
      final ifs = writer.topMatchBranchOrElseIfs();
      final a = ifs[0];
      final b = writer.topMatchBranchOrElseIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchBranchOrElseBody', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchOrElseWriter(source);

      expect(
        writer.topMatchBranchOrElseBody(),
        'final weather = this;\n'
        'if (weather is HiSunny) {(sunny ?? orElse)(weather);}\n'
        'else if (weather is WeatherRainy) {(rainy ?? orElse)(weather);}\n'
        'else if (weather is HelloWindy) {(windy ?? orElse)(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    test('method topMatchBranchOrElseStart', () {
      final source = source1DataSafe;
      final writer = TopMatchBranchOrElseWriter(source);

      expect(
        writer.topMatchBranchOrElseStart(),
        'void branchOrElse({'
        'void Function(HiSunny sunny)? sunny,'
        ' void Function(WeatherRainy rainy)? rainy,'
        ' void Function(HelloWindy windy)? windy,'
        ' required void Function(Weather weather) orElse,'
        '})',
      );
    });

    group('method topMatchBranchOrElse', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = TopMatchBranchOrElseWriter(source);

        expect(
          writer.topMatchBranchOrElse(),
          stringContainsInOrder([
            writer.topMatchBranchOrElseStart(),
            '{',
            writer.topMatchBranchOrElseBody(),
            '}',
          ]),
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = TopMatchBranchOrElseWriter(source);

        expect(
          writer.topMatchBranchOrElse(),
          stringContainsInOrder([
            writer.topMatchBranchOrElseStart(),
            '{',
            writer.topMatchAssertOrElse(),
            writer.topMatchBranchOrElseBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchBranchOrElseWriter
  });
}
