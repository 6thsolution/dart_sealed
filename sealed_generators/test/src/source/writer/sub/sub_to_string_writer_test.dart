import 'package:sealed_generators/src/source/writer/sub/sub_to_string_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class SubToStringWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = SubToStringWriter(source);

      expect(writer.source, source);
    });

    test('method subToStringPart', () {
      final source = source1DataLegacy;
      // void rainy(int rain);
      final item = source.manifest.items[1];
      final field = item.fields[0];
      final writer = SubToStringWriter(source);

      expect(
        writer.subToStringPart(field),
        r'rain: $rain',
      );
    });

    group('method subToString', () {
      test('null-safe', () {
        final source = source1DataSafe;
        // void sunny();
        final item1 = source.manifest.items[0];
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final writer = SubToStringWriter(source);

        expect(
          writer.subToString(item1),
          '@override\n'
          r"String toString() => 'Weather.Sunny()';",
        );
        expect(
          writer.subToString(item2),
          '@override\n'
          r"String toString() => 'Weather.Rainy(rain: $rain)';",
        );
        expect(
          writer.subToString(item3),
          '@override\n'
          "String toString() => 'Weather.Windy"
          r"(velocity: $velocity, angle: $angle)';",
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SubToStringWriter(source);

        expect(
          writer.subToString(item2),
          '@override\n'
          r"String/*!*/ toString() => 'Weather.Rainy(rain: $rain)';",
        );
      });
    });
    // end of group SubToStringWriter
  });
}
