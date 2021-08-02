import 'package:sealed_writer/src/writer/sub/sub_to_string_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SubToStringWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = SubToStringWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method subToString', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          // void sunny();
          final item1 = manifest.items[0];
          // void rainy(int rain);
          final item2 = manifest.items[1];
          // void windy(double velocity, double? angle);
          final item3 = manifest.items[2];
          final writer = SubToStringWriter(manifest);

          expect(
            writer.subToString(item1),
            '@override\n'
            r"String toString() => 'Weather.sunny()';",
          );
          expect(
            writer.subToString(item2),
            '@override\n'
            r"String toString() => 'Weather.rainy(rain: $rain)';",
          );
          expect(
            writer.subToString(item3),
            '@override\n'
            "String toString() => 'Weather.windy"
            r"(velocity: $velocity, angle: $angle)';",
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final item1 = manifest.items[0];
          final writer = SubToStringWriter(manifest);

          expect(
            writer.subToString(item1),
            '@override\n'
            r"String toString() => 'Result.success(data: $data)';",
          );
        });
      });
    });
    // end of group SubToStringWriter
  });
}
