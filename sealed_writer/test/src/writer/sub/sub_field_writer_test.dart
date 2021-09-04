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

    group('method subFieldIsCommon', () {
      test('common', () {
        final manifest = manifest3Data;
        final writer = SubFieldWriter(manifest);
        var item1 = manifest.items[0];
        var item2 = manifest.items[1];
        final item1field1 = item1.fields[0];
        final item2field1 = item2.fields[0];
        final item2field2 = item2.fields[1];

        expect(writer.subFieldIsCommon(item1field1), isTrue);
        expect(writer.subFieldIsCommon(item2field1), isTrue);
        expect(writer.subFieldIsCommon(item2field2), isFalse);
      });

      test('non-common', () {
        final manifest = manifest1Data;
        final writer = SubFieldWriter(manifest);
        var item1 = manifest.items[2];
        final item1field1 = item1.fields[0];

        expect(writer.subFieldIsCommon(item1field1), isFalse);
      });
    });

    group('method subFieldDeclaration', () {
      group('non-common', () {
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

      test('common', () {
        final manifest = manifest3Data;
        final item1 = manifest.items[0];
        final item2 = manifest.items[1];
        final item1field1 = item1.fields[0];
        final item2field1 = item2.fields[0];
        final writer = SubFieldWriter(manifest);

        expect(
          writer.subFieldDeclaration(item1field1),
          '@override\n'
          'final num x;',
        );
        expect(
          writer.subFieldDeclaration(item2field1),
          '@override\n'
          'final int x;',
        );
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
