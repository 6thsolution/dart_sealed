import 'package:sealed_writer/src/writer/sub/sub_copy_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SubCopyWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = SubCopyWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method subCopyDeclarationPart', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        // void windy(double velocity, double? angle);
        final item3 = manifest.items[2];
        final field1 = item3.fields[0];
        final field2 = item3.fields[1];
        final writer = SubCopyWriter(manifest);

        expect(
          writer.subCopyDeclarationPart(field1),
          'double? velocity',
        );
        expect(
          writer.subCopyDeclarationPart(field2),
          'double? angle',
        );
      });
    });

    test('method subCopyDeclarationParts', () {
      final manifest = manifest1Data;
      // void windy(double velocity, double? angle);
      final item3 = manifest.items[2];
      final writer = SubCopyWriter(manifest);

      expect(
        writer.subCopyDeclarationParts(item3),
        item3.fields.map(writer.subCopyDeclarationPart),
      );
    });

    test('method subCopyCalcPart', () {
      final manifest = manifest1Data;
      // void windy(double velocity, double? angle);
      final item3 = manifest.items[2];
      final field1 = item3.fields[0];
      final field2 = item3.fields[1];
      final writer = SubCopyWriter(manifest);

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
      final manifest = manifest1Data;
      // void windy(double velocity, double? angle);
      final item3 = manifest.items[2];
      final writer = SubCopyWriter(manifest);

      expect(
        writer.subCopyCalcParts(item3),
        item3.fields.map(writer.subCopyCalcPart),
      );
    });

    group('method subCopyDeclaration', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        // void sunny();
        final item1 = manifest.items[0];
        // void rainy(int rain);
        final item2 = manifest.items[1];
        final writer = SubCopyWriter(manifest);

        expect(
          writer.subCopyDeclaration(item1),
          '@factory\n'
          'HiSunny copy() =>'
          ' HiSunny();',
        );
        expect(
          writer.subCopyDeclaration(item2),
          '@factory\n'
          'WeatherRainy copy({int? rain,}) =>'
          ' WeatherRainy(rain: rain ?? this.rain,);',
        );
      });
    });
    // end of group SubCopyWriter
  });
}
