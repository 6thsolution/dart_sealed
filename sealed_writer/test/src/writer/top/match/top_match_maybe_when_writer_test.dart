import 'package:sealed_writer/src/writer/top/match/top_match_maybe_when_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchMaybeWhenWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchMaybeWhenWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchMaybeWhenIf', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;

        // sunny
        final item1 = manifest.items[0];
        final writer = TopMatchMaybeWhenWriter(manifest);
        final i = writer.topMatchMaybeWhenIf(item1);

        expect(i.condition, 'weather is HiSunny');
        expect(
          i.code,
          'return sunny != null ? sunny(weather) : orElse(weather);',
        );
      });
    });

    test('method topMatchMaybeWhenItemArgs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchMaybeWhenWriter(manifest);

      expect(
        writer.topMatchMaybeWhenItemArgs(),
        items.map(writer.topMatchGenericNArg),
      );
    });

    test('method topMatchMaybeWhenArgs', () {
      final manifest = manifest1Data;
      final writer = TopMatchMaybeWhenWriter(manifest);

      expect(
        writer.topMatchMaybeWhenArgs(),
        allOf(
          containsAll(writer.topMatchMaybeWhenItemArgs()),
          contains(writer.topMatchGenericNNArgOrElse()),
        ),
      );
    });

    test('method topMatchMaybeWhenIfs', () {
      final manifest = manifest1Data;

      final items = manifest.items;
      final writer = TopMatchMaybeWhenWriter(manifest);
      final ifs = writer.topMatchMaybeWhenIfs();
      final a = ifs[0];
      final b = writer.topMatchMaybeWhenIf(items[0]);

      expect(ifs, hasLength(equals(items.length)));
      expect(a.code, b.code);
      expect(a.condition, b.condition);
    });

    test('method topMatchMaybeWhenBody', () {
      final manifest = manifest1Data;
      final writer = TopMatchMaybeWhenWriter(manifest);

      expect(
        writer.topMatchMaybeWhenBody(),
        'final weather = this;\n'
        'if (weather is HiSunny)'
        ' {return sunny != null ? sunny(weather) : orElse(weather);}\n'
        'else if (weather is WeatherRainy)'
        ' {return rainy != null ? rainy(weather) : orElse(weather);}\n'
        'else if (weather is HelloWindy)'
        ' {return windy != null ? windy(weather) : orElse(weather);}\n'
        'else {throw AssertionError();}',
      );
    });

    group('method topMatchMaybeWhenStart', () {
      test('non-wrapped', () {
        final manifest = manifest1Data;
        final writer = TopMatchMaybeWhenWriter(manifest);

        expect(
          writer.topMatchMaybeWhenStart(),
          'R maybeWhen<R extends Object?>({'
          'R Function(HiSunny sunny)? sunny,'
          ' R Function(WeatherRainy rainy)? rainy,'
          ' R Function(HelloWindy windy)? windy,'
          ' required R Function(Weather weather) orElse,'
          '})',
        );
      });
    });

    group('method topMatchMaybeWhen', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = TopMatchMaybeWhenWriter(manifest);

        expect(
          writer.topMatchMaybeWhen(),
          stringContainsInOrder([
            writer.topMatchMaybeWhenStart(),
            '{',
            writer.topMatchMaybeWhenBody(),
            '}',
          ]),
        );
      });
    });
    // end of group TopMatchMaybeWhenWriter
  });
}
