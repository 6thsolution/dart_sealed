import 'package:sealed_writer/src/writer/sub/sub_field_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SubFieldWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = SubFieldWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method subFieldDeclaration', () {
      group('null-safe', () {
        final manifest = manifest1Data;
        // void windy(double velocity, double? angle);
        final item = manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];
        final writer = SubFieldWriter(manifest);

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
    });

    test('method subFieldDeclarationList', () {
      final manifest = manifest1Data;
      // void windy(double velocity, double? angle);
      final item3 = manifest.items[2];
      final writer = SubFieldWriter(manifest);

      expect(
        writer.subFieldDeclarationList(item3),
        item3.fields.map(writer.subFieldDeclaration),
      );
    });

    group('method subFieldDeclarations', () {
      test('simple', () {
        final manifest = manifest1Data;
        // void windy(double velocity, double? angle);
        final item = manifest.items[2];
        final writer = SubFieldWriter(manifest);

        expect(
          writer.subFieldDeclarations(item),
          'final double velocity;\n'
          'final double? angle;',
        );
      });

      test('generic', () {
        final manifest = manifest2Data;
        final item = manifest.items[0];
        final writer = SubFieldWriter(manifest);

        expect(
          writer.subFieldDeclarations(item),
          'final T data;',
        );
      });
    });
    // end of group SubFieldWriter
  });
}
