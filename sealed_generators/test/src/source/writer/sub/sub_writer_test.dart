import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/sub/sub_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/code_utils.dart';
import '../../../../utils/examples.dart';

void main() {
  group('class SubWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = SubWriter(source);

      expect(writer.source, source);
    });

    test('method hasNullable', () {
      final source = source1DataSafe;
      // void sunny();
      final manifest = source.manifest;
      final item1 = manifest.items[0];
      // void rainy(int rain);
      final item2 = manifest.items[1];
      // void windy(double velocity, double? angle);
      final item3 = manifest.items[2];
      final writer = SubWriter(source);

      expect(writer.hasNullable(item1), false);
      expect(writer.hasNullable(item2), false);
      expect(writer.hasNullable(item3), true);
    });

    group('method subClass', () {
      test('equality data', () {
        final options = optionsDataSafe;
        final manifest = manifest1;
        final source = Source(options: options, manifest: manifest);
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SubWriter(source);

        expect(
          writer.subClass(item2).tr(),
          allOf(
            startsWith('class WeatherRainy extends Weather'),
            endsWith('}'),
            stringContainsInOrder([
              '{',
              'WeatherRainy({required this.rain});',
              'final int rain;',
              'WeatherRainy copy(',
              'String toString(',
              'get props'
            ]),
          ),
        );
      });

      test('equality data with nullable', () {
        final options = optionsDataSafe;
        final manifest = manifest1;
        final source = Source(options: options, manifest: manifest);
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final writer = SubWriter(source);

        expect(
          writer.subClass(item3).tr(),
          isNot(stringContainsInOrder(['copy('])),
        );
      });

      test('equality identity', () {
        final options = optionsIdentitySafe;
        final manifest = manifest1;
        final source = Source(options: options, manifest: manifest);
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SubWriter(source);

        expect(
          writer.subClass(item2).tr(),
          isNot(stringContains(['get props'])),
        );
      });

      test('equality distinct', () {
        final options = optionsDistinctSafe;
        final manifest = manifest1;
        final source = Source(options: options, manifest: manifest);
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SubWriter(source);

        expect(
          writer.subClass(item2).tr(),
          isNot(stringContains(['get props'])),
        );
      });
    });

    test('method subClasses', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final writer = SubWriter(source);

      expect(
        writer.subClasses(),
        containsAllInOrder(
          manifest.items.map(writer.subClass).toList(),
        ),
      );
    });
    // end of group SubWriter
  });
}
