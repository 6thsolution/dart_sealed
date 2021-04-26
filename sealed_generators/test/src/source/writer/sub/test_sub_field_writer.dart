import 'package:sealed_generators/src/source/writer/sub/sub_field_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class SubFieldWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = SubFieldWriter(source);

      expect(writer.source, source);
    });

    group('method subFieldDeclaration', () {
      group('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];
        final writer = SubFieldWriter(source);

        test('non-nullable field', () {
          expect(
            writer.subFieldDeclaration(field1),
            'final double velocity;',
          );
        });

        test('nullable field', () {
          expect(
            writer.subFieldDeclaration(field2),
            'final double? angle;',
          );
        });
      });

      group('legacy', () {
        final source = source1DataLegacy;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];
        final writer = SubFieldWriter(source);

        test('non-nullable field', () {
          expect(
            writer.subFieldDeclaration(field1),
            'final double/*!*/ velocity;',
          );
        });

        test('nullable field', () {
          expect(
            writer.subFieldDeclaration(field2),
            'final double/*?*/ angle;',
          );
        });
      });
    });

    test('method subFieldDeclarationList', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item3 = source.manifest.items[2];
      final writer = SubFieldWriter(source);

      expect(
        writer.subFieldDeclarationList(item3),
        item3.fields.map(writer.subFieldDeclaration),
      );
    });

    group('method subFieldDeclarations', () {
      test('simple', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final writer = SubFieldWriter(source);

        expect(
          writer.subFieldDeclarations(item),
          'final double velocity;\n'
          'final double? angle;',
        );
      });

      test('generic', () {
        final source = source2DataSafe;
        final item = source.manifest.items[0];
        final writer = SubFieldWriter(source);

        expect(
          writer.subFieldDeclarations(item),
          'final T data;',
        );
      });
    });
    // end of group SubFieldWriter
  });
}
