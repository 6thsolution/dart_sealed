import 'package:sealed_generators/src/source/writer/sub/sub_copy_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class SubCopyWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = SubCopyWriter(source);

      expect(writer.source, source);
    });

    group('method subCopyDeclarationPart', () {
      test('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final field1 = item3.fields[0];
        final field2 = item3.fields[1];
        final writer = SubCopyWriter(source);

        expect(
          writer.subCopyDeclarationPart(field1),
          'double? velocity',
        );
        expect(
          writer.subCopyDeclarationPart(field2),
          'double? angle',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final field1 = item3.fields[0];
        final field2 = item3.fields[1];
        final writer = SubCopyWriter(source);

        expect(
          writer.subCopyDeclarationPart(field1),
          'double/*?*/ velocity',
        );
        expect(
          writer.subCopyDeclarationPart(field2),
          'double/*?*/ angle',
        );
      });
    });

    test('method subCopyDeclarationParts', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item3 = source.manifest.items[2];
      final writer = SubCopyWriter(source);

      expect(
        writer.subCopyDeclarationParts(item3),
        item3.fields.map(writer.subCopyDeclarationPart),
      );
    });

    test('method subCopyCalcPart', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item3 = source.manifest.items[2];
      final field1 = item3.fields[0];
      final field2 = item3.fields[1];
      final writer = SubCopyWriter(source);

      expect(
        writer.subCopyCalcPart(field1),
        'velocity: velocity ?? this.velocity',
      );
      expect(
        writer.subCopyCalcPart(field2),
        'angle: angle ?? this.angle',
      );
    });

    test('method subCopyCalcParts', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item3 = source.manifest.items[2];
      final writer = SubCopyWriter(source);

      expect(
        writer.subCopyCalcParts(item3),
        item3.fields.map(writer.subCopyCalcPart),
      );
    });

    group('method subCopyDeclaration', () {
      test('null-safe', () {
        final source = source1DataSafe;
        // void sunny();
        final item1 = source.manifest.items[0];
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SubCopyWriter(source);

        expect(
          writer.subCopyDeclaration(item1),
          '@factory\n'
          'WeatherSunny copy() =>'
          ' WeatherSunny();',
        );
        expect(
          writer.subCopyDeclaration(item2),
          '@factory\n'
          'WeatherRainy copy({int? rain,}) =>'
          ' WeatherRainy(rain: rain ?? this.rain,);',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SubCopyWriter(source);

        expect(
          writer.subCopyDeclaration(item2),
          '@factory\n'
          'WeatherRainy/*!*/ copy({int/*?*/ rain,}) =>'
          ' WeatherRainy(rain: rain ?? this.rain,);',
        );
      });
    });
    // end of group SubCopyWriter
  });
}
