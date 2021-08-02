import 'package:sealed_writer/src/writer/sub/sub_constructor_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SubConstructorWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = SubConstructorWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method subConstructorDecArg', () {
      group('null-safe', () {
        final manifest = manifest1Data;
        // void windy(double velocity, double? angle);
        final item = manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];
        final writer = SubConstructorWriter(manifest);

        test('non-nullable field', () {
          expect(
            writer.subConstructorDecArg(field1),
            'required this.velocity',
          );
        });

        test('nullable field', () {
          expect(
            writer.subConstructorDecArg(field2),
            'required this.angle',
          );
        });
      });
    });

    test('method subConstructorDecArgs', () {
      final manifest = manifest1Data;
      // void windy(double velocity, double? angle);
      final item3 = manifest.items[2];
      final writer = SubConstructorWriter(manifest);

      expect(
        writer.subConstructorDecArgs(item3),
        '({required this.velocity, required this.angle,})',
      );
    });

    test('method subConstructorWrappedDecArg', () {
      final manifest = manifest1Data;
      final field = manifest.items[1].fields[0];
      final writer = SubConstructorWriter(manifest);

      expect(
        writer.subConstructorWrappedDecArg(field),
        'this.rain',
      );
    });

    test('method subConstructorWrappedDecArgs', () {
      final manifest = manifest1Data;
      final item3 = manifest.items[2];
      final writer = SubConstructorWriter(manifest);

      expect(
        writer.subConstructorWrappedDecArgs(item3),
        '(this.velocity, this.angle,)',
      );
    });

    group('method subConstructorDeclaration', () {
      test('simple', () {
        final manifest = manifest1Data;
        // void sunny();
        final item1 = manifest.items[0];
        // void rainy(int rain);
        final item2 = manifest.items[1];
        // void windy(double velocity, double? angle);
        final item3 = manifest.items[2];
        final writer = SubConstructorWriter(manifest);

        expect(
          writer.subConstructorDeclaration(item1),
          'const HiSunny()'
          ': super._internal();',
        );
        expect(
          writer.subConstructorDeclaration(item2),
          'const WeatherRainy({required this.rain,})'
          ': super._internal();',
        );
        expect(
          writer.subConstructorDeclaration(item3),
          'const HelloWindy({required this.velocity, required this.angle,})'
          ': super._internal();',
        );
      });

      test('generic', () {
        final manifest = manifest2Data;
        // void sunny();
        final item1 = manifest.items[0];
        final writer = SubConstructorWriter(manifest);

        expect(
          writer.subConstructorDeclaration(item1),
          'const MySuccess({required this.data,})'
          ': super._internal();',
        );
      });
    });
    // end of group SubConstructorWriter
  });
}
