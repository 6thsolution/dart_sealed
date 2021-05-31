import 'package:sealed_writer/src/writer/sub/sub_constructor_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SubConstructorWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = SubConstructorWriter(source);

      expect(writer.source, source);
    });

    group('method subConstructorDeclarationPart', () {
      group('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];
        final writer = SubConstructorWriter(source);

        test('non-nullable field', () {
          expect(
            writer.subConstructorDeclarationPart(field1),
            'required this.velocity',
          );
        });

        test('nullable field', () {
          expect(
            writer.subConstructorDeclarationPart(field2),
            'required this.angle',
          );
        });
      });

      group('legacy', () {
        final source = source1DataLegacy;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];
        final writer = SubConstructorWriter(source);

        test('non-nullable field', () {
          expect(
            writer.subConstructorDeclarationPart(field1),
            '@required this.velocity',
          );
        });

        test('nullable field', () {
          expect(
            writer.subConstructorDeclarationPart(field2),
            '@required this.angle',
          );
        });
      });
    });

    test('method subConstructorDeclarationParts', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item3 = source.manifest.items[2];
      final writer = SubConstructorWriter(source);

      expect(
        writer.subConstructorDeclarationParts(item3),
        item3.fields.map(writer.subConstructorDeclarationPart),
      );
    });

    group('method subConstructorDeclaration', () {
      test('simple', () {
        final source = source1DataSafe;
        // void sunny();
        final item1 = source.manifest.items[0];
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final writer = SubConstructorWriter(source);

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
        final source = source2DataSafe;
        // void sunny();
        final item1 = source.manifest.items[0];
        final writer = SubConstructorWriter(source);

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
